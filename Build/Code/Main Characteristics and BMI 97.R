#Creates the Characteristic files for the NLSY dataset from 1980 to 2004
#By Jeremy Groves
#January 6, 2021
#Translation and update from old STATA code (charct.do)

rm(list=ls())

library(tidyverse)
library(foreign)
library(zoo)
library(measurements)

#Loading extra characteristics added later
core<-read.csv("./Build/Input/core2.csv", as.is=TRUE, header=TRUE)

#Create Main Time Consistent Characteristics
core <- core%>%
    rename(Gender="R0536300") %>%
      rename(Bday.m="R0536401") %>%
        rename(Bday.y="R0536402") %>%
          rename(R="R1482600") %>%
            rename(ID="R0000100")

#Subset out and decode main TC Characteristics
core.1<-select(core,c("ID","Gender","Bday.m","Bday.y","R"))
  core.1 <- core.1 %>%
    slice(rep(1:n(), each = 15)) %>%
      group_by(ID) %>%
        mutate(Year=seq(1997,2011)) %>%
          mutate(Age=Year-Bday.y) %>%
            select(-Bday.m,-Bday.y) %>%
              mutate(Sex = case_when(
                Gender==1 ~ "Male",
                Gender==2 ~ "Female")) %>%
                mutate(Race= case_when(
                  R==1 ~ "Black",
                  R==2 ~ "Hispanic",
                  R==3 ~ "Mixed",
                  R==4 ~ "White"))%>%
                    select(ID,Age,Race,Sex,Year)

#Subset and Decode the Time Varying Characteristics
core.2<-select(core,-c("R1235800","Gender","Bday.m","Bday.y","R"))

#Pre-Define and Rename Columns
x<-2
y<-3
z<-4

for(i in seq(1997,2011)){
  core.2[(which(core.2[,x]<0)),x]<-NA
  core.2[(which(core.2[,y]<0)),y]<-NA
  core.2[(which(core.2[,z]<0)),z]<-NA
  
  core.2$temp<-core.2[,x]*12+core.2[,y]
    names(core.2)[which(names(core.2)=="temp")]<-paste0("height",i)
              names(core.2)[z]<-paste0("weight",i)
  x<-x+3
  y<-y+3
  z<-z+3
}

#Create Height and Weights

core.2a <- core.2 %>%
    select(starts_with("height") | starts_with("ID")) %>%
        gather(Measure,Height,height1997:height2011) %>%
          mutate(Year=substr(Measure,7,10)) %>%
            select(-Measure)

core.2a$Height[which(core.2a$Height<0)]<-NA

core.2b <- core.2 %>%
  select(starts_with("weight") | starts_with("ID")) %>%
      gather(Measure,Weight,weight1997:weight2011) %>%
        mutate(Year=substr(Measure,7,10)) %>%
          select(-Measure)
core.2b$Weight[which(core.2b$Weight<0)]<-NA

core.2<-merge(core.2a,core.2b)
  rm(core.2a,core.2b)

core.2 <- core.2 %>%
  group_by(ID) %>%
    mutate(Height2=median(Height,na.rm=TRUE))

#Removes weights less than 30 pounds which are clear errors

core.2$Weight[which(core.2$Weight<=30)]<-NA

core.2 <- core.2 %>%
    group_by(ID) %>%
      mutate(count=sum(is.na(Weight))) %>%
        subset(count<14)

core.2<-core.2 %>%
  group_by(ID) %>%
    mutate(zW=scale(Weight))

core.2$Weight[which(core.2$zW < -2.5)]<-NA
core.2$Weight[which(core.2$zW > 2.5)]<-NA
core.2$Weight[which(core.2$Weight==999)]<-NA

#Interpolate the missing weights using tidyverse linear na.approx
core.2<-core.2 %>%
  group_by(ID) %>%
    arrange(Weight,Year) %>%
      mutate(Weight2 = na.approx(Weight, maxgap = 13, rule = 2)) %>%
        select(ID,Year,Height,Weight,Height2,Weight2)

#Calculate BMI

  #Convert to metrics for BMI calculations
    core.2$Height2<-conv_unit(core.2$Height2,"inch","m")
    core.2$Weight2<-conv_unit(core.2$Weight2, "lbs","kg")
    
  #Calculate BMI
    core.2 <- core.2 %>%
        mutate(BMI=Weight2/((Height2)^2))
    
  #Classify the BMI
    core.2<-core.2 %>%
        mutate(BMI_Level = case_when(
          BMI< 18.5 ~ "Underweight",
          BMI>= 18.5 & BMI < 25 ~ "Normal",
          BMI>= 25 & BMI < 30 ~ "Overweight",
          BMI >= 30 ~ "Obese"
          ))
  
  #Remove outliers of the BMI to account to errors in weights and heights
    core.2<-core.2 %>%
      mutate(zW=scale(BMI)) %>%
        subset(zW > -2.5) %>%
          subset(zW < 2.5)
    
#Merge Time Constant Characteristics Keeping on ly Core.2 Values
    core<-merge(core.1,core.2,by=c("ID","Year"),all.y=TRUE)
    
#Save File
    save(core,file="./Build/Output/core97.RData")
      