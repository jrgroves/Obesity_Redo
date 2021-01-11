#Prepare the compiled gap data for analysis
#By Jeremy Groves
#January 10, 2021
#Translation and update from old STATA code (gaps2.do and gaps1.ado)

rm(list=ls())

library(tidyverse)


load("./Build/Output/coregap.RData")

#Remove observations with missing data

core<-core.gap %>%
        subset(occ>0) %>%
          subset(type>0) %>%
            subset(reason>0) %>%
              subset(ten>0) %>%
                subset(union>=0) %>%
                  subset(rate>0)

core$gap<-as.numeric(core$gap) #Convert 'days' to numeric value

core<-core %>%
    subset(gap<=365)


#Create Occupation and Type Variables
  core$IND<-ifelse(core$type>0 & core$type<47, "AGRICULTURE",
                     ifelse(core$type>46 & core$type<67, "MINNING",
                            ifelse(core$type>66 & core$type<78, "CONSTRUCTION",
                                   ifelse(core$type>106 & core$type<399, "MANUFACTURING",
                                          ifelse(core$type>399 & core$type<480, "UTILITY",
                                                 ifelse(core$type>500 & core$type<699, "RETAIL",
                                                        ifelse(core$type>706 & core$type<719, "FINANCE",
                                                        ifelse(core$type>720 & core$type<799, "PERSONAL",
                                                        ifelse(core$type>806 & core$type<810,"ENTERTAINMENT",
                                                        ifelse(core$type>827 & core$type<898, "PROFESSIONAL",
                                                        ifelse(core$type>906 & core$type<938, "PUBLIC","OTHER")))))))))))
  
  core$OCC<-ifelse(core$occ>0 & core$occ<196, "Prof_Tech",
                   ifelse(core$occ>200 & core$occ<246, "Manager",
                          ifelse(core$occ>259 & core$occ<286, "Sales",
                                 ifelse(core$occ>300 & core$occ<396, "Clerical",
                                        ifelse(core$occ>400 & core$occ<576, "Crafts",
                                               ifelse(core$occ==580, "Armed",
                                                      ifelse(core$occ>600 & core$occ<716, "Operatives",
                                                      ifelse(core$occ>739 & core$occ<796, "Laborers",
                                                      ifelse(core$occ==801 & core$occ==802, "Farm Mang",
                                                      ifelse(core$occ>820 & core$occ<825, "Farm Labor",
                                                      ifelse(core$occ>900 & core$occ<966, "Service",
                                                      ifelse(core$occ>979 & core$occ<996, "Private","OTHER"))))))))))))
  
#Decode the Reason for Seperation
  
  core$FORCED<-ifelse(core$reason==2 & core$year<1984 | core$reason==4 & core$year>1983, 1, 0)
  
  
  core$END<-ifelse(core$reason==3 & core$year<1984 | core$reason==5 & core$year>1983 |
                   core$reason==2 & core$year>1983, 1, 0) #Includes plant closing

  core$TEMP<-ifelse(core$reason==3 & core$year>1983, 1, 0)
  core$LAYOFF<-ifelse(core$reason==1,1,0)
  core$SEP_OTH<-ifelse(core$FORCED==0 & core$END==0 & core$TEMP==0 & core$LAYOFF==0,1,0)
  
  
