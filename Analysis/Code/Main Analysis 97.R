#Joins data and perform analysis using NLSY 97 Data
#By Jeremy Groves
#January 26, 2021

#Modified January 19, 2022. survreg with Weibull and frailty was not connect and is no
#longer a possibility. Changed to cox proportional model using coxme with mixed effects
#in terms of the frailty of ID. Also utilized factor approach on factor variables.

#Modified December 19, 2022: Making correction for revise and resubmit. This is the file to use


rm(list=ls())

library(tidyverse)
library(survival)
library(fastDummies)
library(vtable)
library(stargazer)
library(survminer)
library(coxme)

#Load constructed data and create core analysis data
load("./Build/Output/gaps97.RData")
load("./Build/Output/core97.RData")
load("./Build/Output/Controls97.RData")
load("./Build/Output/Score.RData")
load("./Build/Input/unemp.RData")

main <- core %>%
  inner_join(., gaps, by=c("ID", "Year")) %>%
  filter(Race != "Mixed") %>%
  mutate(Gender = factor(Gender),
         Gender = relevel(Gender, ref="Male"),
         BMI_Level = factor(BMI_Level, level=c("Normal","Overweight","Obese", "Underweight")),
         BMI_Level = relevel(BMI_Level, ref="Normal"),
         BMI_Level_L = factor(BMI_Level_L, level=c("Normal","Overweight","Obese", "Underweight")),
         BMI_Level_L = relevel(BMI_Level_L, ref="Normal"),
         Race = factor(Race),
         Race = relevel(Race, ref="White")) %>%
  inner_join(., core.s, by="ID") %>%
  inner_join(., core.cont, by=c("ID", "Year")) %>%
  #rename(Spell.Start = period) %>%
  left_join(., unemp, by=c("Spell.Start", "Region")) %>%
  mutate(Reason = replace(Reason, is.na(Reason), "Unknown"),
          Region = factor(Region),
          Region = relevel(Region, ref="West"),
          Education = factor(Education),
          Education = relevel(Education, ref="LessHS"),
          Health = factor(Health),
          Health = relevel(Health, ref="Good"),
          Marriage = factor(Marriage),
          Marriage = relevel(Marriage, ref="NeverMarried"),
          OCC2 = case_when(is.na(OCC2) ~ "00",
                           TRUE ~ OCC2),
          IND2 = case_when(is.na(IND2) ~ "OTH",
                           TRUE ~ IND2),
          Term = case_when(is.na(Term) ~ "Unknown",
                          TRUE ~ Term),
          Term = factor(Term),
          Term = relevel(Term, ref="Unknown"),
          OCC2 = factor(OCC2),
          OCC2 = relevel(OCC2, ref="00"),
          IND2 = factor(IND2),
          IND2 = relevel(IND2, ref="OTH"),
          Union = ifelse(is.na(Union),0,Union),
          Exp = ifelse(is.na(Exp), 0, Exp))
  


  #Remove NAs and subset data
    main <- main %>%
      mutate(BMI_Level2 = case_when(BMI_Level=="Normal" ~ "Normal",
                                    BMI_Level=="Overweight" ~ "Normal",
                                    BMI_Level== "Underweight" ~ "Underweight",
                                    BMI_Level=="Obese" ~ "Obese")) %>%
      filter(!is.na(BMI_Level),
             !is.na(Region),
             !is.na(Education),
             !is.na(Health),
             !is.na(GFinc),
             !is.na(Ten),
             !is.na(Score),
             !is.na(Marriage),
             !is.na(Child6),
             !is.na(URATE),
             length > 0)

  main<-main %>%
    select(-Year.x, -Health.raw, -Weight.r, -URBAN, -Height.r, -Year.y) %>%
    filter(((Age-16)*52) > Ten) %>%
    mutate(Ovr21 = case_when(Age <= 21 ~ 0,
                             Age > 21 ~ 1))

     
#Summary Statistics for Paper

  a<-as.data.frame(model.matrix(~Gender - 1, data=main))
  b<-as.data.frame(model.matrix(~BMI_Level - 1, data=main))
  c<-as.data.frame(model.matrix(~Race - 1, data=main))
  d<-as.data.frame(model.matrix(~Region - 1, data=main))
  e<-as.data.frame(model.matrix(~Marriage - 1, data=main))
  f<-as.data.frame(model.matrix(~Health - 1, data=main))
  g<-as.data.frame(model.matrix(~Education - 1, data=main))
  h<-as.data.frame(model.matrix(~Term - 1, data=main))
  
  sumfac<-main %>%
    select(ID,length, BMI, Age, Child6, HH_Size, GFinc, URATE,
           Score,SearchCT, Ten, Exp, Union)
  sumfac<-as.data.frame(cbind(sumfac,a,b,c,d,e,f,g,h))
  
  
