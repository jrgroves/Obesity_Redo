library(ivtools)
library(survival)
library(tidyverse)




#Limit subsample for only those with a parent BMI response.
submain <- main %>%
  filter(!is.na(P1.BMI))

#Estimate with BMI levels for subsammple
mod1A<-coxph(Surv(length, event)~BMI_Level+Gender+Race+Marriage+Education+Ovr21+
               Age+Child6+GFinc+HH_Size+Score+Ten+Exp+Health+Region, data=submain)

mod1B<-coxph(Surv(length, event)~BMI_Level+Gender+Race+Marriage+Education+Ovr21+
               Age+Child6+GFinc+HH_Size+Score+Ten+Exp+Health+Region+Plan, data=submain)

#Estimate with BMI rather than Level
mod2A<-coxph(Surv(length, event)~BMI+Gender+Race+Marriage+Education+Ovr21+
               Age+Child6+GFinc+HH_Size+Score+Ten+Exp+Health+Region, data=submain)

mod2B<-coxph(Surv(length, event)~BMI+Gender+Race+Marriage+Education+Ovr21+
               Age+Child6+GFinc+HH_Size+Score+Ten+Exp+Health+Region+Plan, data=submain)

#First Stage
x<-lm(BMI ~ P1.BMI+Plan+Gender+Race+BMI_Level*Race+Marriage+Education+Ovr21+
            Age+Child6+GFinc+HH_Size+Score+Ten+Exp+Health+Region, data=submain)

#Predicted BMI and Levels
submain$f.BMI <- x$fitted.values

submain <- submain %>%
        mutate(BMI_Level2 = case_when(
              f.BMI< 18.5 ~ "Underweight",
              f.BMI>= 18.5 & f.BMI < 25 ~ "Normal",
              f.BMI>= 25 & f.BMI < 30 ~ "Overweight",
              f.BMI >= 30 ~ "Obese"),
              BMI_Level2 = factor(BMI_Level2, levels=c("Underweight", "Normal", "Overweight","Obese")),
              BMI_Level2 = relevel(BMI_Level2, ref="Normal"))


modA.2sls<-coxph(Surv(length, event)~BMI_Level2+Gender+Race+Marriage+Education+Ovr21+
             Age+Child6+GFinc+HH_Size+Score+Ten+Exp+Health+Region+Plan, data=submain)

modB.2sls<-coxph(Surv(length, event)~BMI_Level2+Gender+Race+Marriage+Education+Ovr21+
             Age+Child6+GFinc+HH_Size+Score+Ten+Exp+Health+Region, data=submain)

