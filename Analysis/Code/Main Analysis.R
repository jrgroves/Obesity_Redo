#Joins data and perform analysis
#By Jeremy Groves
#January 12, 2021


rm(list=ls())

library(tidyverse)
library(survival)
library(ggplot2)
library(ggfortify)
library(stargazer)
library(fastDummies)

#Load constructed data and create core analysis data
load("./Build/Output/core.RData")
load("./Build/Output/gapcore.RData")

core<-merge(gap.core,char.core,by=c("ID","year"),all.x=TRUE)

  #Remove incomplete observations
    core<-core %>%
            subset(!is.na(AFQT_1)) %>%
              subset(!is.na(WAGE)) %>%
                subset(!is.na(BMI_3)) %>%
                  subset(!is.na(LIMAMT)) %>%
                    subset(!is.na(LIMKIND)) %>%
                        subset(!is.na(OTHINC))
  #Create additional variables
    core$BMI_Level4<-ifelse(core$BMI_Level3=="Normal" | core$BMI_Level3=="Overweight",
                            "Normal","Obese")
    core$BMI_Level5<-ifelse(core$BMI_Level3=="Normal" | core$BMI_Level3=="Underweight",
                            "Normal","Obese")
    
    core$SEX<-ifelse(core$FEMALE==1,"Female","Male")
    
    core<-mutate(core, dummy_cols(enrollment))
    core<-mutate(core, dummy_cols(marriage))
    core<-mutate(core, dummy_cols(region))
    core<-mutate(core, dummy_cols(BMI_Level4))

    names(core)<-gsub(".data_","",names(core))
  #Removed unused variables from data core
    
    core.old<-core

    core<-core %>%
          select("ID","SPELL","Normal","Obese","AGE","MARRIED","CHILD7","HS DIP",
                 "SOME COLLEGE","COLLEGE PLUS",
                  "AFQT_1","WAGE","OTHINC","BLACK","ASIAN","HISPAN","NATAM","TENURE","LIMKIND",
                  "LIMAMT","FORCED","END","TEMP","SEARCH_ST","SEARCH_PRV","SEARCH_EMP","SEARCH_FRD",
                  "SEARCH_ADS","SEARCH_NEWS","SEARCH_SCHS","SEARCH_OTH","year","IND","OCC","censor",
                  "BMI_2","BMI_3","BMI_Level2","BMI_Level3","BMI_Level4","BMI_Level5","MALE","FEMALE","SEX",
                  "NORTH CENT","NORTHEAST","SOUTH","WEST",)
    
  #Create Male and Female Sub-samples
    core.m<-core %>%
      subset(SEX=="Male")

    core.f<-core %>%
      subset(SEX=="Female")

    
#Summary Statistics for core sample
  
    
    stargazer(core, type="text", digits=2, out="./Analysis/Output/sum_full.txt")
    stargazer(core.m, type="text", digits=2, out="./Analysis/Output/sum_male.txt")
    stargazer(core.f, type="text", digits=2, out="./Analysis/Output/sum_female.txt")

    
    
    

    #Translate gaps to Survival Data
km<-with(core,Surv(SPELL, censor))
km.m<-with(core.m,Surv(SPELL,censor))
km.f<-with(core.f,Surv(SPELL,censor))



km_fit1<-survfit(km~factor(BMI_Level4),data=core)
autoplot(km_fit1)


          
km_fit2<-survfit(km~factor(BMI_Level4),data=core)
autoplot(km_fit2)

km_fit3<-survfit(km~factor(BMI_Level4)+factor(SEX),data=core)
autoplot(km_fit3)

mod1<-coxph(km~factor(BMI_Level4),data=core)
mod2<-coxph(km~factor(BMI_Level4)+factor(SEX),data=core)


  
mod1m<-coxph(km.m~factor(BMI_Level4)+1,data=core.m)
mod1f<-coxph(km.f~factor(BMI_Level4)+1,data=core.f)

