#Joins data and perform analysis using NLSY 97 Data
#By Jeremy Groves
#January 26, 2021


rm(list=ls())

library(tidyverse)
library(survival)
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
                  subset(!is.na(GFinc)) %>%
                    subset(!is.na(Ten)) %>%
                      subset(!is.na(Score)) %>%
                        subset(!is.na(Marriage)) %>%
                          subset(!is.na(Child6)) %>%
                            subset(Race != "Mixed") %>%
                              subset(BMI_Level != "Underweight") %>%
                                replace_na(list(TERM = "Unknown")) %>%
                                  subset(TERM!="Prison")
 
  #Add Regional Unemployment Rates
  main<-merge(main,unemp,by=c("Spell.Start","Region"),all.x=TRUE)
    main<-main %>%
      subset(!is.na(URATE))
       
  #Create Dummies
  main <- dummy_cols(main, select_columns = c("BMI_Level","Race","Region",
                                              "Education","Health","Marriage",
                                              "TERM"), ignore_na=TRUE)

  
  #Changing Variable Names and Reordering
  names(main)[which(names(main)=="spell_length")]<-"Spell"
  names(main)<-gsub("BMI_Level_","", names(main))
  names(main)<-gsub("Race_","", names(main))
  names(main)<-gsub("Region_","", names(main))
  names(main)<-gsub("Education_","", names(main))
  names(main)<-gsub("Health_","", names(main))
  names(main)<-gsub("Marriage_","", names(main))
  names(main)<-gsub("TERM_","", names(main))
  
  main<-main %>%
    select(-Year.x, -zW, -Education, -Health.raw, -Health, -Week, -Weight,
           -URBAN, -Height, -TERM) %>%
      relocate(ID, Spell, Normal, Overweight, Obese, Age, Married, 
              NeverMarried, Seperated, Child6, LessHS,HS, SomeCol, CollegePlus, Score, 
              GFinc, White, Black, Hispanic, Good, Average, Poor, URATE, 
              UNION, NorCen, NorEst, South, West,SearchCT,Forced,Ended,Illness,
              Quit, Unknown, Year.y)   #Mixed, Underweight
    
  
#SUbset Data
     main.o<-main %>%    #Obese Only
       subset(Obese==1)
     main.no<-main %>%    #Non-Obese Only
       subset(Obese==0)
     main.b<-main %>%    #Black Only
       subset(Black==1)
    
     main.m<-main %>%   #Male Only
       subset(Sex=="Male")
     main.mb <- main.m %>%   #Black Male Only
         subset(Black==1)
     main.mo <- main.m %>%   #Obese Male Only
         subset(Obese==1)
     main.mn <- main.m %>%   #Non-Obese Male Only
       subset(Obese==0)
     
     main.f<-main %>%        #Female Only
       subset(Sex=="Female")
     main.fb <- main.f %>%   #Black Female Only
       subset(Black==1)
     main.fo <- main.f %>%   #Obese Female Only
       subset(Obese==1)
     main.fn <- main.f %>%   #Non-Obese Female Only
       subset(Obese==0)

#Summary Statistics for core sample
    
    stargazer(main, type="text",out="./Analysis/Output/full.txt")
    
    
    stargazer(subset(main, Female==0 & Obese==1), subset(main, Female==0 & Obese==0),
              type="text",out="./Analysis/Output/male_obese.txt")
    stargazer(subset(main, Female==1 & Obese==1), subset(main, Female==1 & Obese==0),
              type="text",out="./Analysis/Output/female_obese.txt")

 #Translate gaps to Survival Data
    km<-with(main,Surv(Spell, event))
    km.b<-with(main.b,Surv(Spell, event))
    km.o<-with(main.o, Surv(Spell, event))
    km.no<-with(main.no, Surv(Spell, event))
    
    km.m<-with(main.m,Surv(Spell, event))
    km.mb<-with(main.mb,Surv(Spell, event))
    km.mo<-with(main.mo,Surv(Spell, event))
    km.mn<-with(main.mn,Surv(Spell, event))
    
    km.f<-with(main.f,Surv(Spell, event))
    km.fb<-with(main.fb,Surv(Spell, event))
    km.fo<-with(main.fo,Surv(Spell, event))
    km.fn<-with(main.fn,Surv(Spell, event))

