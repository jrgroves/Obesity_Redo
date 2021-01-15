#Prepare the compiled gap data for analysis
#By Jeremy Groves
#January 10, 2021
#Translation and update from old STATA code (gaps2.do and gaps1.ado)

rm(list=ls())

library(tidyverse)


load("./Build/Output/coregap2.RData")

#Calculate and manage spell lengths
    core <- core.gap %>%
         subset(!is.na(start)) %>%
            arrange(ID,year,desc(job)) %>%
              group_by(ID) %>%
                mutate(count=row_number())
    
    core<-core %>%
          group_by(ID) %>%
              mutate(gap.end = lead(start, order_by=count))
    
    core$spell<-core$gap.end-core$end   
    
    core <- core %>%   #Removes negative spells caused by data entry error or overlapping jobs
        subset(spell>0)
    core$spell<-as.numeric(core$spell)
    
    core<-core %>%   #Remove spells over 365 days and mark those at 365 as right censored
      subset(spell<=365)
    core$ended<-ifelse(core$spell==365,0,1) #1 Indicates the end of spell was observed
    
    core<-core %>%   #Create the experience variable as the cumulative sum of tenures measured at spell end.
        group_by(ID) %>%
          mutate(EXPER=cumsum(tenure))

#Remove observations with missing data

core<-core %>%
        subset(occupation>0) %>%
          subset(type>0) %>%
            subset(reason>0) %>%
              subset(tenure>0) %>%
                subset(colbar>=0) 


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
  
  core$OCC<-ifelse(core$occupation>0 & core$occupation<196, "Prof_Tech",
                   ifelse(core$occupation>200 & core$occupation<246, "Manager",
                          ifelse(core$occupation>259 & core$occupation<286, "Sales",
                                 ifelse(core$occupation>300 & core$occupation<396, "Clerical",
                                        ifelse(core$occupation>400 & core$occupation<576, "Crafts",
                                               ifelse(core$occupation==580, "Armed",
                                                      ifelse(core$occupation>600 & core$occupation<716, "Operatives",
                                                      ifelse(core$occupation>739 & core$occupation<796, "Laborers",
                                                      ifelse(core$occupation==801 & core$occupation==802, "Farm Mang",
                                                      ifelse(core$occupation>820 & core$occupation<825, "Farm Labor",
                                                      ifelse(core$occupation>900 & core$occupation<966, "Service",
                                                      ifelse(core$occupation>979 & core$occupation<996, "Private","OTHER"))))))))))))
  
#Decode the Reason for Separation
  
  core$FORCED<-ifelse(core$reason==2 & core$year<1984 | core$reason==4 & core$year>1983, 1, 0)
  
  
  core$END<-ifelse(core$reason==3 & core$year<1984 | core$reason==5 & core$year>1983 |
                   core$reason==2 & core$year>1983, 1, 0) #Includes plant closing

  core$TEMP<-ifelse(core$reason==3 & core$year>1983, 1, 0)
  core$LAYOFF<-ifelse(core$reason==1,1,0)
  core$SEP_OTH<-ifelse(core$FORCED==0 & core$END==0 & core$TEMP==0 & core$LAYOFF==0,1,0)
  
  names(core)[which(names(core)=="tenure")]<-"TENURE"
  names(core)[which(names(core)=="spell")]<-"SPELL"


gap.core<-core %>%
      select(ID,SPELL,TENURE,IND,OCC,FORCED,END,TEMP,LAYOFF,SEP_OTH,rate,ended,year,EXPER)
save(gap.core, file="./Build/Output/gapcore2.RData")
  
  
