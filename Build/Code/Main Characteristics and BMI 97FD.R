#Creates the Characteristic files for the NLSY97 data
#By Jeremy Groves
#December 23, 2022 [Reversion of the Main Characteristics and BMI 97.R file which was unclear, must use 
                   #Github reversion to pre-Dec29 for old code.]
#April 3, 2023: Removed 2011 data restriction and filled in missing values.


rm(list=ls())

library(tidyverse)
library(zoo) #Contains the Interpolation command
library(measurements)

#Loading extra characteristics added later
source("./Build/Code/NLSY Code/Weight.R")
rm(varlabels, qnames, vallabels, vallabels_continuous)

#Create Main Time Consistent Characteristics
core <- new_data %>%
  select(-starts_with("EMP"), -"YSAQ-373_1997", -"CV_SAMPLE_TYPE_1997") %>%
  rename(ID = PUBID_1997,
         Gender = KEY_SEX_1997,
         Bday.M = KEY_BDATE_M_1997,
         Bday.Y = KEY_BDATE_Y_1997,
         Race = KEY_RACE_ETHNICITY_1997,
         P1.Weight = "P4-018_1997",
         P2.Weight = "P4-025_1997",
         P1.Hght.F = "P4-016_1997",
         P1.Hght.I = "P4-017_1997",
         P2.Hght.F = "P4-023_1997",
         P2.Hght.I = "P4-024_1997")

names(core) <- gsub("YHEA-2200", "Weight", names(core))
names(core) <- gsub("YHEA-2300", "Weight", names(core))
names(core) <- gsub("YSAQ-000B", "Weight", names(core))
names(core) <- gsub("YHEA-SAQ-000B", "Weight", names(core))

names(core) <- gsub("YHEA-2100", "Inches", names(core))
names(core) <- gsub("YHEA-2000", "Feet", names(core))
names(core) <- gsub("YHEA-2050", "Feet", names(core))
names(core) <- gsub("YSAQ-000A~000002", "Inches", names(core))
names(core) <- gsub("YSAQ-000A000002", "Inches", names(core))
names(core) <- gsub("YSAQ-000A~000001", "Feet", names(core))
names(core) <- gsub("YSAQ-000A000001", "Feet", names(core))
names(core) <- gsub("YSAQ-374", "Plan", names(core))

fixed <- core %>%
  select(ID, Gender, Bday.M, Bday.Y, starts_with("P1"), starts_with("P2"), Race) %>%
  mutate(BD = paste(str_pad(Bday.M, 2, pad="0"), "01", Bday.Y, sep="-"),
         Bday = as.Date(BD, format = "%m-%d-%Y")) %>%
  select(-c("BD", "Bday.M")) %>%
  mutate(Gender = case_when(
    Gender==1 ~ "Male",
    Gender==2 ~ "Female"),
    Race = case_when(
      Race==1 ~ "Black",
      Race==2 ~ "Hispanic",
      Race==3 ~ "Mixed",
      Race==4 ~ "White"),
    P1.Height = (P1.Hght.F * 12) + P1.Hght.I,
    P1.Height = conv_unit(P1.Height, "inch", "m"),
    P1.Weight = conv_unit(P1.Weight, "lbs", "kg"),
    P1.BMI = P1.Weight/((P1.Height)^2),
    P2.Height = (P2.Hght.F * 12) + P2.Hght.I,
    P2.Height = conv_unit(P2.Height, "inch", "m"),
    P2.Weight = conv_unit(P2.Weight, "lbs", "kg"),
    P2.BMI = P2.Weight/((P2.Height)^2)) %>%
  select(-c(P1.Hght.F, P1.Hght.I, P1.Weight, P2.Hght.F, P2.Hght.I, P2.Weight))


variable <- core %>%
  select(-Gender, -Bday.M, -Bday.Y, -starts_with("P1"), -starts_with("P2"), -Race) %>%
  pivot_longer(-ID, names_to = "Measure", values_to = "Value") %>%
  mutate(Year = str_split_fixed(Measure, "_", 2)[,2],
         Measure = str_split_fixed(Measure, "_", 2)[,1]) %>%
  pivot_wider(id_cols = c("ID", "Year"), names_from = "Measure", values_from = "Value") %>%
  mutate(Height = (Feet*12) + Inches,
         Year = as.numeric(Year))


#Calculates missing weights and heights and BMI         
variable <- variable  %>%
  mutate(Year = as.numeric(Year)) %>%
  group_by(ID) %>%
  expand(Year=full_seq(Year,1)) %>%
  left_join(., variable, by=c("ID", "Year")) %>%
  fill(c("Feet", "Inches", "Plan", "Height")) %>%
  mutate(Weight = replace(Weight, Weight <= 30, NA),
         Weight = replace(Weight, Weight == 999, NA), #Removes weights less than 30 pounds which are clear errors and equal to 999
         count=sum(is.na(Weight)),
         zw = scale(Weight),
         Weight = replace(Weight, zw < -2.5, NA),
         Weight = replace(Weight, zw > 2.5, NA),
         zh = scale(Height),
         Height = replace(Height, zh < -2.5, NA),
         Height = replace(Height, zh > 2.5, NA)) %>%
  arrange(ID, Year) %>%
  mutate(Weight2 = na.approx(Weight, maxgap = 22, rule = 2),
         Height2 = na.approx(Height, maxgap = 22, rule = 2),
         Height.r = conv_unit(Height, "inch", "m"), #the .r suffix indicates raw data and not interpolated
         Weight.r = conv_unit(Weight, "lbs", "kg"),
         BMI.r = Weight.r/((Height.r)^2),
         BMI_Level.r = case_when(
           BMI.r< 18.5 ~ "Underweight",
           BMI.r>= 18.5 & BMI.r < 25 ~ "Normal",
           BMI.r>= 25 & BMI.r < 30 ~ "Overweight",
           BMI.r >= 30 ~ "Obese"),
         Height = conv_unit(Height2, "inch", "m"),
         Weight = conv_unit(Weight2, "lbs", "kg"),
         BMI = Weight/((Height)^2),
         BMI_Level = case_when(
           BMI< 18.5 ~ "Underweight",
           BMI>= 18.5 & BMI < 25 ~ "Normal",
           BMI>= 25 & BMI < 30 ~ "Overweight",
           BMI >= 30 ~ "Obese")) %>%
  select(-c(zw,zh,Feet,Inches, count))

core <- fixed %>%
  full_join(., variable, by="ID") %>%
  mutate(Age = as.numeric(Year) - Bday.Y) %>%
  select(-Bday.Y) %>%
  arrange(ID, Year) %>%
  group_by(ID) %>%
  mutate(BMI_Level_L = lag(BMI_Level),
         Year = as.numeric(Year))

    
#Save File
    save(core,file="./Build/Output/core97FD.RData")
      