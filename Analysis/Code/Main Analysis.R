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
library(survminer)
library(timereg)

#Load constructed data and create core analysis data
load("./Build/Output/core.RData")
load("./Build/Output/gapcore2.RData")

core<-merge(gap.core,char.core,by=c("ID","year"),all.x=TRUE)

  #Remove incomplete observations
    core<-core %>%
            subset(!is.na(AFQT_1)) %>%
              subset(!is.na(WAGE)) %>%
                subset(!is.na(BMI_3)) %>%
                  subset(!is.na(LIMAMT)) %>%
                    subset(!is.na(LIMKIND)) %>%
                        subset(!is.na(OTHINC)) %>%
                          subset(!is.na(URATE)) %>%
                            subset(!is.na(CHILD7)) 

    core$WAGE[is.infinite(core$WAGE)]<-0
    core$OTHINC[is.infinite(core$OTHINC)]<-0
            
  #Create additional variables
    
    
    core$BMI_Level4<-ifelse(core$BMI_Level3=="Normal" | core$BMI_Level3=="Overweight",  #Add Overweight to "normal category
                            "Normal",core$BMI_Level3)

    core$SEX<-ifelse(core$FEMALE==1,"Female","Male")
    
    core<-mutate(core, dummy_cols(enrollment))
    core<-mutate(core, dummy_cols(marriage))
    core<-mutate(core, dummy_cols(region))
    core<-mutate(core, dummy_cols(BMI_Level4))

    names(core)<-gsub(".data_","",names(core))
    
  #  core<-core %>%
  #    replace(is.na(.), 0) %>%
  #            mutate(SEARCH_CT = rowSums(.[31:38]))

  #Removed unused variables from data core
    
    core.org<-core

    core<-core %>%
          select("ID","SPELL","Normal","Obese","AGE","MARRIED","CHILD7","HS",
                 "HSPLUS","COLPLUS","AFQT_1","WAGE","OTHINC","BLACK","ASIAN",
                 "HISPAN","NATAM","TENURE","LIMKIND","EXPER","LIMAMT","URATE",
                 "FORCED","END","TEMP","SEARCH_ST","SEARCH_PRV","SEARCH_EMP",
                 "SEARCH_FRD","SEARCH_ADS","SEARCH_NEWS","SEARCH_SCHS","SEARCH_OTH",
                 "year","IND","OCC","ended","BMI_3","BMI_Level4","MALE","FEMALE",
                 "SEX","NC","NE","SOUTH","WEST","BMI_Level3","NEWJOB")
    
  #Create Male and Female Sub-samples
    core.m<-core %>%
      subset(SEX=="Male")

    core.f<-core %>%
      subset(SEX=="Female")
    
    core.O<-core %>%
      subset(Obese==1)

    
#Summary Statistics for core sample
  
    
    stargazer(core, type="text", digits=2, out="./Analysis/Output/sum_full.txt")
    stargazer(core.m, type="text", digits=2, out="./Analysis/Output/sum_male.txt")
    stargazer(core.f, type="text", digits=2, out="./Analysis/Output/sum_female.txt")


    #Translate gaps to Survival Data
      km<-with(core,Surv(SPELL, ended))
      km.m<-with(core.m,Surv(SPELL,ended))
      km.f<-with(core.f,Surv(SPELL,ended))
      km.o<-with(core.O,Surv(SPELL,ended))


  #Draw the KM Survival Curves
    km_fit1<-survfit(km~factor(BMI_Level4),data=core)
    full.km<-autoplot(km_fit1)
    
    km_fit2<-survfit(km.f~factor(BMI_Level4),data=core.f)
    male.km<-autoplot(km_fit2)
    
    km_fit2<-survfit(km.m~factor(BMI_Level4),data=core.m)
    female.km<-autoplot(km_fit2)

    
  #Modeling
    mod1<-coxph(km~Obese+frailty(ID),data=core)
    mod1a<-coxph(km~Obese+FEMALE+(Obese*FEMALE),data=core)
    mod1b<-coxph(km~Obese+FEMALE+(Obese*FEMALE)+frailty(ID),data=core)
      c<-survfit(km.o~FEMALE,data=core.O)
   mod1c<-coxph(km.o~FEMALE,data=core.O)
  
    mod2<-coxph(km~FEMALE+Obese+AGE+BLACK+ASIAN+HISPAN+MARRIED+
                   CHILD7+WAGE+OTHINC+HS+HSPLUS+COLPLUS+AFQT_1+
                   EXPER,data=core)

    
    mod3<-coxph(km~FEMALE+Obese+(Obese*FEMALE)+AGE+BLACK+ASIAN+HISPAN+MARRIED+
                  CHILD7+WAGE+OTHINC+HS+HSPLUS+COLPLUS+AFQT_1+
                  EXPER+TENURE+OCC+IND+URATE+NE+SOUTH+WEST+
                  LIMKIND+LIMAMT+FORCED+END+
                  SEARCH_ST+SEARCH_ADS+SEARCH_FRD+SEARCH_SCHS+
                  SEARCH_PRV+SEARCH_EMP+SEARCH_NEWS+SEARCH_OTH,data=core)
    
    mod3<-survreg(km~FEMALE+Obese+(Obese*FEMALE)+AGE+BLACK+ASIAN+HISPAN+MARRIED+
                  CHILD7+WAGE+OTHINC+HS+HSPLUS+COLPLUS+AFQT_1+
                  EXPER+TENURE+OCC+IND+URATE+NE+SOUTH+WEST+
                  LIMKIND+LIMAMT+FORCED+END+
                  SEARCH_ST+SEARCH_ADS+SEARCH_FRD+SEARCH_SCHS+
                  SEARCH_PRV+SEARCH_EMP+SEARCH_NEWS+SEARCH_OTH+
                  NEWJOB,data=core,dist="weibull")su
    
    
   