#Creates unemployed gaps using the NLSY97 Data and includes the start and end week of gap
#By Jeremy Groves
#January 26, 2021
#UPDATED: December 23, 2022: See notebook for specifics. Also streamlined gap length computation

rm(list=ls())

library(tidyverse)
library(ISOweek)


source("./Build/Code/NLSY Code/FullGaps.R") #Changed from Gaps97 to include more gaps
load("./Build/Input/OCC_IND.RData")

rm(list=c("qnames","vallabels","varlabels"))

#Decode Data

core<-new_data %>%
  rename(ID=PUBID_1997)

names(core)<-gsub("EMP_STATUS_","",names(core))
names(core)<-gsub("_XRND","",names(core))

core <- core %>%
  pivot_longer(!ID,names_to="period",values_to="status") %>%
  mutate(Year=substr(period,1,4),
         Week=substr(period,6,7),
         EmpID = ifelse(status>100,status,NA), #For R working, this is employer ID
         Unemp = case_when(
           status < 1 ~ 0,
           is.na(status) ~ 0,
           status == 1 | status == 2 | status == 5 | status ==6 ~ 0,
           status == 4 ~ 1,
           status == 3 | status > 100 ~ 0),
         Working = case_when(
           status < 1 ~ 0,
           is.na(status) ~ 0,
           status == 1 | status == 2 | status == 5 | status ==6 ~ 0,
           status == 4 ~ 0,
           status == 3 | status > 100 ~ 1)) %>%
  arrange(ID, period)

core <- core %>%
  group_by(ID) %>%
  mutate(Exp = cumsum(Working))

core <- core %>%
  group_by(ID, status) %>%
  mutate(TEN = cumsum(Working))


#Generate Spell Lengths and Start and End Dates

core <- core %>%
  group_by(ID) %>%
  mutate(U2 = lead(Unemp),
         reason = lead(status),
         Ten = lag(TEN),
         s2 = lag(status),
         start = case_when(lag(Unemp)==0 & Unemp==1 ~ 1,
                           TRUE ~ 0),
         end = case_when(Unemp==1 & U2==0 ~ 1,
                         TRUE ~ 0)) %>%
  filter(start == 1 | end == 1) %>%
  arrange(ID, period) %>%
  mutate(end = lead(period),
         r.end = lead(reason)) %>%
  filter(start==1) %>%
  mutate(end = case_when(is.na(end) ~ period, #This solves case of a typo in status
                         TRUE ~ end),
         start = ISOweek2date(paste0(substr(period, 1, 4), "-W", substr(period, 6,7), "-1")),
         stop = ISOweek2date(paste0(substr(end, 1, 4), "-W", substr(end, 6,7), "-1")),
         length = as.numeric((stop - start)/7),
         R.End = case_when(r.end == 5 ~ "Left Workforce",
                            r.end > 6 ~ "New Job"),
         EmpID = ifelse(s2<100, NA, as.numeric(s2)),
         EmpID = as.character(EmpID))  %>%
  select(ID, period, EmpID, Exp, Ten, start, stop, length, R.End)

#Merge with IND, OCC, Union data  

core <- core %>%
  left_join(IOU, by=c("ID","EmpID")) %>%
  mutate(event=1) %>%
  select(-c(Year, Job)) %>%
  group_by(ID)%>%
  mutate(Spell.Num=cumsum(event))

#Generate and Merge in Search Data#####

source('./Build/Code/NLSY Code/Search.R')

search<-new_data %>%
  rename(ID=PUBID_1997) %>%
  select(-contains("KEY")) %>%
  select(-contains("CV")) %>%
  pivot_longer(-ID,names_to = "Method", values_to = "Yes") %>%
  mutate(Method=gsub("YEMP-118000.", "", Method), 
         Method=gsub("YEMP-119400.","",Method),
         Gap_Year=paste(substr(Method,1,2),substr(Method,11,14), sep="_"))

search<-search %>%
  group_by(ID, Gap_Year) %>%
  count(Yes) %>%
  subset(Yes==1) %>%
  select(-Yes) 


gaps <- core %>%
  group_by(ID) %>%
  mutate(Gap_Year = ifelse(R.End!="Left Workforce", paste(str_pad(cumsum(event), 2, pad = "0"), substr(as.character(EmpID), 1, 4), sep="_"), NA)) %>%
  left_join(., search, by=c("ID","Gap_Year")) %>%
  replace_na(list(n=0)) %>%
  rename(SearchCT=n) %>%
  select(-Gap_Year) %>%
  mutate(Year = as.numeric(substr(period, 1, 4))) 

save(gaps,file="./Build/Output/gaps97.RData")


