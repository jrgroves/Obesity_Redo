#Joins data and perform analysis using NLSY 97 Data
#By Jeremy Groves
#January 26, 2021


rm(list=ls())

library(tidyverse)
library(survival)
library(fastDummies)
library(stargazer)
library(texreg)
library(survminer)

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
                                              "TERM", "BMI_Level_L"), ignore_na=TRUE)

  
  #Changing Variable Names and Reordering
  
  main$BMI_Level<-ordered(main$BMI_Level, c("Normal","Overweight","Obese"))
  
  names(main)[which(names(main)=="spell_length")]<-"Spell"
  names(main)<-gsub("BMI_Level_","", names(main))
  names(main)<-gsub("Race_","", names(main))
  names(main)<-gsub("Region_","", names(main))
  names(main)<-gsub("Education_","", names(main))
  names(main)<-gsub("Health_","", names(main))
  names(main)<-gsub("Marriage_","", names(main))
  names(main)<-gsub("TERM_","", names(main))
  names(main)[which(names(main)=="L")]<-"BMI_Level_L"

  
  main<-main %>%
    select(-Year.x, -zW, -Education, -Health.raw, -Health, -Week, -Weight,
           -URBAN, -Height, -TERM, -Year.y, -L_Underweight) %>%
      relocate(ID, Spell, Normal, Overweight, Obese, Age, Married, 
              NeverMarried, Seperated, Child6, LessHS,HS, SomeCol, CollegePlus, Score, 
              GFinc, White, Black, Hispanic, Good, Average, Poor, URATE, 
              UNION, NorCen, NorEst, South, West,SearchCT,Forced,Ended,Illness,
              Quit, Unknown, L_Normal, L_Obese, L_Overweight) %>%
    replace_na(list(OCC2 = "00", IND2 = "OTH"))
    
  
#SUbset Data
     main.o<-main %>%    #Obese Only
       subset(Obese==1)
     main.no<-main %>%    #Non-Obese Only
       subset(Obese==0)
     main.b<-main %>%    #Black Only
       subset(Black==1)
     main.w<-main %>%    #White Only
       subset(White==1)
     main.h<-main %>%    #Hispanic Only
       subset(Hispanic==1)
     
    
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
    
    stargazer(main, subset(main, Female==1), subset(main, Female==0),
              type="text",out="./Analysis/Output/full.txt")
    stargazer(main, subset(main, Normal==1), subset(main, Overweight==1), subset(main, Obese==1),
              type="text",out="./Analysis/Output/obesity.txt")
    stargazer(subset(main, White==1), subset(main, Black==1), subset(main, Hispanic==1),
              type="text",out="./Analysis/Output/race.txt")

 #Translate gaps to Survival Data
    km<-with(main,Surv(Spell, event))
    km.m<-with(main.m,Surv(Spell, event))
    km.f<-with(main.f,Surv(Spell, event))
    
    km.b<-with(main.b,Surv(Spell, event))
    km.w<-with(main.w,Surv(Spell, event))
    km.h<-with(main.h,Surv(Spell, event))
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
                          legend.labs = c("Normal", "Overweight", "Obese"),
                          title = "Figure 1: Full Sample by BMI Classification",
                          ggtheme = theme_bw())
      
      km_fit2<-survfit(km.m~factor(BMI_Level),data=main.m)    
      ggsurvplot(km_fit2, 
                 data=main.m,
                 conf.int=TRUE,
                 xlim = c(0,50),
                 xlab = "Time in Weeks",
                 surv.median.line = "hv",
                 legend.labs = c("Normal", "Overweight", "Obese"),
                 title = "Figure 2: Male Subsample Sample by BMI Classification",
                 ggtheme = theme_bw())
      
      km_fit3<-survfit(km.f~factor(BMI_Level),data=main.f)    
      ggsurvplot(km_fit3, 
                 data=main.f,
                 conf.int=TRUE,
                 xlim = c(0,50),
                 xlab = "Time in Weeks",
                 surv.median.line = "hv",
                 legend.labs = c("Normal", "Overweight", "Obese"),
                 title = "Figure 3: Female Subsample Sample by BMI Classification",
                 ggtheme = theme_bw())

      km_fit4<-survfit(km.w~factor(BMI_Level),data=main.w)
      ggsurvplot(km_fit4, 
                 data=main.w,
                 conf.int=TRUE,
                 xlim = c(0, 50),
                 xlab = "Time in Weeks",
                 surv.median.line = "hv",
                 legend.labs = c("Normal", "Overweight", "Obese"),
                 title = "FIgure 2: White Subsample by Obesity Status",
                 ggtheme = theme_bw())
      
      
      km_fit5<-survfit(km.b~factor(BMI_Level),data=main.b)
      ggsurvplot(km_fit5, 
                 data=main.b,
                 conf.int=TRUE,
                 xlim = c(0, 50),
                 xlab = "Time in Weeks",
                 surv.median.line = "hv",
                 legend.labs = c("Normal", "Overweight", "Obese"),
                 title = "FIgure 3: Black Subsample by Obesity Status",
                 ggtheme = theme_bw())
      
      
      km_fit6<-survfit(km.h~factor(BMI_Level),data=main.h)
      ggsurvplot(km_fit6, 
                 data=main.h,
                 conf.int=TRUE,
                 xlim = c(0, 50),
                 xlab = "Time in Weeks",
                 surv.median.line = "hv",
                 legend.labs = c("Normal", "Overweight", "Obese"),
                 title = "FIgure 4: Hispanic Subsample by Obesity Status",
                 ggtheme = theme_bw())
    
    
      km_fit7<-survfit(km.o~factor(Race),data=main.o)
      ggsurvplot(km_fit7,
                 data=main.o,
                 conf.int=TRUE,
                 xlim = c(0, 50),
                 xlab = "Time in Weeks",
                 surv.median.line = "hv",
                 legend.labs = c("Black","Hispanic", "White"),
                 title = "Figure 5: Obese Subsample by Race",
                 ggtheme =theme_bw())

      # km_fit4<-survfit(km.o~factor(Race),data=main.o)
      # ggsurvplot(km_fit4, 
      #            data=main.o,
      #            conf.int=TRUE,
      #            xlim = c(0, 50),
      #            xlab = "Time in Weeks",
      #            surv.median.line = "hv",
      #            legend.labs = c("Black","Hispanic","White"),
      #            title = "Obese Subsample by Race",
      #            ggtheme = theme_bw())
      # 
      # km_fit4a<-survfit(km.no~factor(Race),data=main.no)
      # ggsurvplot(km_fit4a, 
      #            data=main.no,
      #            conf.int=TRUE,
      #            xlim = c(0, 50),
      #            xlab = "Time in Weeks",
      #            surv.median.line = "hv",
      #            legend.labs = c("Black","Hispanic","White"),
      #            title = "Non-Obese Subsample by Race",
      #            ggtheme = theme_bw())
      # 
      # km_fit5<-survfit(km.fo~factor(Race),data=main.fo)
      # ggsurvplot(km_fit5, 
      #            data=main.fo,
      #            conf.int=TRUE,
      #            xlim = c(0, 50),
      #            xlab = "Time in Weeks",
      #            surv.median.line = "hv",
      #            legend.labs = c("Black","Hispanic","White"),
      #            title = "Obese Females by Race",
      #            ggtheme = theme_bw())
      # 
      # km_fit6<-survfit(km.mo~factor(Race),data=main.mo)
      # ggsurvplot(km_fit6, 
      #            data=main.mo,
      #            conf.int=TRUE,
      #            xlim = c(0, 50),
      #            xlab = "Time in Weeks",
      #            surv.median.line = "hv",
      #            legend.labs = c("Black","Hispanic","White"),
      #            title = "Obese Males by Race",
      #            ggtheme = theme_bw())