#Draw the KM Survival Curves
    km_fit1<-survfit(km~factor(BMI_Level),data=main)
      ggsurvplot(km_fit1, 
                          data=main,
                          conf.int=TRUE,
                          xlim = c(0,50),
                          xlab = "Time in Weeks",
                          surv.median.line = "hv",
                          legend.labs = c("Normal","Obese","Overweight"),
                          title = "Full Sample by BMI Classification",
                          ggtheme = theme_bw())

      km_fit2<-survfit(km~factor(BMI_Level2),data=main)
      ggsurvplot(km_fit2, 
                 data=main,
                 conf.int=TRUE,
                 xlim = c(0, 50),
                 xlab = "Time in Weeks",
                 surv.median.line = "hv",
                 legend.labs = c("Normal","Obese"),
                 title = "Full Sample by Obesity Status",
                 ggtheme = theme_bw())
    
    
      km_fit3<-survfit(km.o~factor(Sex),data=main.o)
      ggsurvplot(km_fit3, 
                 data=main.o,
                 conf.int=TRUE,
                 xlim = c(0, 50),
                 xlab = "Time in Weeks",
                 surv.median.line = "hv",
                 legend.labs = c("Female","Male"),
                 title = "Obese Subsample by Sex",
                 ggtheme = theme_bw())
      
      km_fit4<-survfit(km.o~factor(Race),data=main.o)
      ggsurvplot(km_fit4, 
                 data=main.o,
                 conf.int=TRUE,
                 xlim = c(0, 50),
                 xlab = "Time in Weeks",
                 surv.median.line = "hv",
                 legend.labs = c("Black","Hispanic","White"),
                 title = "Obese Subsample by Race",
                 ggtheme = theme_bw())
      
      km_fit4a<-survfit(km.no~factor(Race),data=main.no)
      ggsurvplot(km_fit4a, 
                 data=main.no,
                 conf.int=TRUE,
                 xlim = c(0, 50),
                 xlab = "Time in Weeks",
                 surv.median.line = "hv",
                 legend.labs = c("Black","Hispanic","White"),
                 title = "Non-Obese Subsample by Race",
                 ggtheme = theme_bw())
    
      km_fit5<-survfit(km.fo~factor(Race),data=main.fo)
      ggsurvplot(km_fit5, 
                 data=main.fo,
                 conf.int=TRUE,
                 xlim = c(0, 50),
                 xlab = "Time in Weeks",
                 surv.median.line = "hv",
                 legend.labs = c("Black","Hispanic","White"),
                 title = "Obese Females by Race",
                 ggtheme = theme_bw())
      
      km_fit6<-survfit(km.mo~factor(Race),data=main.mo)
      ggsurvplot(km_fit6, 
                 data=main.mo,
                 conf.int=TRUE,
                 xlim = c(0, 50),
                 xlab = "Time in Weeks",
                 surv.median.line = "hv",
                 legend.labs = c("Black","Hispanic","White"),
                 title = "Obese Males by Race",
                 ggtheme = theme_bw())

#Modeling
    mod1<-coxph(km~Obese+Overweight,data=main)
    mod1p<-survreg(km~Obese+Overweight,data=main, dist="weibull")
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
                  Child6+GFinc+HS+SomeCol+CollegePlus+Score+tenure, data=main)
    mod2m<-coxph(km.m~factor(BMI_Level)+Age+Married+Seperated+Black+Hispanic+Mixed+
                  Child6+GFinc+HS+SomeCol+CollegePlus+Score+tenure, data=core.m)
    mod2f<-coxph(km.f~factor(BMI_Level)+Age+Married+Seperated+Black+Hispanic+Mixed+
                  Child6+GFinc+HS+SomeCol+CollegePlus+Score+tenure, data=main.f)
    
    stargazer(mod1,mod1f,mod1m, type='text', out="./Analysis/Output/mod1.csv")
    
    
    mod3<-coxph(km~factor(BMI_Level)+Female+
                  Obese.F+Overweight.F+Underweight.F+
                  Age+Race_Black+Race_Hispanic+
                  Race_Mixed+Child6+GFinc+Education_HS+
                  Education_SomeCol+Education_CollegePlus+Score+tenure+
                  Health_Average+Health_Poor+Region_NorEst+Region_South+
                  Region_West+UNION+URATE+SearchCT, data=main)
    
    mod4<-coxph(km~Obese+Overweight+Female+Age+Married+Seperated+Black+Hispanic+
                  Child6+GFinc+HS+SomeCol+CollegePlus+Score+Exp+Ten+
                  Average+Poor+NorEst+South+West+UNION+URATE+SearchCT+
                  Ended+Forced+Illness+Quit+
                  factor(IND)+factor(OCC), data=main)
    