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

#Aggregate OCC and IND codes

IOU<-IOU %>%
  mutate(OCC2 = case_when(
    OCC <= 430                   ~ "11",
    OCC > 430 & OCC <= 730       ~ "13",
    OCC >= 1000 & OCC <= 1240     ~ "15",
    OCC >= 1300 & OCC <= 1560     ~ "17",
    OCC >= 1600 & OCC <= 1960     ~ "19",
    OCC >= 2000 & OCC <= 2060     ~ "21",
    OCC >= 2100 & OCC <= 2150     ~ "23",
    OCC >= 2200 & OCC <= 2550     ~ "25",
    OCC >= 2600 & OCC <= 2960     ~ "27",
    OCC >= 3000 & OCC <= 3650     ~ "29",
    OCC >= 3700 & OCC <= 3950     ~ "33",
    OCC >= 4000 & OCC <= 4160     ~ "35",
    OCC >= 4200 & OCC <= 4250     ~ "37",
    OCC >= 4300 & OCC <= 4650     ~ "39",
    OCC >= 4700 & OCC <= 4960     ~ "41",
    OCC >= 5000 & OCC <= 5930     ~ "43",
    OCC >= 6000 & OCC <= 6130     ~ "45",
    OCC >= 6200 & OCC <= 6940     ~ "47",
    OCC >= 7000 & OCC <= 7620     ~ "49",
    OCC >= 7700 & OCC <= 8960     ~ "51",
    OCC >= 9000 & OCC <= 9750     ~ "53",
    TRUE                          ~ "00")) %>%
  mutate(IND2 = case_when(
    IND >=170 & IND <= 290          ~ "AGR",
    IND >=370 & IND <= 490          ~ "EXT",
    IND >=570 & IND <= 690          ~ "UTL",
    IND == 770                       ~ "CON",
    IND >=1070 & IND <= 3990        ~ "MFG",
    IND >=4070 & IND <= 4590        ~ "WHL",
    IND >=4670 & IND <= 5790        ~ "RET",
    IND >=6070 & IND <= 6390        ~ "TRN",
    IND >=6470 & IND <= 6780        ~ "INF",
    IND >=6870 & IND <= 7190        ~ "FIN",
    IND >=7270 & IND <= 7790        ~ "PRF",
    IND >=7860 & IND <= 7890        ~ "EDU",
    IND >=7970 & IND <= 8290        ~ "MED",
    IND >=8370 & IND <= 8470        ~ "SCA",
    IND >=8560 & IND <= 8690        ~ "ENT",
    IND >=8770 & IND <= 9290        ~ "SRV",
    IND >=9370 & IND <= 9590        ~ "ADM",
    IND >=9670 & IND <= 9890        ~ "ARM",
    TRUE                            ~ "OTH"))

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