#Modeling
    mod1<-coxph(km~Overweight+Obese,data=main)
    mod1p<-survreg(km~Overweight+Obese,data=main, dist="weibull")
    mod1pl<-survreg(km~L_Overweight+L_Obese,data=main, dist="weibull")
    mod1l<-coxph(km~L_Overweight+L_Obese, data=main)
    mod1.fr<-coxph(km~Overweight+Obese+frailty(ID),data=main)
    mod1p.fr<-survreg(km~Overweight+Obese+frailty(ID),data=main, dist="weibull")
    mod1pl.fr<-survreg(km~L_Overweight+L_Obese+frailty(ID),data=main, dist="weibull")

    htmlreg(list(mod1,mod1l,mod1.fr, mod1p, mod1pl, mod1p.fr,mod1pl.fr),
            digist = 4,
            custom.model.names = c("CoxPH","CoxPH-Lagged","CoxPH - Frailty","Weibutll - AFT",
                                   "AFT - Lagged","AFT - Frailty",
                                   "AFT-Lagged-Frailty"),
            file="./Analysis/Output/Model1.html")
    
    mod2<-coxph(km~Overweight+Obese+Female+Age+Married+Seperated+Black+Hispanic+
                  Child6+GFinc+HS+SomeCol+CollegePlus+Score+Ten+Exp+
                  Average+Poor+NorCen+South+West+
                  frailty(ID), data=main)
 
    mod2l<-coxph(km~L_Overweight+L_Obese+Female+Age+Married+Seperated+Black+Hispanic+
                  Child6+GFinc+HS+SomeCol+CollegePlus+Score+Ten+Exp+
                   Average+Poor+NorCen+South+West+
                  frailty(ID), data=main)
    
    mod2p<-survreg(km~Overweight+Obese+Female+Age+Married+Seperated+Black+Hispanic+
                  Child6+GFinc+HS+SomeCol+CollegePlus+Score+Ten+Exp+
                    Average+Poor+NorCen+South+West+
                  frailty(ID), data=main, dist="weibull")
    
    mod2pl<-survreg(km~L_Overweight+L_Obese+Female+Age+Married+Seperated+Black+Hispanic+
                     Child6+GFinc+HS+SomeCol+CollegePlus+Score+Ten+Exp+
                      Average+Poor+NorCen+South+West+
                     frailty(ID), data=main, dist="weibull")
    
    htmlreg(list(mod2, mod2l, mod2p, mod2pl),
            digits = 4,
            custom.model.names = c("CoxPH","CoxPH - Lagged","AFT","AFT - Lagged"),
            file="./Analysis/Output/Model2.html")
    
    mod3<-survreg(km~Overweight+Obese+Female+Age+Married+Seperated+Black+Hispanic+
                  Child6+GFinc+HS+SomeCol+CollegePlus+Score+Ten+Exp+
                  Average+Poor+NorCen+South+West+URATE+UNION+SearchCT+Forced+
                  Ended+Illness+Quit+
                  frailty(ID), data=main, dist="weibull")
    
    mod3l<-survreg(km~L_Overweight+L_Obese+Female+Age+Married+Seperated+Black+Hispanic+
                  Child6+GFinc+HS+SomeCol+CollegePlus+Score+Ten+Exp+
                  Average+Poor+NorCen+South+West+URATE+UNION+SearchCT+Forced+
                  Ended+Illness+Quit+
                  frailty(ID), data=main, dist="weibull")
   
    
    mod3fe<-coxph(km~Overweight+Obese+Female+Age+Married+Seperated+Black+Hispanic+
                  Child6+GFinc+HS+SomeCol+CollegePlus+Score+Ten+Exp+
                  Average+Poor+NorCen+South+West+URATE+UNION+SearchCT+Forced+
                  Ended+Illness+Quit+factor(OCC2)+factor(IND2)+
                  frailty(ID), data=main)
    
    mod3pfe<-survreg(km~Overweight+Obese+Female+Age+Married+Seperated+Black+Hispanic+
                    Child6+GFinc+HS+SomeCol+CollegePlus+Score+Ten+Exp+
                    Average+Poor+NorCen+South+West+URATE+UNION+SearchCT+Forced+
                    Ended+Illness+Quit+factor(OCC2)+factor(IND2)+
                    frailty(ID), data=main, dist="weibull")
    
    mod3plfe<-survreg(km~L_Overweight+L_Obese+Female+Age+Married+Seperated+Black+Hispanic+
                   Child6+GFinc+HS+SomeCol+CollegePlus+Score+Ten+Exp+
                   Average+Poor+NorCen+South+West+URATE+UNION+SearchCT+Forced+
                   Ended+Illness+Quit+factor(OCC2)+factor(IND2)+
                   frailty(ID), data=main, dist="weibull")
    
    htmlreg(list(mod3, mod3l, mod3fe, mod3pfe, mod3plfe),
            file="./Analysis/Output/Model3.html",
            digits = 4,
            custom.model.names = c("AFT", "AFT_Lagged","CoxPH_FE","AFT_FE","AFT_FE_Lagged"),
            omit.coef = "factor")
    
