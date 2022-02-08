#Joins data and perform analysis using NLSY 97 Data
#By Jeremy Groves
#January 26, 2021
#Modified January 19, 2022. survreg with Weibull and frailty was not connect and is no
#longer a possibility. Changed to cox proportional model using coxme with mixed effects
#in terms of the frailty of ID. Also utilized factor approach on factor variables.


rm(list=ls())

library(tidyverse)
library(survival)
library(fastDummies)
library(vtable)
library(jstable)
library(stargazer)
library(survminer)
library(coxme)

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
   
  #Create Remove NAs and subset data
    main <- main %>%
      mutate(BMI_Level2=ifelse(BMI_Level=="Normal" | BMI_Level=="Overweight",
                               "Normal",BMI_Level),
             Spell = spell_length) %>%
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

       
  #Create Factors for Categorical Variables
  main <- main %>%
    mutate(Sex = factor(Sex),
           Sex = relevel(Sex, ref="Male"),
           BMI_Level = factor(BMI_Level, level=c("Normal","Overweight","Obese")),
           BMI_Level = relevel(BMI_Level, ref="Normal"),
           Race = factor(Race),
           Race = relevel(Race, ref="White"),
           Region = factor(Region),
           Region = relevel(Region, ref="West"),
           Education = factor(Education),
           Education = relevel(Education, ref="LessHS"),
           Health = factor(Health),
           Health = relevel(Health, ref="Good"),
           Marriage = factor(Marriage),
           Marriage = relevel(Marriage, ref="NeverMarried"),
           Term = factor(TERM),
           Term = relevel(Term, ref="Unknown")) %>%
    replace_na(list(OCC2 = "00", IND2 = "OTH")) %>%
           mutate(OCC2 = factor(OCC2),
                  OCC2 = relevel(OCC2, ref="00"),
                  IND2 = factor(IND2),
                  IND2 = relevel(IND2, ref="OTH")) %>%
    group_by((ID)) %>%
      mutate(BMI_Level_L = lag(BMI_Level),
             BMI_Level_L = factor(BMI_Level_L, levels=c("Normal","Overweight","Obese")),
             BMI_Level_L = relevel(BMI_Level_L, ref="Normal")) %>%
    ungroup()

  main<-main %>%
    select(-Year.x, -zW, -Health.raw, -Week, -Weight, -URBAN, -Height, -Year.y)
     
#Summary Statistics for Paper

  a<-as.data.frame(model.matrix(~Sex - 1, data=main))
  b<-as.data.frame(model.matrix(~BMI_Level - 1, data=main))
  c<-as.data.frame(model.matrix(~Race - 1, data=main))
  d<-as.data.frame(model.matrix(~Region - 1, data=main))
  e<-as.data.frame(model.matrix(~Marriage - 1, data=main))
  f<-as.data.frame(model.matrix(~Health - 1, data=main))
  g<-as.data.frame(model.matrix(~Education - 1, data=main))
  h<-as.data.frame(model.matrix(~Term - 1, data=main))
  
  sumfac<-main %>%
    select(ID,Spell, BMI, Age, Child6, HH_Size, GFinc, URATE,
           Score,SearchCT, Ten, Exp, UNION)
  sumfac<-cbind(sumfac,a,b,c,d,e,f,g,h)
  
  rm(a,b,c,d,e,f,g,h)
  stargazer(sumfac, subset(sumfac, SexMale==1), subset(sumfac, SexFemale==1),
            type="text",out="./Analysis/Output/full.txt")
  stargazer(sumfac, subset(sumfac, BMI_LevelNormal==1), subset(sumfac, BMI_LevelOverweight==1), 
            subset(sumfac, BMI_LevelObese==1),type="text",out="./Analysis/Output/obesity.txt")
  stargazer(subset(sumfac, RaceWhite==1), subset(sumfac, RaceBlack==1), subset(sumfac, RaceHispanic==1),
            type="text",out="./Analysis/Output/race.txt")
  
#K-M Nonparameter Curve Graphs
  
  fit <- survfit(Surv(Spell, event) ~ BMI_Level, data = main)
  ggsurvplot(fit, 
             data=main, 
             conf.int = TRUE,
             conf.int.style = "step",
             xlim = c(0, 30),
             xlab = "Time in weeks",
             break.time.by = 2,
             surv.median.line = "hv",
             legend.labs = c("Normal", "Overweight", "Obese"),
             title = "Figure 1:K-M Survival by BMI Level",
             palette = "grey",
             theme = theme_bw())
  
  fit <- survfit(Surv(Spell, event) ~ BMI_Level, data = subset(main, Sex=="Female"))
  ggsurvplot(fit, 
             data=subset(main, Sex=="Female"), 
             conf.int = TRUE,
             conf.int.style = "step",
             xlim = c(0, 30),
             xlab = "Time in weeks",
             break.time.by = 2,
             surv.median.line = "hv",
             legend.labs = c("Normal", "Overweight", "Obese"),
             title = "Figure 2:K-M Survival for Females by BMI Level",
             palette = "grey",
             theme = theme_bw())
  
  fit <- survfit(Surv(Spell, event) ~ BMI_Level, data = subset(main, Sex=="Male"))
  ggsurvplot(fit, 
             data=subset(main, Sex=="Male"), 
             conf.int = TRUE,
             conf.int.style = "step",
             xlim = c(0, 30),
             xlab = "Time in weeks",
             break.time.by = 2,
             surv.median.line = "hv",
             legend.labs = c("Normal", "Overweight", "Obese"),
             title = "Figure 3:K-M Survival for Males by BMI Level",
             palette = "grey",
             theme = theme_bw())
  

  
