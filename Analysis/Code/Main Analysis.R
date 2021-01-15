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
                        subset(!is.na(OTHINC)) %>%
                          subset(!is.na(URATE)) %>%
                            subset(!is.na(CHILD7)) %>%
                              subset(BMI_Level3!="Underweight")  #Remove underweight for health reasons

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
    
    #core<-core %>%
    #  replace(is.na(.), 0) %>%
    #          mutate(SEARCH_CT = rowSums(.[31:38]))

  #Removed unused variables from data core
    
    core.org<-core

    core<-core %>%
          select("ID","SPELL","Normal","Obese","AGE","MARRIED","CHILD7","HS",
                 "HSPLUS","COLPLUS","AFQT_1","WAGE","OTHINC","BLACK","ASIAN",
                 "HISPAN","NATAM","TENURE","LIMKIND","EXPER","LIMAMT","URATE",
                 "FORCED","END","TEMP","SEARCH_ST","SEARCH_PRV","SEARCH_EMP",
                 "SEARCH_FRD","SEARCH_ADS","SEARCH_NEWS","SEARCH_SCHS","SEARCH_OTH",
                 "year","IND","OCC","ended","BMI_3","BMI_Level4","MALE","FEMALE",
                 "SEX","NC","NE","SOUTH","WEST","BMI_Level3")
    
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
      km<-with(core,Surv(SPELL, ended))
      km.m<-with(core.m,Surv(SPELL,ended))
      km.f<-with(core.f,Surv(SPELL,ended))


  #Draw the KM Survival Curves
    km_fit1<-survfit(km~factor(BMI_Level4),data=core)
    full.km<-autoplot(km_fit1)
    
    km_fit2<-survfit(km.f~factor(BMI_Level4),data=core.f)
    male.km<-autoplot(km_fit2)
    
    km_fit2<-survfit(km.m~factor(BMI_Level4),data=core.m)
    female.km<-autoplot(km_fit2)

    
  #Modeling
    mod1m<-coxph(km.m~Obese+frailty(ID),data=core.m)
    mod1f<-coxph(km.f~factor(BMI_Level3)+frailty(ID),data=core.f)
  
    mod2m<-coxph(km.m~Obese+AGE+BLACK+ASIAN+HISPAN+MARRIED+
                   CHILD7+WAGE+OTHINC+HS+HSPLUS+COLPLUS+AFQT_1+
                   EXPER+frailty(ID),data=core.m)
    mod2f<-coxph(km.f~factor(BMI_Level3)+AGE+BLACK+ASIAN+HISPAN+MARRIED+
                 CHILD7+WAGE+OTHINC+HS+HSPLUS+COLPLUS+AFQT_1+
                 EXPER+frailty(ID),data=core.f)

    mod3m<-coxph(km.m~Obese+AGE+BLACK+ASIAN+HISPAN+MARRIED+
                   CHILD7+WAGE+OTHINC+HS+HSPLUS+COLPLUS+AFQT_1+
                   EXPER+URATE+TENURE+LIMKIND+LIMAMT+NE+SOUTH+WEST+
                   frailty(ID),data=core.m)
    mod3f<-coxph(km.f~Obese+AGE+BLACK+ASIAN+HISPAN+MARRIED+
                   CHILD7+WAGE+OTHINC+HS+HSPLUS+COLPLUS+AFQT_1+
                   EXPER+URATE+TENURE+LIMKIND+LIMAMT+NE+SOUTH+WEST+
                   +frailty(ID),data=core.f)
    
    mod4m<-coxph(km.m~Obese+AGE+BLACK+ASIAN+HISPAN+MARRIED+
                   CHILD7+WAGE+OTHINC+HS+HSPLUS+COLPLUS+AFQT_1+
                   EXPER+URATE+TENURE+LIMKIND+LIMAMT+NE+SOUTH+WEST+
                   factor(OCC)+factor(IND)+frailty(ID),data=core.m)
    mod4f<-coxph(km.f~factor(BMI_Level3)+AGE+BLACK+ASIAN+HISPAN+MARRIED+
                   CHILD7+WAGE+OTHINC+HS+HSPLUS+COLPLUS+AFQT_1+
                   EXPER+URATE+TENURE+LIMKIND+LIMAMT+NE+SOUTH+WEST+
                   factor(OCC)+factor(IND)+frailty(ID),data=core.f)