rm(a,b,c,d,e,f,g,h)
  stargazer(sumfac, subset(sumfac, GenderFemale==1), subset(sumfac, GenderMale==1),
            type="text", out="./Analysis/Output/full.txt")
  
  
  stargazer(sumfac, subset(sumfac, BMI_LevelNormal==1), subset(sumfac, BMI_LevelOverweight==1), 
            subset(sumfac, BMI_LevelObese==1), subset(sumfac, BMI_LevelUnderweight == 1),
            type="text",out="./Analysis/Output/obesity.txt")
  
  
  stargazer(subset(sumfac, RaceWhite==1), subset(sumfac, RaceBlack==1), subset(sumfac, RaceHispanic==1),
            type="text",out="./Analysis/Output/race.txt")
  
#K-M Nonparameter Curve Graphs
  
  fit <- survfit(Surv(length, event) ~ BMI_Level, data = main)
  ggsurvplot(fit, 
             data=main, 
             conf.int = TRUE,
             conf.int.style = "step",
             xlim = c(0, 30),
             xlab = "Time in weeks",
             break.time.by = 2,
             surv.median.line = "hv",
             legend.labs = c("Normal", "Overweight", "Obese", "Underweight"),
             title = "Figure 1:K-M Survival by BMI Level",
             #palette = "grey",
             theme = theme_bw())
  
   fit <- survfit(Surv(length, event) ~ BMI_Level, data = subset(main, Gender=="Female"))
  ggsurvplot(fit, 
             data=subset(main, Gender=="Female"), 
             conf.int = TRUE,
             conf.int.style = "step",
             xlim = c(0, 30),
             xlab = "Time in weeks",
             break.time.by = 2,
             surv.median.line = "hv",
             legend.labs = c("Normal", "Overweight", "Obese", "Underweight"),
             title = "Figure 2:K-M Survival for Females by BMI Level",
             #palette = "grey",
             theme = theme_bw())
  
  fit <- survfit(Surv(length, event) ~ BMI_Level, data = subset(main, Gender=="Male"))
  ggsurvplot(fit, 
             data=subset(main, Gender=="Male"), 
             conf.int = TRUE,
             conf.int.style = "step",
             xlim = c(0, 30),
             xlab = "Time in weeks",
             break.time.by = 2,
             surv.median.line = "hv",
             legend.labs = c("Normal", "Overweight", "Obese", "Underweight"),
             title = "Figure 3:K-M Survival for Males by BMI Level",
             #palette = "grey",
             theme = theme_bw())
  

  
#Modeling
    mod1<-coxph(Surv(length, event)~BMI_Level, data=main)
    mod1L<-coxph(Surv(length, event)~BMI_Level_L, data=subset(main, !is.na(BMI_Level_L)))
    
    mod1.fr<-coxme(Surv(length, event)~BMI_Level+(1|ID), data=main)
    mod1L.fr<-coxme(Surv(length, event)~BMI_Level_L+(1|ID), data=subset(main, !is.na(BMI_Level_L)))
    
  #Addition of individual specific elements
    
    mod2<-coxph(Surv(length, event)~BMI_Level+Gender+Race+Marriage+Education+
                  Age+Child6+GFinc+HH_Size+Score+Ten+Exp+Health+Region,
                data=main)
    
    mod2.fr<-coxme(Surv(length, event)~BMI_Level+Gender+Race+Marriage+Education+
                  Age+Child6+GFinc+HH_Size+Score+Ten+Exp+Health+Region+(1|ID),
                data=main)

   
    
    #Not needed because initial difference in Lagged was due to programer error.
    #mod2L.fr<-coxme(Surv(Spell, event)~BMI_Level_L+Gender+Race+Marriage+Education+
    #                 Age+Child6+GFinc+HH_Size+Score+Ten+Exp+Health+Region+(1|ID),
    #               data=subset(main, !is.na(BMI_Level_L)))
                   
    #Addition of Industry, Occupation, and Economy
    mod3<-coxph(Surv(length, event)~BMI_Level+Gender+Race+Marriage+Education+
                  Age+Child6+GFinc+HH_Size+Score+Ten+Exp+Health+Region+
                  URATE+SearchCT+Term,
                data=main)
    
    mod3.fr<-coxme(Surv(length, event)~BMI_Level+Gender+Race+Marriage+Education+
                  Age+Child6+GFinc+HH_Size+Score+Ten+Exp+Health+Region+
                  URATE+SearchCT+Term+(1|ID),
                data=main)
    

    
    mod4<-coxph(Surv(length, event)~BMI_Level+Gender+Race+Marriage+Education+
                  Age+Child6+GFinc+HH_Size+Score+Ten+Exp+Health+Region+
                  URATE+SearchCT+Term+Union+OCC2+IND2,
                data=main)
    
    mod4.fr<-coxme(Surv(length, event)~BMI_Level+Gender+Race+Marriage+Education+
                     Age+Child6+GFinc+HH_Size+Score+Ten+Exp+Health+Region+
                     URATE+SearchCT+Term+Union+OCC2+IND2+(1|ID),
                   data=main)
    

    
    save(mod1,mod1L, mod1.fr, mod1L.fr, mod2, mod2.fr, mod3, mod3.fr,mod4, mod4.fr,
         file="./Analysis/Output/fullmod.RData")
    