#Modeling
    mod1<-coxph(Surv(Spell, event)~BMI_Level, data=main)
    mod1L<-coxph(Surv(Spell, event)~BMI_Level_L, data=subset(main, !is.na(BMI_Level_L)))
    
    mod1.fr<-coxme(Surv(Spell, event)~BMI_Level+(1|ID), data=main)
    mod1L.fr<-coxme(Surv(Spell, event)~BMI_Level_L+(1|ID), data=subset(main, !is.na(BMI_Level_L)))
    
    #Addition of individual specific elements
    
    mod2<-coxph(Surv(Spell, event)~BMI_Level+Sex+Race+Marriage+Education+
                  Age+Child6+GFinc+Score+Ten+Exp+Health+Region,
                data=main)
    
    mod2.fr<-coxme(Surv(Spell, event)~BMI_Level+Sex+Race+Marriage+Education+
                  Age+Child6+GFinc+Score+Ten+Exp+Health+Region+(1|ID),
                data=main)
    
    #Addition of Industry, Occupation, and Economy
    
    
    mod3<-coxph(Surv(Spell, event)~BMI_Level+Sex+Race+Marriage+Education+
                  Age+Child6+GFinc+Score+Ten+Exp+Health+Region+
                  URATE+SearchCT+Term,
                data=main)
    
    mod3.fr<-coxme(Surv(Spell, event)~BMI_Level+Sex+Race+Marriage+Education+
                  Age+Child6+GFinc+Score+Ten+Exp+Health+Region+
                  URATE+SearchCT+Term+(1|ID),
                data=main)
    
    mod4<-coxph(Surv(Spell, event)~BMI_Level+Sex+Race+Marriage+Education+
                  Age+Child6+GFinc+Score+Ten+Exp+Health+Region+
                  URATE+SearchCT+Term+UNION+OCC2+IND2,
                data=main)
    
    mod4.fr<-coxme(Surv(Spell, event)~BMI_Level+Sex+Race+Marriage+Education+
                     Age+Child6+GFinc+Score+Ten+Exp+Health+Region+
                     URATE+SearchCT+Term+UNION+OCC2+IND2+(1|ID),
                   data=main)
    
    save(mod1,mod1L, mod1.fr, mod1L.fr, mod2, mod2.fr, mod3, mod3.fr,mod4, mod4.fr,
         file="./Analysis/Output/fullmod.RData")
    
