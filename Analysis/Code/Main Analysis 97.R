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
                    subset(!is.na(Ten)) %>%
                      subset(!is.na(Score)) %>%
                        subset(!is.na(Marriage)) %>%
                          replace_na(list(TERM = "Unknown"))
 
  #Add Regional Unemployment Rates
  main<-merge(main,unemp,by=c("Spell.Start","Region"),all.x=TRUE)
       
  #Create Dummies
  main <- dummy_cols(main, select_columns = c("BMI_Level","Race","Region",
                                              "Education","Health","Marriage",
                                              "TERM"), ignore_na=TRUE)

  
  #Changing Variable Names and Reordering
  
  names(main)<-gsub("BMI_Level_","", names(main))
  names(main)<-gsub("Race_","", names(main))
  names(main)<-gsub("Region_","", names(main))
  names(main)<-gsub("Education_","", names(main))
  names(main)<-gsub("Health_","", names(main))
  names(main)<-gsub("Marriage_","", names(main))
  names(main)<-gsub("TERM_","", names(main))
  
  main<-main %>%
    select(-Year.x, -zW, -Education, -Health.raw, -Health, -Week) %>%
      relocate(ID, spell_length, Underweight, Normal, Overweight, Obese, Age, Married, 
              NeverMarried, Seperated, Child6, LessHS,HS, SomeCol, CollegePlus, Score, 
              OTHINC, White, Black, Hispanic, Mixed,tenure, Good, Average, Poor, URATE, 
              UNION, NorCen, NorEst, South, West,SearchCT,Forced,Ended,Illness,
              Prison,Quit, Unknown) 
    
  
#SUbset Data
    core.m<-main %>%
      subset(Sex=="Male")

    core.f<-main %>%
      subset(Sex=="Female")
    


#Summary Statistics for core sample
    
    stargazer(main, core.m, core.f, type="text",out="./Analysis/Output/full.txt")
    
    
    stargazer(core.m, type="text",out="./Analysis/Output/male.txt")
    stargazer(core.f, type="text",out="./Analysis/Output/female.txt")
    
  
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
    mod1<-coxph(km~Obese+Overweight+Underweight,data=main)
    mod1<-survreg(km~Obese+Overweight+Underweight,data=main, dist="weibull")
    mod1m<-coxph(km.m~Obese+Overweight+Underweight,data=core.m)
    mod1f<-coxph(km.f~Obese+Overweight+Underweight,data=core.f)
    
    mod1.fr<-coxph(km~Obese+Overweight+Underweight+frailty(ID),data=main)
    mod1<-survreg(km~Obese+Overweight+Underweight+frailty(ID),data=main, dist="weibull")
    mod1m.fr<-coxph(km.m~Obese+Overweight+Underweight+frailty(ID),data=core.m)
    mod1f.fr<-coxph(km.f~Obese+Overweight+Underweight+frailty(ID),data=core.f)

    stargazer(mod1,mod1f,mod1m,
              type='text', out="./Analysis/Output/mod1.csv",
              omit.table.layout = "sn")
    
    mod2<-coxph(km~factor(BMI_Level)+Age+Married+Seperated+Black+Hispanic+Mixed+
                  Child6+OTHINC+HS+SomeCol+CollegePlus+Score+tenure, data=main)
    mod2m<-coxph(km.m~factor(BMI_Level)+Age+Married+Seperated+Black+Hispanic+Mixed+
                  Child6+OTHINC+HS+SomeCol+CollegePlus+Score+tenure, data=core.m)
    mod2f<-coxph(km.f~factor(BMI_Level)+Age+Married+Seperated+Black+Hispanic+Mixed+
                  Child6+OTHINC+HS+SomeCol+CollegePlus+Score+tenure, data=main.f)
    
    stargazer(mod1,mod1f,mod1m, type='text', out="./Analysis/Output/mod1.csv")
    
    
    mod3<-coxph(km~factor(BMI_Level)+Female+
                  Obese.F+Overweight.F+Underweight.F+
                  Age+Race_Black+Race_Hispanic+
                  Race_Mixed+Child6+OTHINC+Education_HS+
                  Education_SomeCol+Education_CollegePlus+Score+tenure+
                  Health_Average+Health_Poor+Region_NorEst+Region_South+
                  Region_West+UNION+URATE+SearchCT, data=main)
    
    mod4<-coxph(km.f~Obese+Overweight+Underweight+Female+Age+Married+Seperated+Black+Hispanic+
                  Mixed+Child6+OTHINC+HS+SomeCol+CollegePlus+Score+Exp+Ten+
                  Average+Poor+NorEst+South+West+UNION+URATE+SearchCT+
                  Ended+Forced+Illness+Quit+
                  factor(IND)+factor(OCC), data=core.f)
    