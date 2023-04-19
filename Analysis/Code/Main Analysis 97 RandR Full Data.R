#This is a supplement to the Main Analysis 97.R
#We address questions raised by the reviewer in R and R

#April 3, 2023: This is a full data run with all survey years. Spells which start in even years after 2011 are 
#               removed for missing weight and height data in this version of the analysis.

rm(list=ls())

library(tidyverse)
library(survival)
library(fastDummies)
library(vtable)
library(stargazer)
library(survminer)
library(coxme)
library(ehahelper)
library(broom)

#Function to output results from both coxph and coxme ####

summe<-function(d, c, b, a){
  
  temp <- as_tibble(tidy(d)[,c(1:3, 5)])
  temp2 <- tidy(c)[,c(1:3, 5)]
  temp3 <- as_tibble(tidy(b)[,c(1:3, 5)])
  temp4 <- tidy(a)[,c(1:3, 5)]
  
  out<-left_join(temp, temp2, by= "term") %>%
    left_join(., temp3, by= "term") %>%
    left_join(., temp4, by= "term")
  
  return(out)
}


#Load constructed data and create core analysis data####

load("./Build/Output/gaps97.RData")
load("./Build/Output/core97FD.RData")
load("./Build/Output/Controls97.RData")
load("./Build/Output/Score.RData")
load("./Build/Input/unemp.RData")

load("./Build/Input/mismatch.RData")

main <- core %>%
  inner_join(., gaps, by=c("ID", "Year")) %>%
  filter(Race != "Mixed") %>%
  mutate(Gender = factor(Gender),
         Gender = relevel(Gender, ref="Male"),
         BMI_Level = factor(BMI_Level, level=c("Underweight","Normal","Overweight","Obese")),
         BMI_Level = relevel(BMI_Level, ref="Normal"),
         BMI_Level_L = factor(BMI_Level_L, level=c("Underweight","Normal","Overweight","Obese")),
         BMI_Level_L = relevel(BMI_Level_L, ref="Normal"),
         Race = factor(Race),
         Race = relevel(Race, ref="White")) %>%
  inner_join(., core.s, by="ID") %>%
  inner_join(., core.cont, by=c("ID", "Year")) %>%
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
         Exp = ifelse(is.na(Exp), 0, Exp),
         Expa = Exp,
         Tena = Ten,
         Exp = Tena,
         Ten = Expa,
         Plan = factor(Plan),
         Plan = relevel(Plan, ref="4")) %>%
  select(!Tena, !Expa)

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
         !is.na(Exp),
         !is.na(Score),
         !is.na(Marriage),
         !is.na(Child6),
         !is.na(URATE),
         #!is.na(Plan), Plan is not in the post 2011 data
         length > 0)

main<-main %>%
  select(-Year.x, -Health.raw, -Weight.r, -URBAN, -Height.r, -Tena, -Expa) %>%
  filter(((Age-16)*52) > Exp) %>%
  filter(Ten <= Exp) %>%
  mutate(Ovr21 = case_when(Age <= 21 ~ 0,
                           Age > 21 ~ 1),
         OCC2 = droplevels(OCC2),
         IND2 = droplevels(IND2)) %>%
  rename(Year = Year.y) %>%
  filter(!grepl('2012', Spell.Start),
         !grepl('2014', Spell.Start),
         !grepl('2016', Spell.Start),
         !grepl('2018', Spell.Start),
         !grepl('2020', Spell.Start),
         !grepl('2022', Spell.Start)) #maybe remove everything after 
  

rm(core, core.cont, core.s, gaps)

#Summary Statistics for Paper####

a<-as.data.frame(model.matrix(~Gender - 1, data=main))
b<-as.data.frame(model.matrix(~BMI_Level - 1, data=main))
c<-as.data.frame(model.matrix(~Race - 1, data=main))
d<-as.data.frame(model.matrix(~Region - 1, data=main))
e<-as.data.frame(model.matrix(~Marriage - 1, data=main))
f<-as.data.frame(model.matrix(~Health - 1, data=main))
g<-as.data.frame(model.matrix(~Education - 1, data=main))
h<-as.data.frame(model.matrix(~Term - 1, data=main))
#i<-as.data.frame(model.matrix(~Plan - 1, data=main))

