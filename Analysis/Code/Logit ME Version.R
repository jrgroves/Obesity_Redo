#This estimates the duration models using a logit mixed effects version as per R and R
#January 18, 2023


rm(list=ls())

library(tidyverse)
library(survival)
library(coxme)
library(lme4)
library(data.table)
library(broom)

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
         BMI_Level = factor(BMI_Level, level=c("Underweight","Normal","Overweight","Obese")),
         BMI_Level = relevel(BMI_Level, ref="Normal"),
         BMI_Level_L = factor(BMI_Level_L, level=c("Underweight","Normal","Overweight","Obese")),
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
         Exp = ifelse(is.na(Exp), 0, Exp),
         Expa = Exp,
         Tena = Ten,
         Exp = Tena,
         Ten = Expa) %>%
         #Plan = factor(Plan),
         #Plan = relevel(Plan, ref="4")) %>%
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
         !is.na(Ten),
         !is.na(Score),
         !is.na(Marriage),
         !is.na(Child6),
         !is.na(URATE))

main<-main %>%
  select(-Year.x, -Health.raw, -Weight.r, -URBAN, -Height.r,-count.x) %>%
  filter(((Age-16)*52) > Ten) %>%
  mutate(Ovr21 = case_when(Age <= 21 ~ 0,
                           Age > 21 ~ 1),
         count = count.y)




rm(core, core.cont, core.s, gaps, unemp)

#Function for reporting Results

meout<-function(a,b,c,d){
  
  temp<-as.data.frame(summary(a)$coefficients)
  temp$coefficients<-row.names(temp)
  
  temp1<-as.data.frame(summary(b)$coefficients)
  temp1$coefficients<-row.names(temp1)
  
  temp2<-as.data.frame(summary(c)$coefficients)
  temp2$coefficients<-row.names(temp2)
  
  temp3<-as.data.frame(summary(d)$coefficients)
  temp3$coefficients<-row.names(temp3)
  
  
  out<-left_join(temp, temp1, by="coefficients")  %>%
    left_join(., temp2, by="coefficients") %>%
    left_join(., temp3, by="coefficients")
  
  return(out)
}

#Modeling

mod1<-glmer(ended ~ BMI_Level + count + (1|ID), data=main, family = binomial, control = glmerControl(optimizer="bobyqa"), nAGQ=0)

mod2<-glmer(ended ~ BMI_Level + Gender + Race + Marriage + Education + Ovr21 +
                  Age + Child6 + GFinc + HH_Size + Score + Ten + Exp +
                  Health + Region + count+ (1|ID), data=main, family = binomial, control = glmerControl(optimizer="bobyqa"), nAGQ=0)

#Addition of Industry, Occupation, and Economy

mod3<-glmer(ended ~ BMI_Level + Gender + Race + Marriage + Education + Ovr21 +
                  Age + Child6 + GFinc + HH_Size + Score + Ten + Exp + 
                  Health + Region + URATE + SearchCT + Term + count+ (1|ID), data=main, family = binomial, control = glmerControl(optimizer="bobyqa"), nAGQ=0)
             

mod4<-glmer(ended ~ BMI_Level + Gender + Race + Marriage + Education + Ovr21 +
                  Age + Child6 + GFinc + HH_Size + Score + Ten + Exp +
                  Health + Region + URATE + SearchCT + Term + Union + 
                  OCC2 + IND2 + count+ (1|ID), data=main, family = binomial, control = glmerControl(optimizer="bobyqa"), nAGQ=0)

main.mod<-meout(mod4, mod3, mod2, mod1)

#Estimation by Race and Race-Gender

base <- save(mod4, mod3, mod2, mod1, file="./Analysis/Output/Baselogme.RData")

black<-main %>%
  subset(Race == "Black") %>%
  mutate(OCC2 = droplevels(OCC2),
         IND2 = droplevels(IND2),
         count = droplevels(count))


mod3B<-glmer(ended ~ BMI_Level + Gender + Marriage + Education + Age + Ovr21 + Child6 + 
                  GFinc + HH_Size + Score + Ten + Exp + Health + Region +
                  URATE + SearchCT + Term + count + (1|ID), data=black, 
           family = binomial, control = glmerControl(optimizer="bobyqa"), nAGQ=0)

