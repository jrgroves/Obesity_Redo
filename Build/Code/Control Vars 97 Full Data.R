#Creates control variables for the 1997 NLSY Data
#By Jeremy Groves
#January 26, 2021

#UPDATE April 3, 2023: Modified code to keep all data from survey years. 
#                      Added code to fill in data from missing survey years used previous year information and also a second version
#                      interpolating the missing data.

rm(list=ls())

library(tidyverse)
library(zoo)

source('./Build/Code/NLSY Code/Controls1.R')

core <- new_data %>%
  rename(ID=PUBID_1997) 
names(core)<-gsub("CV_","",names(core))



#Health Data

core.h<-core %>%
    select(ID, starts_with("YHEA-100") & !contains("1005") & !contains("1006")) %>%
      pivot_longer(!ID, names_to = "Year", values_to = "Health.raw") %>%
        mutate(Year = as.numeric(gsub("YHEA-100_","",Year))) %>%
          mutate(Health = case_when(
                              Health.raw < 3  ~ "Good",
                              Health.raw == 3 ~ "Average",
                              Health.raw > 3 ~ "Poor"))


#Census Regions and Locality

core.cr<- core %>%   #Census Region
    select(ID,starts_with("CENSUS_REGION")) %>%
      pivot_longer(!ID, names_to="Year",values_to = "Region") %>%
        mutate(Year=as.numeric(gsub("CENSUS_REGION_","",Year))) %>%
          mutate(Region = case_when(
            Region == 1 ~ "NorEst",
            Region == 2 ~ "NorCen",
            Region == 3 ~ "South",
            Region == 4 ~ "West"))

core.ur <- core %>%    #Urban or Rural
    select(ID, starts_with("URBAN")) %>%
      pivot_longer(!ID, names_to="Year",values_to = "URBAN") %>%
         mutate(Year=as.numeric(gsub("URBAN-RURAL_","",Year))) %>%
            mutate(URBAN = as.numeric(URBAN),
                   URBAN = ifelse(URBAN==2,NA,URBAN))
  
#Education
  #Re-coded on Jan 26, 2022 to better split education

core.ed<-core %>%   #Current Enrollment
  select(ID,starts_with("ENROLLSTAT")) %>%
    pivot_longer(!ID, names_to="Year", values_to="Education") %>%
      mutate(Year=(gsub("EDT_","",Year))) %>%
        mutate(Year = as.numeric(gsub("ENROLLSTAT_","",Year)))%>%
          mutate(Education = case_when(
            Education == 1 | Education == 8 ~ "LessHS",
            Education == 2 | Education == 3 ~ "HS",
            Education == 4 | Education == 9 | Education  == 10 ~ "SomeCol",
            Education == 5 | Education == 6 ~ "CollegeGrad",
            Education == 7 | Education == 11 ~ "CollegePlus"))

#Household Makeup

core.c6 <- core %>%   #Number of Children 6 and Under
  select(ID, starts_with("HH_UNDER")) %>%
    pivot_longer(!ID, names_to="Year", values_to="Child6") %>%
        mutate(Year = as.numeric(gsub("HH_UNDER_6_","",Year))) 

core.hhs<-core %>%   #Household Size
  select(ID, starts_with("HH_SIZE")) %>%
    pivot_longer(!ID, names_to="Year", values_to="HH_Size") %>%
      mutate(Year = as.numeric(gsub("HH_SIZE_","",Year))) 

core.mar<- core %>%  #Marriage Status
  select(ID, starts_with(("MARSTAT"))) %>%
    pivot_longer(!ID, names_to="Year", values_to="Marriage") %>%
      mutate(Year = as.numeric(gsub("MARSTAT_COLLAPSED_","",Year))) %>%
          mutate(Marriage = case_when(
              Marriage == 0 ~ "NeverMarried",
              Marriage == 1 ~ "Married",
              Marriage > 1 ~ "Separated"
            ))

#Income Measures

core.wage<-core %>%       #Individual Wage Income (by category)
  select(ID, starts_with("YINC-18")) %>%
    pivot_longer(!ID, names_to="Year", values_to="Wage") %>%
      mutate(Year = as.numeric(gsub("YINC-1800_","",Year)))  %>%
        mutate(Wage = case_when(
          Wage < 4 ~ "Low",          #1 to 25K
          Wage == 4 ~ "Low-Mid",     #25 to 50K
          Wage == 5 ~ "Mid",         #50 to 100K
          Wage == 6 ~ "High-Mid",    #100K to 250K
          Wage == 7 ~ "High"))       #250K and up      

core.othinc<- core %>%    #Log of Gross Family Income
  select(ID, starts_with("INCOME")) %>%
    pivot_longer(!ID, names_to="Year", values_to="GFinc") %>%
        mutate(Year = gsub("INCOME_GROSS_YR_","",Year))  %>%
          mutate(Year = as.numeric(gsub("INCOME_FAMILY_","",Year))) %>%
            mutate(GFinc = as.numeric(GFinc)) 
  #Perform the Inverse Hyperbolic Sine Transformation
      core.othinc$GFinc[which(core.othinc$GFinc<0)]<-0
      core.othinc$GFinc<-log(core.othinc$GFinc + sqrt(((core.othinc$GFinc)^2)+1))
                   


#Combine data into core of control variables
core.cont<-Reduce(function(x,y) merge(x=x, y=y, by=c("ID","Year")),
                  list(core.c6, core.cr, core.ed, core.h,
                       core.hhs, core.wage, core.othinc, core.ur,
                       core.mar))
core.cont$Year <- as.numeric(core.cont$Year)

core.cont
save(core.cont,file="./Build/OUtput/Controls97FD_nofill.RData")

#Add this section to fill in missing values from missing survey years
ID<-seq(1, max(core.cont$ID), 1)

fill<-ID %>%
  data.frame(ID=.) %>%
  slice(rep(1:n(), each = 24)) %>%
  group_by(ID) %>%
  mutate(Year = seq(1997,2020,1)) %>%
  full_join(., core.cont, by = c("ID", "Year")) %>%
  arrange(ID, Year) %>%
  fill(everything())

core.cont <- fill
save(core.cont,file="./Build/OUtput/Controls97FD_fill.RData")

fill<-ID %>%
  data.frame(ID=.) %>%
  slice(rep(1:n(), each = 24)) %>%
  group_by(ID) %>%
  mutate(Year = seq(1997,2020,1)) %>%
  full_join(., core.cont, by = c("ID", "Year")) %>%
  arrange(ID, Year) %>%
  mutate(Child6.i = round(na.approx(Child6, maxgap=5, rule = 2),0),
         HH_Size.i = round(na.approx(HH_Size, maxgap=5, rule=2),0),
         GFinc.i = na.approx(GFinc, maxgap=22, rule=2))

core.cont <- fill
save(core.cont,file="./Build/OUtput/Controls97FD_i.RData")

#Pull Out the Cong. Score#

core.s<-core %>%
  select(ID, ASVAB_MATH_VERBAL_SCORE_PCT_1999) %>%
    mutate(Score = ASVAB_MATH_VERBAL_SCORE_PCT_1999/1000) %>%
      select(ID, Score)

save(core.s, file="./Build/Output/Score.RData")
