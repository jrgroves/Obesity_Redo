


rm(list=ls())

library(tidyverse)

source('~/Projects/Obesity_Redo/Build/Code/IND_OCC.R')

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


IOU<-Reduce(function(x,y) merge(x=x, y=y, by=c("ID", "Year", "Job_Num")),
             list(uid, ind, occ))
IOU$JID<-paste(IOU$ID, IOU$UID,sep="_")

save(IOU,file="./Build/Input/OCC_IND.RData")
