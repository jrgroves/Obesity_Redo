#Creates unemployed gaps using the NLSY97 Data and includes the start and end week of gap
#By Jeremy Groves
#January 26, 2021

rm(list=ls())

library(tidyverse)
library(data.table)

source("./Build/Code/Gaps97.R")

rm(list=c("qnames","vallabels","varlabels"))

#Decode Data

core<-new_data %>%
  rename(ID=PUBID_1997)

names(core)<-gsub("EMP_STATUS_","",names(core))
names(core)<-gsub("_XRND","",names(core))

core <- core %>%
    gather(period,status,-ID) %>%
      mutate(Year=substr(period,1,4)) %>%
        mutate(Week=substr(period,6,7)) %>%
          mutate(Unemp = case_when(
            status<1 ~ 0,
            is.na(status) ~ 0,
            status == 1 | status == 2 | status == 5 | status ==6 ~ 0,
            status == 4 ~ 1,
            status == 3 | status > 100 ~ 0)) %>%
      mutate(Working = case_when(
          status<1 ~ 0,
          is.na(status) ~ 0,
          status == 1 | status == 2 | status == 5 | status ==6 ~ 0,
          status == 4 ~ 0,
          status == 3 | status > 100 ~ 1)) %>%
              arrange(ID)

core <- core %>%
    group_by(ID) %>%
      mutate(tenure = cumsum(Working))


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
             select(ID,spell,spell2,ends,starts,tenure)


f<-merge(f,spell.time,by.x="starts",by.y="Wid")
  names(f)[which(names(f)=="period")]<-"Spell.Start"
f<-merge(f,spell.time,by.x="ends",by.y="Wid")
  names(f)[which(names(f)=="period")]<-"Spell.Ends"

f<-f%>%
  arrange(ID,spell2) %>%
    select(-ends,-starts,-spell)
gaps<-merge(f,g,by.x=c("ID","spell2"),by.y=c("ID","Spell"),all.x=TRUE )

gaps<-arrange(gaps,ID,spell2)
  names(gaps)[which(names(gaps)=="spell2")]<-"Spell.Num"
  
rm(d,e,f,g,spell.time,new_data,core)

#Final Data set

gaps$event<-1
save(gaps,file="./Build/Output/gaps97.RData")