#Breakdown by sex    
    main$FOV<-main$Female*main$Overweight
    main$FOB<-main$Female*main$Obese
    main$MOV<-(1-main$Female)*main$Overweight
    main$MOB<-(1-main$Female)*main$Obese
    main$FNO<-main$Female*main$Normal
    
    mod4s<-survreg(km~FNO+FOV+FOB+MOV+MOB+Age+Married+Seperated+Black+Hispanic+
                       Child6+GFinc+HS+SomeCol+CollegePlus+Score+Ten+Exp+
                       Average+Poor+NorCen+South+West+URATE+UNION+SearchCT+Forced+
                       Ended+Illness+Quit+factor(OCC2)+factor(IND2)+
                       frailty(ID), data=main, dist="weibull")
    
#Breakdown by Race
    main$WNO<-main$White*main$Normal
    main$WOV<-main$White*main$Overweight
    main$WOB<-main$White*main$Obese
    main$HNO<-main$Hispanic*main$Normal
    main$HOV<-main$Hispanic*main$Overweight
    main$HOB<-main$Hispanic*main$Obese
    main$BNO<-main$Black*main$Normal
    main$BOV<-main$Black*main$Overweight
    main$BOB<-main$Black*main$Obese
    
    mod4r<-survreg(km~WOV+WOB+HNO+HOV+HOB+BNO+BOV+BOB+Female+Age+Married+Seperated+
                     Child6+GFinc+HS+SomeCol+CollegePlus+Score+Ten+Exp+
                     Average+Poor+NorCen+South+West+URATE+UNION+SearchCT+Forced+
                     Ended+Illness+Quit+factor(OCC2)+factor(IND2)+
                     frailty(ID), data=main, dist="weibull")
    
    htmlreg(list(mod4s, mod4r),
            file="./Analysis/Output/Model4.html",
            digits = 4,
            custom.model.names = c("Sex Interactions","Race Interaction"),
            caption = "Table 4: Characteristic Subsets",
            caption.above = TRUE,
            omit.coef = "factor")
    
    