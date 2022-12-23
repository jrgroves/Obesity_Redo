#Creates the Characteristic files for the NLSY97 dataset
#By Jeremy Groves
#December 23, 2022 [Reversion of the Main Characteristics and BMI 97.R file which was unclear]

rm(list=ls())

library(tidyverse)
#library(foreign)
#library(zoo)
library(measurements)

#Loading extra characteristics added later
source("./Build/Code/Weight.R")
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
names(core) <- gsub("YSAQ-000A~000002", "Feet", names(core))
names(core) <- gsub("YSAQ-000A000002", "Feet", names(core))
names(core) <- gsub("YSAQ-000A~000001", "Inches", names(core))
names(core) <- gsub("YSAQ-000A000001", "Inches", names(core))
names(core) <- gsub("YSAQ-374", "Plan", names(core))

fixed <- core %>%
  select(ID, Gender, Bday.M, Bday.Y, starts_with("P1"), starts_with("P2"), Race) %>%
  mutate(BD = paste(str_pad(Bday.M, 2, pad="0"), "01", Bday.Y, sep="-"),
         Bday = as.Date(BD, format = "%m-%d-%Y")) %>%
  select(-c("BD", "Bday.M", "Bday.Y"))

variable <- core %>%
  select(-Gender, -Bday.M, -Bday.Y, -starts_with("P1"), -starts_with("P2"), -Race) %>%
  pivot_longer(-ID, names_to = "Measure", values_to = "Value") %>%
  mutate(Year = str_split_fixed(Measure, "_", 2)[,2],
         Measure = str_split_fixed(Measure, "_", 2)[,1]) %>%
  pivot_wider(id_cols = c("ID", "Year"), names_from = "Measure", values_from = "Value") %>%
  mutate(Height = Feet*12 + Inches)





,
         Height = conv_unit(Height, "inch", "m"),
         Weight = conv_unit(Weight, "lbs", "kg"),
         BMI = Weight/((Height)^2),
         BMI_Level = case_when(
                          BMI< 18.5 ~ "Underweight",
                          BMI>= 18.5 & BMI < 25 ~ "Normal",
                          BMI>= 25 & BMI < 30 ~ "Overweight",
                          BMI >= 30 ~ "Obese"))



