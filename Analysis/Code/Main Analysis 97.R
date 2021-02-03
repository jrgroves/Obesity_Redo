#Joins data and perform analysis using NLSY 97 Data
#By Jeremy Groves
#January 26, 2021


rm(list=ls())

library(tidyverse)
library(survival)
library(timereg)
library(survminer)
library(fastDummies)
library(stargazer)

#Load constructed data and create core analysis data
load("./Build/Output/gaps97.RData")
load("./Build/Output/core97.RData")
load("./Build/Output/Controls97.RData")
load("./Build/Output/Score.RData")
load("./Build/Input/unemp.RData")

core<-merge(core,cong.s,by="ID")

gaps$Year<-as.numeric(substr(gaps$Spell.Start,1,4))

main<-Reduce(function(x,y) merge(x=x, y=y, by=c("ID","Year")),
                    list(gaps,core,core.cont))

  #Remove incomplete observations
   main <- main %>%
      subset(!is.na(Age))
   
  #Create additional variables and Remove NAs
    main <- main %>%
      mutate(BMI_Level2=ifelse(BMI_Level=="Normal" | BMI_Level=="Overweight",
                               "Normal",BMI_Level)) %>%
        mutate(Female=case_when(
          Sex=="Female" ~ 1,
          Sex=="Male" ~ 0 )) %>%
          subset(!is.na(BMI_Level)) %>%
            subset(!is.na(Region)) %>%
              subset(!is.na(Education)) %>%
                subset(!is.na(Health)) %>%
                  subset(!is.na(OTHINC)) %>%
                    subset(!is.na(tenure)) %>%
                      subset(!is.na(Score)) 
 
  #Add Regional Unemployment Rates
  main<-merge(main,unemp,by=c("Spell.Start","Region"),all.x=TRUE)
       
  #Create Dummies
  main <- dummy_cols(main, select_columns = c("BMI_Level","Race","Region",
                                               "Education","Health"))

  #SUbset Data
    core.m<-main %>%
      subset(Sex=="Male")

    core.f<-main %>%
      subset(Sex=="Female")
    


#Summary Statistics for core sample
    
    stargazer(main, type="html",out="./Analysis/Output/full.html")
  
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
    
main<-main %>%
  rename(Normal=BMI_Level_Normal,
         Obese=BMI_Level_Obese,
         Overweight=BMI_Level_Overweight,
         Underweight=BMI_Level_Underweight) %>%
    mutate(Normal.F=Female*Normal,
           Obese.F=Female*Obese,
           Overweight.F=Female*Overweight,
           Underweight.F=Female*Underweight)
    
    mod2<-coxph(km~factor(BMI_Level)+Female+interaction(BMI_Level,Female)+Age+Race_Black+Race_Hispanic+
                  Race_Mixed+Child6+OTHINC+Education_HS+
                  Education_SomeCol+Education_CollegePlus+Score+tenure, data=main)
    
    mod3<-coxph(km~factor(BMI_Level)+Female+
                  Obese.F+Overweight.F+Underweight.F+
                  Age+Race_Black+Race_Hispanic+
                  Race_Mixed+Child6+OTHINC+Education_HS+
                  Education_SomeCol+Education_CollegePlus+Score+tenure+
                  Health_Average+Health_Poor+Region_NorEst+Region_South+
                  Region_West+UNION+URATE+SearchCT, data=main)
    
    mod4<-coxph(km~factor(BMI_Level)+Female+Age+Race_Black+Race_Hispanic+
                  Race_Mixed+Child6+OTHINC+Education_HS+
                  Education_SomeCol+Education_CollegePlus+Score+tenure+
                  Health_Average+Health_Poor+Region_NorEst+Region_South+
                  Region_West+UNION+URATE+SearchCT+
                  factor(IND)+factor(OCC), data=main)
    