mod4B<-glmer(ended ~ BMI_Level + Gender + Marriage + Education + Age + Ovr21 + Child6 + 
            GFinc + HH_Size + Score + Ten + Exp + Health + Region +
            URATE + SearchCT + Term + Union + OCC2 + IND2 + count + (1|ID), data=black,
           family = binomial, control = glmerControl(optimizer="bobyqa"), nAGQ=0)
  
black<-main %>%
  subset(Race == "Black" & Gender == "Female") %>%
  mutate(OCC2 = droplevels(OCC2),
         IND2 = droplevels(IND2),
         count = droplevels(count))

mod3BF<-glmer(ended ~ BMI_Level + Marriage + Education + Age + Ovr21 + Child6 + 
             GFinc + HH_Size + Score + Ten + Exp + Health + Region +
             URATE + SearchCT + Term + count + (1|ID), data=black, 
            family = binomial, control = glmerControl(optimizer="bobyqa"), nAGQ=0)

mod4BF<-glmer(ended ~ BMI_Level + Marriage + Education + Age + Ovr21 + Child6 + 
             GFinc + HH_Size + Score + Ten + Exp + Health + Region +
             URATE + SearchCT + Term + Union + OCC2 + IND2 + count + (1|ID), data=black, 
            family = binomial, control = glmerControl(optimizer="bobyqa"), nAGQ=0)

black<-main %>%
  subset(Race == "Black" & Gender == "Male") %>%
  mutate(OCC2 = droplevels(OCC2),
         IND2 = droplevels(IND2),
         count = droplevels(count))

mod3BM<-glmer(ended ~ BMI_Level + Marriage + Education + Age + Ovr21 + Child6 + 
             GFinc + HH_Size + Score + Ten + Exp + Health + Region +
             URATE + SearchCT + Term + count + (1|ID), data=black, 
            family = binomial, control = glmerControl(optimizer="bobyqa"), nAGQ=0)

mod4BM<-glmer(ended ~ BMI_Level + Marriage + Education + Age + Ovr21 + Child6 + 
             GFinc + HH_Size + Score + Ten + Exp + Health + Region +
             URATE + SearchCT + Term + Union + OCC2 + IND2 + count + (1|ID), data=black, 
            family = binomial, control = glmerControl(optimizer="bobyqa"), nAGQ=0)

black.mod<-meout(mod4B, mod4BF, mod4BM, mod3B)

white<-main %>%
  subset(Race == "White")%>%
  mutate(OCC2 = droplevels(OCC2),
         IND2 = droplevels(IND2),
         count = droplevels(count))

mod3W<-glmer(ended ~ BMI_Level + Gender + Marriage + Education + Age + Ovr21 + Child6 + 
             GFinc + HH_Size + Score + Ten + Exp + Health + Region +
             URATE + SearchCT + Term + count + (1|ID), data=white, 
           family = binomial, control = glmerControl(optimizer="bobyqa"), nAGQ=0)

mod4W<-glmer(ended ~ BMI_Level + Gender + Marriage + Education + Age + Ovr21 + Child6 + 
             GFinc + HH_Size + Score + Ten + Exp + Health + Region +
             URATE + SearchCT + Term + Union + OCC2 + IND2 + count + (1|ID), data=white, 
           family = binomial, control = glmerControl(optimizer="bobyqa"), nAGQ=0)

white<-main %>%
  subset(Race == "White" & Gender == "Female")%>%
  mutate(OCC2 = droplevels(OCC2),
         IND2 = droplevels(IND2),
         count = droplevels(count))

mod3WF<-glmer(ended ~ BMI_Level + Marriage + Education + Age + Ovr21 + Child6 + 
             GFinc + HH_Size + Score + Ten + Exp + Health + Region +
             URATE + SearchCT + Term + count + (1|ID), data=white, 
            family = binomial, control = glmerControl(optimizer="bobyqa"), nAGQ=0)

mod4WF<-glmer(ended ~ BMI_Level + Marriage + Education + Age + Ovr21 + Child6 + 
             GFinc + HH_Size + Score + Ten + Exp + Health + Region +
             URATE + SearchCT + Term + Union + OCC2 + IND2 + count + (1|ID), data=white, 
            family = binomial, control = glmerControl(optimizer="bobyqa"), nAGQ=0)

