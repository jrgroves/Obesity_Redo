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
                            "Normal",core$BMI_Level3)
    core$SEX<-ifelse(core$FEMALE==1,"Female","Male")
    
    core<-mutate(core, dummy_cols(enrollment))
    core<-mutate(core, dummy_cols(marriage))

  #Removed unused varaibles from data core
    
    core.old<-core
    core<-core %>%
        select(-reason,-occ,-type,-class,-hgc_mother,-hgc_father,-born_us,
                 -AFQT_2,-AFQT_3,-FAMSIZE,-FAMPOV,-SMSA,-SEARCH_FT,-SEARCH_PT)

  #Create Male and Female Sub-samples
    core.m<-core %>%
      subset(SEX=="Male")

    core.f<-core %>%
      subset(SEX=="Female")

    
#Summary Statistics for core sample
    sum<-stargazer(core, type="html", digits=2, out="./Analysis/Output/Summary1.html")
    
    
    
    
)
    #Translate gaps to Survival Data
km<-with(core,Surv(gap, censor))
km.m<-with(core.m,Surv(gap,censor))
km.f<-with(core.f,Surv(gap,censor))



km_fit1<-survfit(km~factor(BMI_Level3),data=core)
autoplot(km_fit1)


          
km_fit2<-survfit(km~factor(BMI_Level4),data=core)
autoplot(km_fit2)

km_fit3<-survfit(km~factor(BMI_Level4)+factor(SEX),data=core)
autoplot(km_fit3)

mod1<-coxph(km~factor(BMI_Level4),data=core)
mod2<-coxph(km~factor(BMI_Level4)+factor(SEX),data=core)


  
mod1m<-coxph(km.m~factor(BMI_Level4)+1,data=core.m)
mod1f<-coxph(km.f~factor(BMI_Level4)+1,data=core.f)

