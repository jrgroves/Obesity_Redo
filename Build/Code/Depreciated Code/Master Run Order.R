# # This file outlines the order the R Scripts should be run for the Obesity Paper,
# #using the 97 NLSY Cohort data
# Jeremy R. Groves
# February 5, 2021

source("./Build/Code/IND_OCC_UID_Link97.R")
source("./Build/Code/Control Vars 97.R")
source("./Build/Code/Main Characteristics and BMI 97.R")
source("./Build/Code/Control Vars 97.R")
source("./Build/Code/Gaps97.R")

rm(list=ls())

# Main analysis is then run with the code in the analysis folder
