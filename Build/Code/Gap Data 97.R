#Creates unemployed gaps using the NLSY97 Data and includes the start and end week of gap
#By Jeremy Groves
#January 26, 2021
#UPDATED: December 23, 2022: See notebook for specifics. Also streamlined gap length computation

rm(list=ls())

library(tidyverse)
#library(data.table)
library(ISOweek)


source("./Build/Code/FullGaps.R") #Changed from Gaps97 to include more gaps
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
                             status<1 ~ 0,
                             is.na(status) ~ 0,
                             status == 1 | status == 2 | status == 5 | status ==6 ~ 0,
                             status == 4 ~ 1,
                             status == 3 | status > 100 ~ 0),
           Working = case_when(
                               status<1 ~ 0,
                               is.na(status) ~ 0,
                               status == 1 | status == 2 | status == 5 | status ==6 ~ 0,
                               status == 4 ~ 0,
                               status == 3 | status > 100 ~ 1))%>%
    arrange(ID)

core <- core %>%
    group_by(ID) %>%
      mutate(Exp = cumsum(Working))

core2 <- core %>%
   group_by(ID, EmpID) %>%
       mutate(Ten = cumsum(Working))

c<-IOU %>%
   select(JID,OCC,IND,UNION,TERM,OCC2,IND2)%>%
    distinct(JID, .keep_all = TRUE)

#Generate Spell Lengths and Start and End Dates

core <- core2 %>%
  group_by(ID) %>%
  mutate(reason = ifelse(Unemp != lead(Unemp), lead(status), NA),
         r.start = lag(status)) %>%
  filter(Unemp == 1) %>%
  mutate(start = ifelse(lag(Exp)==Exp, 1, 0),
         stop = ifelse(lead(Exp)==Exp, 1, 0),
         start = replace_na(start, 0),
         stop = replace_na(stop, 0)) %>%
  filter(start!=stop) %>%
  mutate(pstop = ifelse(stop==1, lead(period), NA),
         r.end = lead(reason)) %>%
  filter(start==0) %>%
  filter(r.end > 6 | r.end==5) %>%
  mutate(Reason = case_when(r.end == 5 ~ "Left Workforce",
                            r.end > 6 ~ "New Job"),
         start = ISOweek2date(paste0(substr(period, 1, 4), "-W", substr(period, 6,7), "-1")),
         stop = ISOweek2date(paste0(substr(pstop, 1, 4), "-W", substr(pstop, 6,7), "-1")),
         length = as.numeric((stop - start)/7),
         JID = paste(ID, r.start, sep="_"))
  

#Merge with IND, OCC, Union data  

core <- core %>%
  full_join(., c, by="JID")

#Final Data set

gaps<-core %>%
        mutate(event=1) %>%
           select(-JID, -EmpID, -period, -status, -Working, -pstop, -Unemp) %>%
            replace_na(list(IND=0, OCC=0, UNION=0)) %>%
              group_by(ID)%>%
                mutate(Spell.Num=cumsum(event))

#Generate and Merge in Search Data#####

source('~/Projects/Obesity_Redo/Build/Code/NLSY Code/Search.R')

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


gaps <- gaps %>%
  group_by(ID) %>%
  mutate(Gap_Year = ifelse(r.end!=5, paste(str_pad(cumsum(event), 2, pad = "0"), substr(r.end, 1, 4), sep="_"), NA)) %>%
  left_join(., search, by=c("ID","Gap_Year")) %>%
  replace_na(list(n=0)) %>%
  rename(SearchCT=n) %>%
  select(-Gap_Year)
 
save(gaps,file="./Build/Output/gaps97.RData")