#Analysis by Gender####
    
    submain<-main %>%
      subset(Gender=="Female")
    
    mod1<-coxph(Surv(length, event)~BMI_Level, data=submain)
    mod1L<-coxph(Surv(length, event)~BMI_Level_L, data=subset(submain, !is.na(BMI_Level_L)))
    
    mod1.fr<-coxme(Surv(length, event)~BMI_Level+(1|ID), data=submain)
    mod1L.fr<-coxme(Surv(length, event)~BMI_Level_L+(1|ID), data=subset(submain, !is.na(BMI_Level_L)))
    
    #Addition of individual specific elements
    
    mod2<-coxph(Surv(length, event)~BMI_Level+Race+Marriage+Education+
                  Age+Child6+GFinc+HH_Size+Score+Ten+Exp+Health+Region,
                data=submain)
    
    mod2.fr<-coxme(Surv(length, event)~BMI_Level+Race+Marriage+Education+
                                      Age+Child6+GFinc+HH_Size+Score+Ten+Exp+Health+Region+(1|ID),
                                      data=submain)
    mod2.fr.int<-coxme(Surv(length, event)~BMI_Level+Race+BMI_Level*Race+Marriage+Education+
                                          Age+Child6+GFinc+HH_Size+Score+Ten+Exp+Health+Region+(1|ID),
                                          data=submain)
    
    #Addition of Industry, Occupation, and Economy
    
    
    mod3<-coxph(Surv(length, event)~BMI_Level+Race+Marriage+Education+
                  Age+Child6+GFinc+HH_Size+Score+Ten+Exp+Health+Region+
                  URATE+SearchCT+Term,
                data=submain)
    
    mod3.fr<-coxme(Surv(length, event)~BMI_Level+Race+Marriage+Education+
                     Age+Child6+GFinc+HH_Size+Score+Ten+Exp+Health+Region+
                     URATE+SearchCT+Term+(1|ID),
                   data=submain)
    
    mod3.fr.int<-coxme(Surv(length, event)~BMI_Level+Race+BMI_Level*Race+Marriage+Education+
                     Age+Child6+GFinc+HH_Size+Score+Ten+Exp+Health+Region+
                     URATE+SearchCT+Term+(1|ID),
                   data=submain)
    
    mod4<-coxph(Surv(length, event)~BMI_Level+Race+Marriage+Education+
                  Age+Child6+GFinc+HH_Size+Score+Ten+Exp+Health+Region+
                  URATE+SearchCT+Term+Union+OCC2+IND2,
                data=submain)
    
    mod4.fr<-coxme(Surv(length, event)~BMI_Level+Race+Marriage+Education+
                     Age+Child6+GFinc+HH_Size+Score+Ten+Exp+Health+Region+
                     URATE+SearchCT+Term+Union+OCC2+IND2+(1|ID), 
                     data=submain)
    
    mod4.fr.int<-coxme(Surv(length, event)~BMI_Level+Race+BMI_Level*Race+Marriage+Education+
                         Age+Child6+GFinc+HH_Size+Score+Ten+Exp+Health+Region+
                         URATE+SearchCT+Term+Union+OCC2+IND2+(1|ID), data=submain)
    
    save(mod1,mod1L, mod1.fr, mod1L.fr, mod2, mod2.fr,mod2.fr.int, mod3, mod3.fr,
         mod3.fr.int, mod4, mod4.fr, mod4.fr.int,
         file="./Analysis/Output/femalemod.RData")
    
    submain<-main %>%
      subset(Gender=="Male")
    
    mod1<-coxph(Surv(length, event)~BMI_Level, data=submain)
    mod1L<-coxph(Surv(length, event)~BMI_Level_L, data=subset(submain, !is.na(BMI_Level_L)))
    
    mod1.fr<-coxme(Surv(length, event)~BMI_Level+(1|ID), data=submain)
    mod1L.fr<-coxme(Surv(length, event)~BMI_Level_L+(1|ID), data=subset(submain, !is.na(BMI_Level_L)))
    
    #Addition of individual specific elements
    
    mod2<-coxph(Surv(length, event)~BMI_Level+Race+Marriage+Education+
                  Age+Child6+GFinc+HH_Size+Score+Ten+Exp+Health+Region,
                data=submain)
    
    mod2.fr<-coxme(Surv(length, event)~BMI_Level+Race+Marriage+Education+
                     Age+Child6+GFinc+HH_Size+Score+Ten+Exp+Health+Region+(1|ID),
                   data=submain)
    
    mod2.fr.int<-coxme(Surv(length, event)~BMI_Level+Race+BMI_Level*Race+Marriage+Education+
                         Age+Child6+GFinc+HH_Size+Score+Ten+Exp+Health+Region+(1|ID),
                       data=submain)
    
    #Addition of Industry, Occupation, and Economy
    
    
    mod3<-coxph(Surv(length, event)~BMI_Level+Race+Marriage+Education+
                  Age+Child6+GFinc+HH_Size+Score+Ten+Exp+Health+Region+
                  URATE+SearchCT+Term,
                data=submain)
    
    mod3.fr<-coxme(Surv(length, event)~BMI_Level+Race+Marriage+Education+
                     Age+Child6+GFinc+HH_Size+Score+Ten+Exp+Health+Region+
                     URATE+SearchCT+Term+(1|ID),
                   data=submain)
    
    mod3.fr.int<-coxme(Surv(length, event)~BMI_Level+Race+BMI_Level*Race+Marriage+Education+
                         Age+Child6+GFinc+HH_Size+Score+Ten+Exp+Health+Region+
                         URATE+SearchCT+Term+(1|ID),
                       data=submain)
    
    mod4<-coxph(Surv(length, event)~BMI_Level+Race+Marriage+Education+
                  Age+Child6+GFinc+HH_Size+Score+Ten+Exp+Health+Region+
                  URATE+SearchCT+Term+Union+OCC2+IND2,
                data=submain)
    
    mod4.fr<-coxme(Surv(length, event)~BMI_Level+Race+Marriage+Education+
                     Age+Child6+GFinc+HH_Size+Score+Ten+Exp+Health+Region+
                     URATE+SearchCT+Term+Union+OCC2+IND2+(1|ID),
                   data=submain)
    
    mod4.fr.int<-coxme(Surv(length, event)~BMI_Level+Race+BMI_Level*Race+Marriage+Education+
                         Age+Child6+GFinc+HH_Size+Score+Ten+Exp+Health+Region+
                         URATE+SearchCT+Term+Union+OCC2+IND2+(1|ID),
                       data=submain)
    
    save(mod1,mod1L, mod1.fr, mod1L.fr, mod2, mod2.fr,mod2.fr.int, mod3, mod3.fr,
         mod3.fr.int, mod4, mod4.fr, mod4.fr.int,
         file="./Analysis/Output/malemod.RData")
    
#Testing Statistics
    
  #Load a set of results first and then run these tests for significance
  #of Random Effects model
    
    mod1.llt<-pchisq(q=as.numeric(-2*(logLik(mod1)[1]-mod1.fr$loglik["Integrated"])),
                     df=mod1.fr$df[1]-1,lower.tail = FALSE)
    mod1L.llt<-pchisq(q=as.numeric(-2*(logLik(mod1L)[1]-mod1L.fr$loglik["Integrated"])),
                      df=mod1L.fr$df[1]-1,lower.tail = FALSE)
    mod2.llt<-pchisq(q=as.numeric(-2*(logLik(mod2)[1]-mod2.fr$loglik["Integrated"])),
                     df=mod2.fr$df[1]-1,lower.tail = FALSE)
    mod3.llt<-pchisq(q=as.numeric(-2*(logLik(mod3)[1]-mod3.fr$loglik["Integrated"])),
                     df=mod3.fr$df[1]-1,lower.tail = FALSE)
    mod4.llt<-pchisq(q=as.numeric(-2*(logLik(mod4)[1]-mod4.fr$loglik["Integrated"])),
                     df=mod4.fr$df[1]-1,lower.tail = FALSE)
    
    
    