#Analysis by Sex####
    
    submain<-main %>%
      subset(Sex=="Female")
    
    mod1<-coxph(Surv(Spell, event)~BMI_Level, data=submain)
    mod1L<-coxph(Surv(Spell, event)~BMI_Level_L, data=subset(submain, !is.na(BMI_Level_L)))
    
    mod1.fr<-coxme(Surv(Spell, event)~BMI_Level+(1|ID), data=submain)
    mod1L.fr<-coxme(Surv(Spell, event)~BMI_Level_L+(1|ID), data=subset(submain, !is.na(BMI_Level_L)))
    
    #Addition of individual specific elements
    
    mod2<-coxph(Surv(Spell, event)~BMI_Level+Race+Marriage+Education+
                  Age+Child6+GFinc+Score+Ten+Exp+Health+Region,
                data=submain)
    
    mod2.fr<-coxme(Surv(Spell, event)~BMI_Level+Race+Marriage+Education+
                                      Age+Child6+GFinc+Score+Ten+Exp+Health+Region+(1|ID),
                                      data=submain)
    mod2.fr.int<-coxme(Surv(Spell, event)~BMI_Level+Race+BMI_Level*Race+Marriage+Education+
                                          Age+Child6+GFinc+Score+Ten+Exp+Health+Region+(1|ID),
                                          data=submain)
    
    #Addition of Industry, Occupation, and Economy
    
    
    mod3<-coxph(Surv(Spell, event)~BMI_Level+Race+Marriage+Education+
                  Age+Child6+GFinc+Score+Ten+Exp+Health+Region+
                  URATE+SearchCT+Term,
                data=submain)
    
    mod3.fr<-coxme(Surv(Spell, event)~BMI_Level+Race+Marriage+Education+
                     Age+Child6+GFinc+Score+Ten+Exp+Health+Region+
                     URATE+SearchCT+Term+(1|ID),
                   data=submain)
    
    mod3.fr.int<-coxme(Surv(Spell, event)~BMI_Level+Race+BMI_Level*Race+Marriage+Education+
                     Age+Child6+GFinc+Score+Ten+Exp+Health+Region+
                     URATE+SearchCT+Term+(1|ID),
                   data=submain)
    
    mod4<-coxph(Surv(Spell, event)~BMI_Level+Race+Marriage+Education+
                  Age+Child6+GFinc+Score+Ten+Exp+Health+Region+
                  URATE+SearchCT+Term+UNION+OCC2+IND2,
                data=submain)
    
    mod4.fr<-coxme(Surv(Spell, event)~BMI_Level+Race+Marriage+Education+
                     Age+Child6+GFinc+Score+Ten+Exp+Health+Region+
                     URATE+SearchCT+Term+UNION+OCC2+IND2+(1|ID),
                   data=submain)
    
    mod4.fr.int<-coxme(Surv(Spell, event)~BMI_Level+Race+BMI_Level*Race+Marriage+Education+
                     Age+Child6+GFinc+Score+Ten+Exp+Health+Region+
                     URATE+SearchCT+Term+UNION+OCC2+IND2+(1|ID),
                   data=submain)
    
    save(mod1,mod1L, mod1.fr, mod1L.fr, mod2, mod2.fr,mod2.fr.int, mod3, mod3.fr,
         mod3.fr.int, mod4, mod4.fr, mod4.fr.int,
         file="./Analysis/Output/femalemod.RData")
    
    submain<-main %>%
      subset(Sex=="Male")
    
    mod1<-coxph(Surv(Spell, event)~BMI_Level, data=submain)
    mod1L<-coxph(Surv(Spell, event)~BMI_Level_L, data=subset(submain, !is.na(BMI_Level_L)))
    
    mod1.fr<-coxme(Surv(Spell, event)~BMI_Level+(1|ID), data=submain)
    mod1L.fr<-coxme(Surv(Spell, event)~BMI_Level_L+(1|ID), data=subset(submain, !is.na(BMI_Level_L)))
    
    #Addition of individual specific elements
    
    mod2<-coxph(Surv(Spell, event)~BMI_Level+Race+Marriage+Education+
                  Age+Child6+GFinc+Score+Ten+Exp+Health+Region,
                data=submain)
    
    mod2.fr<-coxme(Surv(Spell, event)~BMI_Level+Race+Marriage+Education+
                     Age+Child6+GFinc+Score+Ten+Exp+Health+Region+(1|ID),
                   data=submain)
    
    mod2.fr.int<-coxme(Surv(Spell, event)~BMI_Level+Race+BMI_Level*Race+Marriage+Education+
                         Age+Child6+GFinc+Score+Ten+Exp+Health+Region+(1|ID),
                       data=submain)
    
    #Addition of Industry, Occupation, and Economy
    
    
    mod3<-coxph(Surv(Spell, event)~BMI_Level+Race+Marriage+Education+
                  Age+Child6+GFinc+Score+Ten+Exp+Health+Region+
                  URATE+SearchCT+Term,
                data=submain)
    
    mod3.fr<-coxme(Surv(Spell, event)~BMI_Level+Race+Marriage+Education+
                     Age+Child6+GFinc+Score+Ten+Exp+Health+Region+
                     URATE+SearchCT+Term+(1|ID),
                   data=submain)
    
    mod3.fr.int<-coxme(Surv(Spell, event)~BMI_Level+Race+BMI_Level*Race+Marriage+Education+
                         Age+Child6+GFinc+Score+Ten+Exp+Health+Region+
                         URATE+SearchCT+Term+(1|ID),
                       data=submain)
    
    mod4<-coxph(Surv(Spell, event)~BMI_Level+Race+Marriage+Education+
                  Age+Child6+GFinc+Score+Ten+Exp+Health+Region+
                  URATE+SearchCT+Term+UNION+OCC2+IND2,
                data=submain)
    
    mod4.fr<-coxme(Surv(Spell, event)~BMI_Level+Race+Marriage+Education+
                     Age+Child6+GFinc+Score+Ten+Exp+Health+Region+
                     URATE+SearchCT+Term+UNION+OCC2+IND2+(1|ID),
                   data=submain)
    
    mod4.fr.int<-coxme(Surv(Spell, event)~BMI_Level+Race+BMI_Level*Race+Marriage+Education+
                         Age+Child6+GFinc+Score+Ten+Exp+Health+Region+
                         URATE+SearchCT+Term+UNION+OCC2+IND2+(1|ID),
                       data=submain)
    
    save(mod1,mod1L, mod1.fr, mod1L.fr, mod2, mod2.fr,mod2.fr.int, mod3, mod3.fr,
         mod3.fr.int, mod4, mod4.fr, mod4.fr.int,
         file="./Analysis/Output/malemod.RData")