white<-main %>%
  subset(Race == "White" & Gender == "Male") %>%
  mutate(OCC2 = droplevels(OCC2),
         IND2 = droplevels(IND2),
         count = droplevels(count))

mod3WM<-glmer(ended ~ BMI_Level + Marriage + Education + Age + Ovr21 + Child6 + 
             GFinc + HH_Size + Score + Ten + Exp + Health + Region +
             URATE + SearchCT + Term + count + (1|ID), data=white, 
            family = binomial, control = glmerControl(optimizer="bobyqa"), nAGQ=0)

mod4WM<-glmer(ended ~ BMI_Level + Marriage + Education + Age + Ovr21 + Child6 + 
             GFinc + HH_Size + Score + Ten + Exp + Health + Region +
             URATE + SearchCT + Term + Union + OCC2 + IND2 + count + (1|ID), data=white, 
            family = binomial, control = glmerControl(optimizer="bobyqa"), nAGQ = 0)

white.mod<-meout(mod4W, mod4WF, mod4WM, mod3W)

hispan<-main %>%
  subset(Race == "Hispanic")%>%
  mutate(OCC2 = droplevels(OCC2),
         IND2 = droplevels(IND2),
         count = droplevels(count))

mod3H<-glmer(ended ~ BMI_Level + Gender + Marriage + Education + Age + Ovr21 + Child6 + 
             GFinc + HH_Size + Score + Ten + Exp + Health + Region +
             URATE + SearchCT + Term + count + (1|ID), data=hispan, 
           family = binomial, control = glmerControl(optimizer="bobyqa"), nAGQ=0)

mod4H<-glmer(ended ~ BMI_Level + Gender + Marriage + Education + Age + Ovr21 + Child6 + 
             GFinc + HH_Size + Score + Ten + Exp + Health + Region +
             URATE + SearchCT + Term + Union + OCC2 + IND2 + count + (1|ID), data=hispan, 
           family = binomial, control = glmerControl(optimizer="bobyqa"), nAGQ=0)

hispan<-main %>%
  subset(Race == "Hispanic" & Gender == "Female") %>%
  mutate(OCC2 = droplevels(OCC2),
         IND2 = droplevels(IND2),
         count = droplevels(count))

mod3HF<-glmer(ended ~ BMI_Level + Marriage + Education + Age + Ovr21 + Child6 + 
             GFinc + HH_Size + Score + Ten + Exp + Health + Region +
             URATE + SearchCT + Term + count + (1|ID), data=hispan, 
            family = binomial, control = glmerControl(optimizer="bobyqa"), nAGQ=0)

mod4HF<-glmer(ended ~ BMI_Level + Marriage + Education + Age + Ovr21 + Child6 + 
             GFinc + HH_Size + Score + Ten + Exp + Health + Region +
             URATE + SearchCT + Term + Union + OCC2 + IND2 + count + (1|ID), data=hispan, 
            family = binomial, control = glmerControl(optimizer="bobyqa"), nAGQ=0)

hispan<-main %>%
  subset(Race == "Hispanic" & Gender == "Male") %>%
  mutate(OCC2 = droplevels(OCC2),
         IND2 = droplevels(IND2),
         count = droplevels(count))

mod3HM<-glmer(ended ~ BMI_Level + Marriage + Education + Age + Ovr21 + Child6 + 
             GFinc + HH_Size + Score + Ten + Exp + Health + Region +
             URATE + SearchCT + Term + count + (1|ID), data=hispan, 
            family = binomial, control = glmerControl(optimizer="bobyqa"), nAGQ=0)

mod4HM<-glmer(ended ~ BMI_Level + Marriage + Education + Age + Ovr21 + Child6 + 
             GFinc + HH_Size + Score + Ten + Exp + Health + Region +
             URATE + SearchCT + Term + Union + OCC2 + IND2 + count + (1|ID), data=hispan, 
            family = binomial, control = glmerControl(optimizer="bobyqa"), nAGQ=0)

hispan.mod<-meout(mod4H, mod4HF, mod4HM, mod3H)
save.image(file="./Analysis/Output/LogitME.RData")

write.csv(main.mod, file="./Analysis/Output/logme_main.csv")
write.csv(black.mod, file="./Analysis/Output/logme_black.csv")
write.csv(white.mod, file="./Analysis/Output/logme_white.csv")
write.csv(hispan.mod, file="./Analysis/Output/logme_hispan.csv")
