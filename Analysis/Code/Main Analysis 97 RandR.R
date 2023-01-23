#This is a supplement to the Main Analysis 97.R
#We address questions raised by the reviewer in R and R

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


rm(core, core.cont, core.s, gaps)



#Function to output results from both coxph and coxme

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

#Limit sample to only those over the age of 21 at the start of the spell

submain<-main 

mod1<-coxph(Surv(length, event)~BMI_Level, data=submain)
mod1L<-coxph(Surv(length, event)~BMI_Level_L, data=subset(submain, !is.na(BMI_Level_L)))

mod1.fr<-coxme(Surv(length, event)~BMI_Level+(1|ID), data=submain)
mod1L.fr<-coxme(Surv(length, event)~BMI_Level_L+(1|ID), data=subset(submain, !is.na(BMI_Level_L)))

#Addition of individual specific elements

mod2<-coxph(Surv(length, event)~BMI_Level+Race+Marriage+Education+Ovr21+
              Age+Child6+GFinc+HH_Size+Score+Ten+Exp+Health+Region,
            data=submain)

mod2.fr<-coxme(Surv(length, event)~BMI_Level+Race+Marriage+Education+Ovr21+
                 Age+Child6+GFinc+HH_Size+Score+Ten+Exp+Health+Region+(1|ID),
               data=submain)
mod2.fr.int<-coxme(Surv(length, event)~BMI_Level+Race+BMI_Level*Race+Marriage+Education+Ovr21+
                     Age+Child6+GFinc+HH_Size+Score+Ten+Exp+Health+Region+(1|ID),
                   data=submain)

#Addition of Industry, Occupation, and Economy


mod3<-coxph(Surv(length, event)~BMI_Level+Race+Marriage+Education+Ovr21+
              Age+Child6+GFinc+HH_Size+Score+Ten+Exp+Health+Region+
              URATE+SearchCT+Term,
            data=submain)

mod3.fr<-coxme(Surv(length, event)~BMI_Level+Race+Marriage+Education+Ovr21+
                 Age+Child6+GFinc+HH_Size+Score+Ten+Exp+Health+Region+
                 URATE+SearchCT+Term+(1|ID),
               data=submain)

mod3.fr.int<-coxme(Surv(length, event)~BMI_Level+Race+BMI_Level*Race+Marriage+Education+Ovr21+
                     Age+Child6+GFinc+HH_Size+Score+Ten+Exp+Health+Region+
                     URATE+SearchCT+Term+(1|ID),
                   data=submain)

mod4<-coxph(Surv(length, event)~BMI_Level+Race+Marriage+Education+Ovr21+
              Age+Child6+GFinc+HH_Size+Score+Ten+Exp+Health+Region+
              URATE+SearchCT+Term+Union+OCC2+IND2,
            data=submain)

mod4.fr<-coxme(Surv(length, event)~BMI_Level+Race+Marriage+Education+Ovr21+
                 Age+Child6+GFinc+HH_Size+Score+Ten+Exp+Health+Region+
                 URATE+SearchCT+Term+Union+OCC2+IND2+(1|ID), 
               data=submain)

mod4.fr.int<-coxme(Surv(length, event)~BMI_Level+Race+BMI_Level*Race+Marriage+Education+Ovr21+
                     Age+Child6+GFinc+HH_Size+Score+Ten+Exp+Health+Region+
                     URATE+SearchCT+Term+Union+OCC2+IND2+(1|ID), data=submain)

base <- save(mod4.fr.int, mod4.fr, mod3.fr.int, mod3.fr, mod4, mod3, file="./Analysis/Output/Base.RData")
out1<-summe(mod4.fr.int, mod4.fr, mod3.fr.int, mod3.fr)


black<-main %>%
  subset(Race == "Black") %>%
  mutate(OCC2 = droplevels(OCC2),
         IND2 = droplevels(IND2))
  

mod3<-coxph(Surv(length, event)~BMI_Level+Marriage+Education+
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
                  URATE+SearchCT+Term+Union+OCC2+IND2+(1|ID)+(1|Ovr21), 
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
                  Age+Ovr21+Child6+GFinc+HH_Size+Score+Ten+Exp+Health+Region+
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

outHM<-summe(mod4.fr, mod4, mod3.fr, mod3)


write.csv(out1, file="./Analysis/Output/base.txt")
write.csv(outB, file="./Analysis/Output/outB.txt")
write.csv(outBF, file="./Analysis/Output/outBF.txt")
write.csv(outBM, file="./Analysis/Output/outBM.txt")
write.csv(outW, file="./Analysis/Output/outW.txt")
write.csv(outWF, file="./Analysis/Output/outWF.txt")
write.csv(outWM, file="./Analysis/Output/outWM.txt")
write.csv(outH, file="./Analysis/Output/outH.txt")
write.csv(outHF, file="./Analysis/Output/outHF.txt")
write.csv(outHM, file="./Analysis/Output/outHM.txt")

submain<-main %>%
  subset(length > 26)
