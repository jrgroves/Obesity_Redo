#This estimates the duration models using a logit version as per R and R
#January 18, 2023


rm(list=ls())

library(tidyverse)
library(survival)
library(coxme)
library(lme4)
library(data.table)

#Load constructed data and create core analysis data
load("./Build/Output/gaps97.RData")

    #Creation of Logit Time variable
    b<-gaps %>%
      arrange(ID, Spell.Num) %>%
      uncount(length) %>%
      group_by(ID, Spell.Num) %>%
      mutate(count = rowid(ID, Spell.Num),
             ended = case_when(count == max(rowid(ID, Spell.Num)) ~ 1,
                               TRUE ~ 0),
             count = factor(as.character(count)),
             count = relevel(count, ref="1")) %>%
             #failyr = factor(max(count)),
             #failyr = relevel(failyr, ref="1")) %>%
      arrange(ID, Spell.Num)

load("./Build/Output/core97.RData")
load("./Build/Output/Controls97.RData")
load("./Build/Output/Score.RData")
load("./Build/Input/unemp.RData")

main <- core %>%
  inner_join(., b, by=c("ID", "Year")) %>%
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
         !is.na(URATE))

main<-main %>%
  select(-Year.x, -Health.raw, -Weight.r, -URBAN, -Height.r, -Year.y) %>%
  filter(((Age-16)*52) > Ten) %>%
  mutate(Ovr21 = case_when(Age <= 21 ~ 0,
                           Age > 21 ~ 1))


rm(core, core.cont, core.s, gaps, unemp)

#Modeling

mod1<-glm(ended ~ BMI_Level + count, data=main, family = binomial())
mod1L<-glm(ended ~ BMI_Level_L + count, data=subset(main, !is.na(BMI_Level_L)), family = binomial())


mod2<-glm(ended ~ BMI_Level + Race + Marriage + Education + Ovr21 +
                  Age + Child6 + GFinc + HH_Size + Score + Ten + Exp +
                  Health + Region + count, data=main, family = binomial())

#mod2.fr<-coxme(Surv(length, event)~BMI_Level+Race+Marriage+Education+Ovr21+
#                 Age+Child6+GFinc+HH_Size+Score+Ten+Exp+Health+Region+(1|ID),
#               data=submain)

#Addition of Industry, Occupation, and Economy

mod3<-glm(ended ~ BMI_Level + Race + Marriage + Education + Ovr21 +
                  Age + Child6 + GFinc + HH_Size + Score + Ten + Exp + 
                  Health + Region + URATE + SearchCT + Term + count, data=main, family = binomial())

#mod3.fr<-coxme(Surv(length, event)~BMI_Level+Race+Marriage+Education+Ovr21+
#                 Age+Child6+GFinc+HH_Size+Score+Ten+Exp+Health+Region+
#                 URATE+SearchCT+Term+(1|ID),
#               data=submain)

#mod3.fr.int<-coxme(Surv(length, event)~BMI_Level+Race+BMI_Level*Race+Marriage+Education+Ovr21+
#                     Age+Child6+GFinc+HH_Size+Score+Ten+Exp+Health+Region+
#                     URATE+SearchCT+Term+(1|ID),
#                   data=submain)

mod4<-glm(ended ~ BMI_Level + Race + Marriage + Education + Ovr21 +
                  Age + Child6 + GFinc + HH_Size + Score + Ten + Exp +
                  Health + Region + URATE + SearchCT + Term + Union + 
                  OCC2 + IND2 + count, data = main, family = binomial())
            

#mod4.fr<-coxme(Surv(length, event)~BMI_Level+Race+Marriage+Education+Ovr21+
##                 Age+Child6+GFinc+HH_Size+Score+Ten+Exp+Health+Region+
#                 URATE+SearchCT+Term+Union+OCC2+IND2+(1|ID), 
#               data=submain)

#mod4.fr.int<-coxme(Surv(length, event)~BMI_Level+Race+BMI_Level*Race+Marriage+Education+Ovr21+
##                     Age+Child6+GFinc+HH_Size+Score+Ten+Exp+Health+Region+
#                     URATE+SearchCT+Term+Union+OCC2+IND2+(1|ID), data=submain)

base <- save(mod4, mod3, mod2, mod1L, mod1, file="./Analysis/Output/Base.RData")

black<-main %>%
  subset(Race == "Black") %>%
  mutate(OCC2 = droplevels(OCC2),
         IND2 = droplevels(IND2),
         count = droplevels(count))


mod3B<-glm(ended ~ BMI_Level + Marriage + Education + Age + Ovr21 + Child6 + 
                  GFinc + HH_Size + Score + Ten + Exp + Health + Region +
                  URATE + SearchCT + Term + count, data=black, family=binomial())

mod4B<-glm(ended ~ BMI_Level + Marriage + Education + Age + Ovr21 + Child6 + 
            GFinc + HH_Size + Score + Ten + Exp + Health + Region +
            URATE + SearchCT + Term + Union + OCC2 + IND2 + count, data=black, family=binomial())
  
black<-main %>%
  subset(Race == "Black" & Gender == "Female") %>%
  mutate(OCC2 = droplevels(OCC2),
         IND2 = droplevels(IND2),
         count = droplevels(count))

mod3BF<-glm(ended ~ BMI_Level + Marriage + Education + Age + Ovr21 + Child6 + 
             GFinc + HH_Size + Score + Ten + Exp + Health + Region +
             URATE + SearchCT + Term + count, data=black, family=binomial())