sumfac<-main %>%
  select(ID,length, BMI, Age, Ovr21, Child6, HH_Size, GFinc, URATE,
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


temp <- main %>%
  filter(BMI_Level=="Obese") %>%
  distinct(ID)

#K-M Nonparameter Curve Graphs####

fit <- survfit(Surv(length, event) ~ BMI_Level, data = main)
ggsurvplot(fit, 
           data=main, 
           conf.int = FALSE,
           #conf.int.style = "step",
           xlim = c(0, 30),
           xlab = "Time in weeks",
           break.time.by = 2,
           surv.median.line = "hv",
           legend.labs = c("Underweight", "Normal", "Overweight", "Obese"),
           title = "Figure 1:K-M Survival by BMI Level",
           palette = "grey",
           linetype = c(4, 1, 2, 3),
           theme = theme_bw())

fit <- survfit(Surv(length, event) ~ BMI_Level, data = subset(main, Gender=="Female"))
ggsurvplot(fit, 
           data=subset(main, Gender=="Female"), 
           conf.int = FALSE,
           #conf.int.style = "step",
           xlim = c(0, 30),
           xlab = "Time in weeks",
           break.time.by = 2,
           surv.median.line = "hv",
           legend.labs = c("Underweight", "Normal", "Overweight", "Obese"),
           title = "Figure 2:K-M Survival for Females by BMI Level",
           palette = "grey",
           linetype = c(4, 1, 2, 3),
           theme = theme_bw())

fit <- survfit(Surv(length, event) ~ BMI_Level, data = subset(main, Gender=="Male"))
ggsurvplot(fit, 
           data=subset(main, Gender=="Male"), 
           conf.int = FALSE,
           #conf.int.style = "step",
           xlim = c(0, 30),
           xlab = "Time in weeks",
           break.time.by = 2,
           surv.median.line = "hv",
           legend.labs = c("Underweight", "Normal", "Overweight", "Obese"),
           title = "Figure 3:K-M Survival for Males by BMI Level",
           palette = "grey",
           linetype = c(4, 1, 2, 3),
           theme = theme_bw())

fit.W <- survfit(Surv(length, event) ~ BMI_Level, data = subset(main, Race=="White"))
fit.WF <- survfit(Surv(length, event) ~ BMI_Level, data = subset(main, Race=="White" & Gender=="Female"))
fit.WM <- survfit(Surv(length, event) ~ BMI_Level, data = subset(main, Race=="White" & Gender=="Male"))
fit.B <- survfit(Surv(length, event) ~ BMI_Level, data = subset(main, Race=="Black"))
fit.BF <- survfit(Surv(length, event) ~ BMI_Level, data = subset(main, Race=="Black" & Gender=="Female"))
fit.BM <- survfit(Surv(length, event) ~ BMI_Level, data = subset(main, Race=="Black" & Gender=="Male"))
fit.H <- survfit(Surv(length, event) ~ BMI_Level, data = subset(main, Race=="Hispanic"))
fit.HF <- survfit(Surv(length, event) ~ BMI_Level, data = subset(main, Race=="Hispanic" & Gender=="Female"))
fit.HM <- survfit(Surv(length, event) ~ BMI_Level, data = subset(main, Race=="Hispanic" & Gender=="Male"))



#Main Model Estimations of Full Sample, Lags, and Gender Split with Interactions####

mod1<-coxph(Surv(length, event)~BMI_Level, data=main)
mod1L<-coxph(Surv(length, event)~BMI_Level_L, data=subset(main, !is.na(BMI_Level_L)))

mod1.fr<-coxme(Surv(length, event)~BMI_Level+(1|ID), data=main)
mod1L.fr<-coxme(Surv(length, event)~BMI_Level_L+(1|ID), data=subset(main, !is.na(BMI_Level_L)))

#Addition of individual specific elements

mod2<-coxph(Surv(length, event)~BMI_Level+Gender+Race+Marriage+Education+Ovr21+
              Age+Child6+GFinc+HH_Size+Score+Ten+Exp+Health+Region,
            data=main)

mod2.fr<-coxme(Surv(length, event)~BMI_Level+Gender+Race+Marriage+Education+Ovr21+
                     Age+Child6+GFinc+HH_Size+Score+Ten+Exp+Health+Region+(1|ID),
                   data=main)

mod2.fr.int<-coxme(Surv(length, event)~BMI_Level+Gender+Race+BMI_Level*Race+Marriage+Education+Ovr21+
                     Age+Child6+GFinc+HH_Size+Score+Ten+Exp+Health+Region+(1|ID),
                   data=main)

#Addition of Industry, Occupation, and Economy

mod3<-coxph(Surv(length, event)~BMI_Level+Gender+Race+Marriage+Education+Ovr21+
              Age+Child6+GFinc+HH_Size+Score+Ten+Exp+Health+Region+
              URATE+SearchCT+Term,
            data=main)

mod3.fr<-coxme(Surv(length, event)~BMI_Level+Gender+Race+Marriage+Education+Ovr21+
                 Age+Child6+GFinc+HH_Size+Score+Ten+Exp+Health+Region+
                 URATE+SearchCT+Term+(1|ID),
               data=main)

mod3.fr.int<-coxme(Surv(length, event)~BMI_Level+Gender+Race+BMI_Level*Race+Marriage+Education+Ovr21+
                     Age+Child6+GFinc+HH_Size+Score+Ten+Exp+Health+Region+
                     URATE+SearchCT+Term+(1|ID),
                   data=main)

mod4<-coxph(Surv(length, event)~BMI_Level+Gender+Race+Marriage+Education+Ovr21+
              Age+Child6+GFinc+HH_Size+Score+Ten+Exp+Health+Region+
              URATE+SearchCT+Term+Union+OCC2+IND2,
            data=main)

mod4.fr<-coxme(Surv(length, event)~BMI_Level+Gender+Race+Marriage+Education+Ovr21+
                 Age+Child6+GFinc+HH_Size+Score+Ten+Exp+Health+Region+
                 URATE+SearchCT+Term+Union+OCC2+IND2+(1|ID), 
               data=main)

mod4.fr.int<-coxme(Surv(length, event)~BMI_Level+Gender+Race+BMI_Level*Race+Marriage+Education+Ovr21+
                     Age+Child6+GFinc+HH_Size+Score+Ten+Exp+Health+Region+
                     URATE+SearchCT+Term+Union+OCC2+IND2+(1|ID), data=main)

#Estimate with lagged BMI Classification

submain <- main %>%
  filter(!is.na(BMI_Level_L))

mod1L.fr<-coxme(Surv(length, event)~BMI_Level_L+(1|ID), data=submain)

mod2L.fr<-coxme(Surv(length, event)~BMI_Level+Gender+Race+Marriage+Education+Ovr21+
                 Age+Child6+GFinc+HH_Size+Score+Ten+Exp+Health+Region+(1|ID),
               data=submain)

mod3L.fr<-coxme(Surv(length, event)~BMI_Level+Gender+Race+Marriage+Education+Ovr21+
                 Age+Child6+GFinc+HH_Size+Score+Ten+Exp+Health+Region+
                 URATE+SearchCT+Term+(1|ID),
               data=submain)

mod4L.fr<-coxme(Surv(length, event)~BMI_Level+Gender+Race+Marriage+Education+Ovr21+
                 Age+Child6+GFinc+HH_Size+Score+Ten+Exp+Health+Region+
                 URATE+SearchCT+Term+Union+OCC2+IND2+(1|ID), 
               data=submain)

#Female Sub sample
submain<-main %>%
  filter(Gender=="Female") %>%
  mutate(OCC2 = droplevels(OCC2),
         IND2 = droplevels(IND2))

mod3F.fr.int<-coxme(Surv(length, event)~BMI_Level+Race+BMI_Level*Race+Marriage+Education+Ovr21+
                     Age+Child6+GFinc+HH_Size+Score+Ten+Exp+Health+Region+
                     URATE+SearchCT+Term+(1|ID),
                   data=submain)

mod4F.fr<-coxme(Surv(length, event)~BMI_Level+Race+Marriage+Education+Ovr21+
                 Age+Child6+GFinc+HH_Size+Score+Ten+Exp+Health+Region+
                 URATE+SearchCT+Term+Union+OCC2+IND2+(1|ID), 
               data=submain)

mod4F.fr.int<-coxme(Surv(length, event)~BMI_Level+Race+BMI_Level*Race+Marriage+Education+Ovr21+
                     Age+Child6+GFinc+HH_Size+Score+Ten+Exp+Health+Region+
                     URATE+SearchCT+Term+Union+OCC2+IND2+(1|ID), data=submain)


submain<-main %>%
  filter(Gender=="Male") %>%
  mutate(OCC2 = droplevels(OCC2),
         IND2 = droplevels(IND2))

mod3M.fr.int<-coxme(Surv(length, event)~BMI_Level+Race+BMI_Level*Race+Marriage+Education+Ovr21+
                     Age+Child6+GFinc+HH_Size+Score+Ten+Exp+Health+Region+
                     URATE+SearchCT+Term+(1|ID),
                   data=submain)

mod4M.fr<-coxme(Surv(length, event)~BMI_Level+Race+Marriage+Education+Ovr21+
                  Age+Child6+GFinc+HH_Size+Score+Ten+Exp+Health+Region+
                  URATE+SearchCT+Term+Union+OCC2+IND2+(1|ID), 
                data=submain)

mod4M.fr.int<-coxme(Surv(length, event)~BMI_Level+Race+BMI_Level*Race+Marriage+Education+Ovr21+
                      Age+Child6+GFinc+HH_Size+Score+Ten+Exp+Health+Region+
                      URATE+SearchCT+Term+Union+OCC2+IND2+(1|ID), data=submain)

out1<-summe(mod4.fr.int, mod4.fr, mod3.fr.int, mod3.fr)
out2<-summe(mod4F.fr.int, mod4M.fr.int, mod4F.fr, mod4M.fr)

base <- save(mod4.fr.int, mod4.fr, mod3.fr.int, mod3.fr, mod4F.fr, mod4F.fr.int, mod4M.fr, mod4M.fr.int,
             file="./Analysis/Output/BaseRR.RData")

#Model Estimation with Racial and Gender Sub-samples#####

black<-main %>%
  subset(Race == "Black") %>%
  mutate(OCC2 = droplevels(OCC2),
         IND2 = droplevels(IND2))
  

mod3<-coxph(Surv(length, event)~BMI_Level+Gender+Marriage+Education+
              Age+Ovr21+Child6+GFinc+HH_Size+Score+Ten+Exp+Health+Region+
              URATE+SearchCT+Term,
            data=black)

mod3.fr<-coxme(Surv(length, event)~BMI_Level+Gender+Marriage+Education+
                 Age+Ovr21+Child6+GFinc+HH_Size+Score+Ten+Exp+Health+Region+
                 URATE+SearchCT+Term+(1|ID),
               data=black)

mod4<-coxph(Surv(length, event)~BMI_Level+Gender+Marriage+Education+
              Age+Ovr21+Child6+GFinc+HH_Size+Score+Ten+Exp+Health+Region+
              URATE+SearchCT+Term+Union+OCC2+IND2,
            data=black)

mod4.fr<-coxme(Surv(length, event)~BMI_Level+Gender+Marriage+Education+
                 Age+Ovr21+Child6+GFinc+HH_Size+Score+Ten+Exp+Health+Region+
                 URATE+SearchCT+Term+Union+OCC2+IND2+(1|ID), 
               data=black)
save(mod3, mod3.fr, mod4, mod4.fr, file="./Analysis/Output/black_all.RData")

outB<-summe(mod4.fr, mod4, mod3.fr, mod3)

black<-main %>%
  subset(Race == "Black" & Gender == "Female") %>%
  mutate(OCC2 = droplevels(OCC2),
         IND2 = droplevels(IND2))

mod3<-coxph(Surv(length, event)~BMI_Level+Marriage+Education+
               Age+Ovr21+Child6+GFinc+HH_Size+Score+Ten+Exp+Health+Region+
               URATE+SearchCT+Term,
             data=black)

mod3.fr<-coxme(Surv(length, event)~BMI_Level+Marriage+Education+
                  Age+Ovr21+Child6+GFinc+HH_Size+Score+Ten+Exp+Health+Region+
                  URATE+SearchCT+Term+(1|ID),
                data=black)

mod4<-coxph(Surv(length, event)~BMI_Level+Marriage+Education+
               Age+Ovr21+Child6+GFinc+HH_Size+Score+Ten+Exp+Health+Region+
               URATE+SearchCT+Term+Union+OCC2+IND2,
             data=black)

mod4.fr<-coxme(Surv(length, event)~BMI_Level+Marriage+Education+
                  Age+Ovr21+Child6+GFinc+HH_Size+Score+Ten+Exp+Health+Region+
                  URATE+SearchCT+Term+Union+OCC2+IND2+(1|ID), 
                data=black)

save(mod3, mod3.fr, mod4, mod4.fr, file="./Analysis/Output/black_female.RData")

outBF<-summe(mod4.fr, mod4, mod3.fr, mod3)

black<-main %>%
  subset(Race == "Black" & Gender == "Male") %>%
  mutate(OCC2 = droplevels(OCC2),
         IND2 = droplevels(IND2))

mod3<-coxph(Surv(length, event)~BMI_Level+Marriage+Education+
               Age+Ovr21+Child6+GFinc+HH_Size+Score+Ten+Exp+Health+Region+
               URATE+SearchCT+Term,
             data=black)

mod3.fr<-coxme(Surv(length, event)~BMI_Level+Marriage+Education+
                  Age+Ovr21+Child6+GFinc+HH_Size+Score+Ten+Exp+Health+Region+
                  URATE+SearchCT+Term+(1|ID),
                data=black)

mod4<-coxph(Surv(length, event)~BMI_Level+Marriage+Education+
               Age+Ovr21+Child6+GFinc+HH_Size+Score+Ten+Exp+Health+Region+
               URATE+SearchCT+Term+Union+OCC2+IND2,
             data=black)

mod4.fr<-coxme(Surv(length, event)~BMI_Level+Marriage+Education+
                  Age+Child6+GFinc+HH_Size+Score+Ten+Exp+Health+Region+
                  URATE+SearchCT+Term+Union+OCC2+IND2+(1|ID), 
                data=black)

save(mod3, mod3.fr, mod4, mod4.fr, file="./Analysis/Output/black_male.RData")

outBM<-summe(mod4.fr, mod4, mod3.fr, mod3)


white<-main %>%
  subset(Race == "White")%>%
  mutate(OCC2 = droplevels(OCC2),
         IND2 = droplevels(IND2))

mod3<-coxph(Surv(length, event)~BMI_Level+Gender+Marriage+Education+
               Age+Ovr21+Child6+GFinc+HH_Size+Score+Ten+Exp+Health+Region+
               URATE+SearchCT+Term,
             data=white)

mod3.fr<-coxme(Surv(length, event)~BMI_Level+Gender+Marriage+Education+
                  Age+Ovr21+Child6+GFinc+HH_Size+Score+Ten+Exp+Health+Region+
                  URATE+SearchCT+Term+(1|ID),
                data=white)

mod4<-coxph(Surv(length, event)~BMI_Level+Gender+Marriage+Education+
               Age+Ovr21+Child6+GFinc+HH_Size+Score+Ten+Exp+Health+Region+
               URATE+SearchCT+Term+Union+OCC2+IND2,
             data=white)

mod4.fr<-coxme(Surv(length, event)~BMI_Level+Gender+Marriage+Education+
                  Age+Ovr21+Child6+GFinc+HH_Size+Score+Ten+Exp+Health+Region+
                  URATE+SearchCT+Term+Union+OCC2+IND2+(1|ID), 
                data=white)

save(mod3, mod3.fr, mod4, mod4.fr, file="./Analysis/Output/white_all.RData")

outW<-summe(mod4.fr, mod4, mod3.fr, mod3)

white<-main %>%
  subset(Race == "White" & Gender == "Female")%>%
  mutate(OCC2 = droplevels(OCC2),
         IND2 = droplevels(IND2))

mod3<-coxph(Surv(length, event)~BMI_Level+Marriage+Education+
               Age+Ovr21+Child6+GFinc+HH_Size+Score+Ten+Exp+Health+Region+
               URATE+SearchCT+Term,
             data=white)

mod3.fr<-coxme(Surv(length, event)~BMI_Level+Marriage+Education+
                  Age+Ovr21+Child6+GFinc+HH_Size+Score+Ten+Exp+Health+Region+
                  URATE+SearchCT+Term+(1|ID),
                data=white)

mod4<-coxph(Surv(length, event)~BMI_Level+Marriage+Education+
               Age+Ovr21+Child6+GFinc+HH_Size+Score+Ten+Exp+Health+Region+
               URATE+SearchCT+Term+Union+OCC2+IND2,
             data=white)

mod4.fr<-coxme(Surv(length, event)~BMI_Level+Marriage+Education+
                  Age+Ovr21+Child6+GFinc+HH_Size+Score+Ten+Exp+Health+Region+
                  URATE+SearchCT+Term+Union+OCC2+IND2+(1|ID), 
                data=white)

save(mod3, mod3.fr, mod4, mod4.fr, file="./Analysis/Output/white_female.RData")

outWF<-summe(mod4.fr, mod4, mod3.fr, mod3)

white<-main %>%
  subset(Race == "White" & Gender == "Male") %>%
  mutate(OCC2 = droplevels(OCC2),
         IND2 = droplevels(IND2))

mod3<-coxph(Surv(length, event)~BMI_Level+Marriage+Education+
                Age+Ovr21+Child6+GFinc+HH_Size+Score+Ten+Exp+Health+Region+
                URATE+SearchCT+Term,
              data=white)

mod3.fr<-coxme(Surv(length, event)~BMI_Level+Marriage+Education+
                   Age+Ovr21+Child6+GFinc+HH_Size+Score+Ten+Exp+Health+Region+
                   URATE+SearchCT+Term+(1|ID),
                 data=white)

mod4<-coxph(Surv(length, event)~BMI_Level+Marriage+Education+
                Age+Ovr21+Child6+GFinc+HH_Size+Score+Ten+Exp+Health+Region+
                URATE+SearchCT+Term+Union+OCC2+IND2,
              data=white)

mod4.fr<-coxme(Surv(length, event)~BMI_Level+Marriage+Education+
                   Age+Ovr21+Child6+GFinc+HH_Size+Score+Ten+Exp+Health+Region+
                   URATE+SearchCT+Term+Union+OCC2+IND2+(1|ID), 
                 data=white)

save(mod3, mod3.fr, mod4, mod4.fr, file="./Analysis/Output/white_male.RData")

outWM<-summe(mod4.fr, mod4, mod3.fr, mod3)

hispan<-main %>%
  subset(Race == "Hispanic")%>%
  mutate(OCC2 = droplevels(OCC2),
         IND2 = droplevels(IND2))

mod3<-coxph(Surv(length, event)~BMI_Level+Gender+Marriage+Education+
               Age+Ovr21+Child6+GFinc+HH_Size+Score+Ten+Exp+Health+Region+
               URATE+SearchCT+Term,
             data=hispan)

mod3.fr<-coxme(Surv(length, event)~BMI_Level+Gender+Marriage+Education+
                  Age+Ovr21+Child6+GFinc+HH_Size+Score+Ten+Exp+Health+Region+
                  URATE+SearchCT+Term+(1|ID),
                data=hispan)

mod4<-coxph(Surv(length, event)~BMI_Level+Gender+Marriage+Education+
               Age+Ovr21+Child6+GFinc+HH_Size+Score+Ten+Exp+Health+Region+
               URATE+SearchCT+Term+Union+OCC2+IND2,
             data=hispan)

mod4.fr<-coxme(Surv(length, event)~BMI_Level+Gender+Marriage+Education+
                  Age+Ovr21+Child6+GFinc+HH_Size+Score+Ten+Exp+Health+Region+
                  URATE+SearchCT+Term+Union+OCC2+IND2+(1|ID), 
                data=hispan)
save(mod3, mod3.fr, mod4, mod4.fr, file="./Analysis/Output/hispan_all.RData")

outH<-summe(mod4.fr, mod4, mod3.fr, mod3)

hispan<-main %>%
  subset(Race == "Hispanic" & Gender == "Female") %>%
  mutate(OCC2 = droplevels(OCC2),
         IND2 = droplevels(IND2))

mod3<-coxph(Surv(length, event)~BMI_Level+Marriage+Education+
               Age+Ovr21+Child6+GFinc+HH_Size+Score+Ten+Exp+Health+Region+
               URATE+SearchCT+Term,
             data=hispan)

mod3.fr<-coxme(Surv(length, event)~BMI_Level+Marriage+Education+
                  Age+Ovr21+Child6+GFinc+HH_Size+Score+Ten+Exp+Health+Region+
                  URATE+SearchCT+Term+(1|ID),
                data=hispan)

mod4<-coxph(Surv(length, event)~BMI_Level+Marriage+Education+
               Age+Ovr21+Child6+GFinc+HH_Size+Score+Ten+Exp+Health+Region+
               URATE+SearchCT+Term+Union+OCC2+IND2,
             data=hispan)

mod4.fr<-coxme(Surv(length, event)~BMI_Level+Marriage+Education+
                  Age+Ovr21+Child6+GFinc+HH_Size+Score+Ten+Exp+Health+Region+
                  URATE+SearchCT+Term+Union+OCC2+IND2+(1|ID), 
                data=hispan)
save(mod3, mod3.fr, mod4, mod4.fr, file="./Analysis/Output/hispan_female.RData")

outHF<-summe(mod4.fr, mod4, mod3.fr, mod3)

hispan<-main %>%
  subset(Race == "Hispanic" & Gender == "Male") %>%
  mutate(OCC2 = droplevels(OCC2),
         IND2 = droplevels(IND2))

mod3<-coxph(Surv(length, event)~BMI_Level+Marriage+Education+
               Age+Ovr21+Child6+GFinc+HH_Size+Score+Ten+Exp+Health+Region+
               URATE+SearchCT+Term,
             data=hispan)

mod3.fr<-coxme(Surv(length, event)~BMI_Level+Marriage+Education+
                  Age+Ovr21+Child6+GFinc+HH_Size+Score+Ten+Exp+Health+Region+
                  URATE+SearchCT+Term+(1|ID),
                data=hispan)

mod4<-coxph(Surv(length, event)~BMI_Level+Marriage+Education+
               Age+Ovr21+Child6+GFinc+HH_Size+Score+Ten+Exp+Health+Region+
               URATE+SearchCT+Term+Union+OCC2+IND2,
             data=hispan)

mod4.fr<-coxme(Surv(length, event)~BMI_Level+Marriage+Education+
                  Age+Ovr21+Child6+GFinc+HH_Size+Score+Ten+Exp+Health+Region+
                  URATE+SearchCT+Term+Union+OCC2+IND2+(1|ID), 
                data=hispan)

save(mod3, mod3.fr, mod4, mod4.fr, file="./Analysis/Output/hispan_male.RData")
save.image(file="./Analysis/Output/MainAnalysis.RData")

outHM<-summe(mod4.fr, mod4, mod3.fr, mod3)

#Writing of csv files for input into Excel for Tables####

write.csv(out1, file="./Analysis/Output/base.csv") #Full Sample
write.csv(out2, file="./Analysis/Output/base2.csv") #Sample by Gender
write.csv(outB, file="./Analysis/Output/outB.csv")
write.csv(outBF, file="./Analysis/Output/outBF.csv")
write.csv(outBM, file="./Analysis/Output/outBM.csv")
write.csv(outW, file="./Analysis/Output/outW.csv")
write.csv(outWF, file="./Analysis/Output/outWF.csv")
write.csv(outWM, file="./Analysis/Output/outWM.csv")
write.csv(outH, file="./Analysis/Output/outH.csv")
write.csv(outHF, file="./Analysis/Output/outHF.csv")
write.csv(outHM, file="./Analysis/Output/outHM.csv")


