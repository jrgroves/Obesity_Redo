#Joins data and perform analysis using NLSY 97 Data
#By Jeremy Groves
#January 26, 2021


rm(list=ls())

library(tidyverse)
library(survival)
library(timereg)
library(survminer)

#Load constructed data and create core analysis data
load("./Build/Output/gaps97.RData")
load("./Build/Output/core97.RData")

gaps$Year<-as.numeric(substr(gaps$Spell.Start,1,4))

main<-merge(gaps,core,by=c("ID","Year"),all.x=TRUE)

  #Remove incomplete observations
   main <- main %>%
      subset(!is.na(Age))
   
  #Create additional variables
    main <- main %>%
      mutate(BMI_Level2=ifelse(BMI_Level=="Normal" | BMI_Level=="Overweight",
                               "Normal",BMI_Level)) %>%
      mutate(Female=case_when(
        Sex=="Female" ~ 1,
        Sex=="Male" ~ 0 ))

  #SUbset Data
    core.m<-main %>%
      subset(Sex=="Male")

    core.f<-main %>%
      subset(Sex=="Female")

#Summary Statistics for core sample
  
 #Translate gaps to Survival Data
    km<-with(main,Surv(spell_length, event))
    km.m<-with(core.m,Surv(spell_length, event))
    km.f<-with(core.f,Surv(spell_length,event))

#Draw the KM Survival Curves
    km_fit1<-survfit(km~factor(BMI_Level2),data=main)
    full.km<-ggsurvplot(km_fit1)
    
    km_fit2<-survfit(km.f~factor(BMI_Level2),data=core.f)
    female.km<-ggsurvplot(km_fit2)
    
    km_fit3<-survfit(km.m~factor(BMI_Level),data=core.m)
    male.km<-ggsurvplot(km_fit3)

    
  #Modeling
    mod1<-coxph(km~factor(BMI_Level),data=main)
    mod1.fr<-coxph(km~factor(BMI_Level)+frailty(ID),data=main)
    
    mod2<-coxph(km~factor(BMI_Level)+Female+Age+factor(Race, levels=c("White","Black","Hispanic","Mixed"))+
                  frailty(ID), data=main)
    
    