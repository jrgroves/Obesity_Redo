#Creates unemployed gaps using the NLSY97 Data and includes the start and end week of gap
#By Jeremy Groves
#January 26, 2021
#Updated: December 23, 2022: Added more gaps, recalculated spell lengths

rm(list=ls())

library(tidyverse)
#library(data.table)

source("./Build/Code/FullGaps.R") #Changed from Gaps97 to include more years
load("./Build/Input/OCC_IND.RData")

rm(list=c("qnames","vallabels","varlabels"))

#Decode Data

core<-new_data %>%
  rename(ID=PUBID_1997) #Updated the variable name for ID

names(core)<-gsub("EMP_STATUS_","",names(core))
names(core)<-gsub("_XRND","",names(core))

core2 <- core %>%
    pivot_longer(!ID,names_to="period",values_to="status") %>%
    mutate(Year = substr(period,1,4),
           Week = substr(period,6,7),
           EmpID = ifelse(status>100, status, NA), #NOTE: The status over 100 indicates employer ID May use this later
           Unemp = case_when(
                             status< 1 ~ 0,
                             is.na(status) ~ 0,
                             status == 1 | status == 2 | status == 5 | status ==6 ~ 0,
                             status == 4 ~ 1,
                             status == 3 | status > 100 ~ 0),
           Working = case_when(
                               status<1 ~ 0,
                               is.na(status) ~ 0,
                               status == 1 | status == 2 | status == 5 | status ==6 ~ 0,
                               status == 4 ~ 0,
                               status == 3 | status > 100 ~ 1),
           Week = ISOweek2date(paste0(Year, "-W", Week,"-1"))) %>%
    arrange(ID)

core <- core %>%
    group_by(ID) %>%
      mutate(Exp = cumsum(Working))

core <- core %>%
   group_by(ID, UID) %>%
       mutate(Ten = cumsum(Working))

c<-IOU %>%
   select(JID,OCC,IND,UNION,TERM,OCC2,IND2)%>%
    distinct(JID, .keep_all = TRUE)

#Generate Spell Lengths and Start and End Dates

d <- core %>%
       group_by(ID) %>%
         mutate(spell = cumsum(Unemp)) %>%
          mutate(
            spell2 = {
              r <- rle(Unemp)
              r$values <- cumsum(r$values) * r$values
              inverse.rle(r) 
            }
            )
e <- d %>%
  arrange(ID,period) %>%
    group_by(ID)%>%
      mutate(Wid=seq_along(Week))

spell.time<-e %>%   #Need this for translation later
  subset(ID==1) %>%
    select(period,Wid)
spell.time$ID<-NULL

g <- e %>%
      group_by(ID, grp = rleid(spell2)) %>%
        filter(spell2 !=0) %>%
            summarise(spell_length = n()) %>% 
                mutate(Spell=seq_along(ID)) %>%
                  select(-grp)

#Use e to start a new data set for spell start and end

f<-e %>%
  group_by(ID) %>%
  mutate(Ten=lag(Ten),
         UID=lag(UID)) %>%
  subset(spell2>0) %>%
     mutate(Wid2=lead(Wid)) %>%
       mutate(blah=ifelse(Wid+1==(Wid2), 1, 0)) %>%
        mutate(ends=ifelse(blah==0,Wid,0)) %>%
          mutate(starts=lag(ifelse(ends>0,lead(Wid),0)))

f$starts[is.na(f$starts)]<-f$Wid[is.na(f$starts)]
f$ends[is.na(f$ends)]<-f$Wid[is.na(f$ends)]

f <- f %>%
      subset(ends !=0 | starts !=0) %>%
      mutate(ends=lead(ends)) %>%
        group_by(ID) %>%
          distinct(spell2, .keep_all=TRUE) %>%
             select(ID,spell,spell2,ends,starts,Exp,Ten,UID)


f<-merge(f,spell.time,by.x="starts",by.y="Wid")
  names(f)[which(names(f)=="period")]<-"Spell.Start"
f<-merge(f,spell.time,by.x="ends",by.y="Wid")
  names(f)[which(names(f)=="period")]<-"Spell.Ends"

#Create ID and merge with IND, OCC, Union data  
f$JID<-paste(f$ID,f$UID,sep="_")
  f<-merge(f, c, by="JID", all.x=TRUE)

f<-f%>%
  arrange(ID,spell2) %>%
    select(-ends,-starts,-spell)
gaps<-merge(f,g,by.x=c("ID","spell2"),by.y=c("ID","Spell"),all.x=TRUE )

gaps<-arrange(gaps,ID,spell2)
  names(gaps)[which(names(gaps)=="spell2")]<-"Spell.Num"
  
rm(d,e,f,g,spell.time,new_data,core,c)

#Final Data set

gaps<-gaps %>%
        mutate(event=1) %>%
           select(-JID, -UID) %>%
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

search$count=1

search<-search %>%
  group_by(ID) %>%
  mutate(Spell.Num=cumsum(count)) %>%
  select(-count)

gaps<-merge(gaps,search,by=c("ID","Spell.Num"),all.x=TRUE)

gaps<-gaps %>%
    replace_na(list(n=0)) %>%
      rename(SearchCT=n) %>%
        select(-Gap_Year)
 
save(gaps,file="./Build/Output/gaps97.RData")



