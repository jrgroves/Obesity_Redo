#Constructs the main core data for the obesity paper
#By Jeremy Groves
#January 8, 2021
#Translation and update from old STATA code (construct.do)

rm(list=ls())

library(tidyverse)

load("./Build/Output/corechar.RData")

#Generate and Decode Characteristics Data

  #subset out for the time non-variable charcteristics

    data<-core.char[,c("ID","cntry_birth","hgc_mother","hgc_father","race","sex")]
      #Remove missing vlaues
      data<-data[which(data$sex>0),]
      data<-data[which(data$race>0),]
      data<-data[which(data$cntry_birth>0),]
    data<-unique(data)
    
    #create Characteristics Dummies
      data$male<-ifelse(data$sex==1,1,0)
      data$hispan<-ifelse(data$race>14 & data$race<22,1,0) 
      data$black<-ifelse(data$race==1,1,0)
      data$asian<-ifelse(data$race==2 | data$race==4 | data$race==8 | 
                                data$race==13 | data$race==14 | data$race==26 |
                                data$race==10, 1, 0)
      data$white<-ifelse(data$black==0 & data$asian==0 & data$hispan==0 ,1 ,0)
      data$bornus<-ifelse(data$cntry_birth==1,1,0)
      data$hgc_father[which(data$hgc_father<0)]<-NA
      data$hgc_mother[which(data$hgc_mother<0)]<-NA
    #Remove excess
      data$cntry_birth<-NULL
      data$race<-NULL
      data$sex<-NULL
  char.1<-data
  load("./Build/Output/test.RData")
  
  char.1<-merge(char.1,test,by="ID",all.x=TRUE)
  
  rm(data,test)
  
  #Create time varying variables
    
    #Marrage
      core.char$marrage<-ifelse(core.char$martial==1,"Married",
                                ifelse(core.char$martial==5, "Married",
                                ifelse(core.char$martial==0, "Nev Married",
                                ifelse(core.char$martial==2, "Seperated",
                                ifelse(core.char$martial==3, "Divorced",
                                ifelse(core.char$martial==6, "Widowed","Missing"))))))
      core.char$marrage[is.na(core.char$marrage)]<-"Missing"
      
    #Enrollmnet
      core.char$enrollment<-ifelse(core.char$enroll==1,"Not Enrolled",
                              ifelse(core.char$enroll==2, "HS Enrolled",
                                ifelse(core.char$enroll==3, "Col Enrolled",
                                  ifelse(core.char$enroll==4, "Graduated","Missing"))))
      core.char$enrollment[is.na(core.char$enrollment)]<-"Missing"
    
    #Regional
      core.char$SMSA<-ifelse(core.char$smsa==0,"Not SMSA",
                             ifelse(core.char$smsa==1,"SMSA Not CC",
                                    ifelse(core.char$smsa==2, "SMSA CCNK",
                                           ifelse(core.char$smsa==3, "SMSA CC", "Missing"))))
      core.char$SMSA[is.na(core.char$SMSA)]<-"Missing"

		#Current Age
      core.char$age<-core.char$year-as.numeric(format(core.char$bday,'%Y')) #Current Age
      
      
      

	/// Generate Height and Weight Data

	drop if weight_`x'==.a  /*Removing missing data*/
        if `x'==1981{ 
			tostring height_1981,replace
			gen feet=substr(height_1981,1,1)
			gen inch=substr(height_1981,2,2)
			replace feet="0" if feet=="-"
			destring feet,replace
			destring inch,replace
			drop height_1981
			gen height_1981=(feet*12)+inch
		}
		if height_`x'==.{
		  drop height_`x'
			joinby id using height.dta,unm(m)
			drop _merge
			ren height_1985 height_`x'
		}
      
      /// Marital, Family and Resident Status
      
      gen married=1 if marit_status_1_`x'==2
		replace married=0 if married==.
	gen marr_oth=1 if marit_status_1_`x'==3	
      replace marr_oth=0 if marr_oth==.
      drop if marit_status_1_`x'==-1 | marit_status_1_`x'==-2 | marit_status_1_`x'==-3
      drop if  fam_size_`x'==-1 |  fam_size_`x'==-2 |  fam_size_`x'==-3
      drop if  curr_region_`x'==-1 |  curr_region_`x'==-2 |  curr_region_`x'==-3 |  curr_region_`x'==-5
	ta curr_region_`x',gen(region_`x')
	replace born_us=0 if born_us==2
		drop if born_us==-3
		lab var born_us "Born in the U.S."
		lab var married "Married as of `x'"
		lab var marr_oth "Seperated, Divorsed or Widowed as of `x'"
	
	/// Income and Poverty