mod4BF<-glm(ended ~ BMI_Level + Marriage + Education + Age + Ovr21 + Child6 + 
             GFinc + HH_Size + Score + Ten + Exp + Health + Region +
             URATE + SearchCT + Term + Union + OCC2 + IND2 + count, data=black, family=binomial())

black<-main %>%
  subset(Race == "Black" & Gender == "Male") %>%
  mutate(OCC2 = droplevels(OCC2),
         IND2 = droplevels(IND2),
         count = droplevels(count))

mod3BM<-glm(ended ~ BMI_Level + Marriage + Education + Age + Ovr21 + Child6 + 
             GFinc + HH_Size + Score + Ten + Exp + Health + Region +
             URATE + SearchCT + Term + count, data=black, family=binomial())

mod4BM<-glm(ended ~ BMI_Level + Marriage + Education + Age + Ovr21 + Child6 + 
             GFinc + HH_Size + Score + Ten + Exp + Health + Region +
             URATE + SearchCT + Term + Union + OCC2 + IND2 + count, data=black, family=binomial())

white<-main %>%
  subset(Race == "White")%>%
  mutate(OCC2 = droplevels(OCC2),
         IND2 = droplevels(IND2),
         count = droplevels(count))

mod3W<-glm(ended ~ BMI_Level + Marriage + Education + Age + Ovr21 + Child6 + 
             GFinc + HH_Size + Score + Ten + Exp + Health + Region +
             URATE + SearchCT + Term + count, data=white, family=binomial())

mod4W<-glm(ended ~ BMI_Level + Marriage + Education + Age + Ovr21 + Child6 + 
             GFinc + HH_Size + Score + Ten + Exp + Health + Region +
             URATE + SearchCT + Term + Union + OCC2 + IND2 + count, data=white, family=binomial())

white<-main %>%
  subset(Race == "White" & Gender == "Female")%>%
  mutate(OCC2 = droplevels(OCC2),
         IND2 = droplevels(IND2),
         count = droplevels(count))

mod3WF<-glm(ended ~ BMI_Level + Marriage + Education + Age + Ovr21 + Child6 + 
             GFinc + HH_Size + Score + Ten + Exp + Health + Region +
             URATE + SearchCT + Term + count, data=white, family=binomial())

mod4WF<-glm(ended ~ BMI_Level + Marriage + Education + Age + Ovr21 + Child6 + 
             GFinc + HH_Size + Score + Ten + Exp + Health + Region +
             URATE + SearchCT + Term + Union + OCC2 + IND2 + count, data=white, family=binomial())

white<-main %>%
  subset(Race == "White" & Gender == "Male") %>%
  mutate(OCC2 = droplevels(OCC2),
         IND2 = droplevels(IND2),
         count = droplevels(count))

mod3WM<-glm(ended ~ BMI_Level + Marriage + Education + Age + Ovr21 + Child6 + 
             GFinc + HH_Size + Score + Ten + Exp + Health + Region +
             URATE + SearchCT + Term + count, data=white, family=binomial())

mod4WM<-glm(ended ~ BMI_Level + Marriage + Education + Age + Ovr21 + Child6 + 
             GFinc + HH_Size + Score + Ten + Exp + Health + Region +
             URATE + SearchCT + Term + Union + OCC2 + IND2 + count, data=white, family=binomial())

hispan<-main %>%
  subset(Race == "Hispanic")%>%
  mutate(OCC2 = droplevels(OCC2),
         IND2 = droplevels(IND2),
         count = droplevels(count))

mod3H<-glm(ended ~ BMI_Level + Marriage + Education + Age + Ovr21 + Child6 + 
             GFinc + HH_Size + Score + Ten + Exp + Health + Region +
             URATE + SearchCT + Term + count, data=hispan, family=binomial())

mod4H<-glm(ended ~ BMI_Level + Marriage + Education + Age + Ovr21 + Child6 + 
             GFinc + HH_Size + Score + Ten + Exp + Health + Region +
             URATE + SearchCT + Term + Union + OCC2 + IND2 + count, data=hispan, family=binomial())

hispan<-main %>%
  subset(Race == "Hispanic" & Gender == "Female") %>%
  mutate(OCC2 = droplevels(OCC2),
         IND2 = droplevels(IND2),
         count = droplevels(count))

mod3HF<-glm(ended ~ BMI_Level + Marriage + Education + Age + Ovr21 + Child6 + 
             GFinc + HH_Size + Score + Ten + Exp + Health + Region +
             URATE + SearchCT + Term + count, data=hispan, family=binomial())

mod4HF<-glm(ended ~ BMI_Level + Marriage + Education + Age + Ovr21 + Child6 + 
             GFinc + HH_Size + Score + Ten + Exp + Health + Region +
             URATE + SearchCT + Term + Union + OCC2 + IND2 + count, data=hispan, family=binomial())

hispan<-main %>%
  subset(Race == "Hispanic" & Gender == "Male") %>%
  mutate(OCC2 = droplevels(OCC2),
         IND2 = droplevels(IND2),
         count = droplevels(count))

mod3HM<-glm(ended ~ BMI_Level + Marriage + Education + Age + Ovr21 + Child6 + 
             GFinc + HH_Size + Score + Ten + Exp + Health + Region +
             URATE + SearchCT + Term + count, data=hispan, family=binomial())

mod4HM<-glm(ended ~ BMI_Level + Marriage + Education + Age + Ovr21 + Child6 + 
             GFinc + HH_Size + Score + Ten + Exp + Health + Region +
             URATE + SearchCT + Term + Union + OCC2 + IND2 + count, data=hispan, family=binomial())
