#Cleans the unemployment data from FRED website
#Jeremy R. Groves
#February 3, 2021


rm(list=ls())

library(tidyverse)
library(lubridate)
library(stringr)

unemp<-read.csv("./Build/Input/unemployment.csv", header=TRUE, as.is=TRUE)

unemp$Week<-week(as_date(unemp$DATE))
unemp$Year<-year(as_date(unemp$DATE))

a<-seq(1997,2020,1)
  a<-rep(a,52)
  a<-sort(a)

b<-seq(1,52,1)
  b<-rep(b,24)

df<-as.data.frame(cbind(a,b))
  names(df)<-c("Year","Week")

unemp<-merge(unemp,df,by=c("Year","Week"), all.y=TRUE)

  unemp$Week<-as.character(str_pad(unemp$Week, 2, side="left", pad="0"))

unemp<-unemp %>%   #Fills in the weeks
  fill(NorCen, NorEst, South, West, .direction = "down")  %>%
    select(-DATE) %>%
      pivot_longer(-c(Week,Year), names_to="Region", values_to = "URATE") %>%
        mutate(Spell.Start=paste(Year,Week,sep="."))

save(unemp,file="./Build/Input/unemp.RData")
  
  
