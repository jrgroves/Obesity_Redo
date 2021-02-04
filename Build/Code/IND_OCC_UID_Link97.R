#Compiles the Industry, Occupation, and Union Status for jobs to match with gaps.
#Jeremy R. Groves
#February 3, 2021


rm(list=ls())

library(tidyverse)

source('~/Projects/Obesity_Redo/Build/Code/NLSY Code/OCC_IND.R')

#Create the links between job id and OCC and IND

uid<- new_data %>%
    rename(ID=PUBID_1997) %>%
      select(ID, starts_with("YEMP_UID")) %>%
        pivot_longer(!ID, names_to="Year", values_to="UID") %>%
          mutate(Year=gsub("YEMP_UID.","",Year))  %>%
            mutate(Job_Num=substr(Year,1,2)) %>%
              mutate(Year=substr(Year,4,7)) %>%
                subset(!is.na(UID))
ind<- new_data %>%
  rename(ID=PUBID_1997) %>%
    select(ID, starts_with("YEMP_INDC")) %>%
      pivot_longer(!ID, names_to="Year", values_to="IND") %>%
        mutate(Year=gsub("YEMP_INDCODE-2002.","",Year))  %>%
          mutate(Job_Num=substr(Year,1,2)) %>%
              mutate(Year=substr(Year,4,7)) 

occ<- new_data %>%
  rename(ID=PUBID_1997) %>%
    select(ID, starts_with("YEMP_OCC")) %>%
      pivot_longer(!ID, names_to="Year", values_to="OCC") %>%
        mutate(Year=gsub("YEMP_OCCODE-2002.","",Year))  %>%
          mutate(Job_Num=substr(Year,1,2)) %>%
            mutate(Year=substr(Year,4,7))%>%
              subset(!is.na(OCC))

term<- new_data %>%
      rename(ID=PUBID_1997) %>%
        select(ID, starts_with("YEMP-58400")) %>%
          pivot_longer(!ID, names_to="Year", values_to="TERM") %>%
            mutate(Year=gsub("YEMP-58400.","",Year),
                   Job_Num=substr(Year,1,2),
                   Year=substr(Year,4,7)) %>%
              mutate(TERM = case_when(
                TERM == 4 ~ "Forced",
                TERM == 22 ~ "Retired",
                TERM == 16 | TERM == 20 ~ "Illness",
                TERM == 14 ~ "Prison",
                TERM < 4 ~ "Ended",
                TERM > 4 & TERM < 14 ~ "Quit",
                TERM == 21 ~ "Quit",
                TERM > 22 ~ "Quit")) %>%
                    replace_na(list(TERM="Unknown"))


IOU<-Reduce(function(x,y) merge(x=x, y=y, by=c("ID", "Year", "Job_Num")),
             list(uid, ind, occ, term))
IOU$JID<-paste(IOU$ID, IOU$UID,sep="_")

#Union Data

source('./Build/Code/NLSY Code/Union.R')

union<- new_data %>%
  rename(ID=PUBID_1997) %>%
  pivot_longer(!ID, names_to="Year", values_to="UNION") %>%
  mutate(Year=gsub("YEMP-101100.","",Year))  %>%
    replace_na(list("UNION"=0))
names(union)<-c("ID","JID2","UNION")
IOU$JID2<-paste(IOU$Job_Num,IOU$Year,sep="_")

IOU<-left_join(IOU,union)

IOU$JID2<-NULL


save(IOU,file="./Build/Input/OCC_IND.RData")
