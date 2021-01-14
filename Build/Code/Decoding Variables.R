#Constructs the main core data for the obesity paper
#By Jeremy Groves
#January 8, 2021
#Translation and update from old STATA code (construct.do)

rm(list=ls())

library(tidyverse)
library(measurements)

load("./Build/Output/corechar.RData")

#Generate and Decode Characteristics Data####

  #subset out for the time non-variable characteristics

    data<-core.char[,c("ID","race","sex","RACE2")]
      #Fix missing 
        data$RACE2<-ifelse(data$RACE2==1, 14,
                           ifelse(data$RACE2==2,1,0))
        
    data<-unique(data)
    
    #create Characteristics Dummies
      data$MALE<-ifelse(data$sex==1,1,0)
      data$FEMALE<-ifelse(data$sex!=1,1,0)
      data$HISPAN<-ifelse(data$race>14 & data$race<22,1,0) 
      data$BLACK<-ifelse(data$race==1,1,0)
      data$ASIAN<-ifelse(data$race==2 | data$race==4 | data$race==8 | 
                                data$race==13 | data$race==14 | data$race==26 |
                                data$race==10, 1, 0)
      data$NATAM<-ifelse(data$race==9,1,0)
      data$white<-ifelse(data$BLACK==0 & data$ASIAN==0 & data$HISPAN==0 & 
                           data$NATAM==0,1 ,0)

    #Remove excess
      data$cntry_birth<-NULL
      data$race<-NULL
      data$sex<-NULL
      data$RACE2<-NULL
  char.1<-data
  load("./Build/Output/test.RData")
  
  char.1<-merge(char.1,test,by="ID",all.x=TRUE)
  
    char.1$AFQT_1[which(char.1$AFQT_1<0)]<-NA
    char.1$AFQT_2[which(char.1$AFQT_2<0)]<-NA
    char.1$AFQT_3[which(char.1$AFQT_3<0)]<-NA
  
  rm(data,test)
  
#Create time varying variables####
    
    #Marriage
      core.char$marriage<-ifelse(core.char$martial==1,"MARRIED",
                                ifelse(core.char$martial==5, "MARRIED",
                                ifelse(core.char$martial==0, "NEV MARRIED",
                                ifelse(core.char$martial==2, "SEPERATED",
                                ifelse(core.char$martial==3, "DIVORCED",
                                ifelse(core.char$martial==6, "WIDOWED","Missing"))))))
      core.char$marriage[is.na(core.char$marriage)]<-"Missing"
      
    #Education
      core.char$enrollment<-ifelse(core.char$hgc_self>0 & core.char$hgc_self <9 ,"NO HS",
                              ifelse(core.char$hgc_self > 8 & core.char$hgc_self<12, "NO HS DIP",
                                ifelse(core.char$hgc_self==12, "HS DIP",
                                  ifelse(core.char$hgc_self > 12 & core.char$hgc_self < 16, "SOME COLLEGE",
                                    ifelse(core.char$hgc_self > 15, "COLLEGE PLUS", "NA")))))
    
    #Regional
      core.char$SMSA<-ifelse(core.char$smsa==0,"Not SMSA",
                             ifelse(core.char$smsa==1,"SMSA Not CC",
                                    ifelse(core.char$smsa==2, "SMSA CCNK",
                                           ifelse(core.char$smsa==3, "SMSA CC", "Missing"))))
      core.char$SMSA[is.na(core.char$SMSA)]<-"Missing"
      
      core.char$temp<-core.char$region
      core.char$region<-ifelse(core.char$temp==1,"NORTHEAST",
                               ifelse(core.char$temp==2, "NORTH CENT",
                                      ifelse(core.char$temp==3, "SOUTH",
                                             ifelse(core.char$temp==4, "WEST","Missing"))))
      core.char$region[is.na(core.char$temp)]<-NA
      core.char$temp<-NULL
      
		#Current Age
      core.char$AGE<-core.char$year-as.numeric(format(core.char$bday,'%Y')) #Current Age
      
   #Family and Income
      core.char$famsize[which(core.char$famsize<0)]<-NA
        names(core.char)[which(names(core.char)=="famsize")]<-"FAMSIZE"   
        
      core.char$CHILD7<-ifelse(core.char$youngest<8,1,0)
        core.char$CHILD7[is.na(core.char$youngest)]<-NA
      
      core.char$pinc[which(core.char$pinc<0)]<-NA
        names(core.char)[which(names(core.char)=="pinc")]<-"WAGE"
      
      core.char$fampov[which(core.char$fampov<0)]<-NA
        names(core.char)[which(names(core.char)=="fampov")]<-"FAMPOV"
      
      core.char$income[which(core.char$income<0)]<-NA
        names(core.char)[which(names(core.char)=="income")]<-"OTHINC"
        
    #Search Variables
        core.char$smeth1[which(core.char$smeth1<0)]<-NA
          core.char$SEARCH_ST<-ifelse(core.char$smeth1==2,1,0)
          core.char$SEARCH_ST[is.na(core.char$SEARCH_ST)]<-0
        core.char$smeth2[which(core.char$smeth2<0)]<-NA
          core.char$SEARCH_PRV<-ifelse(core.char$smeth2==3,1,0)
          core.char$SEARCH_PRV[is.na(core.char$SEARCH_PRV)]<-0
        core.char$smeth3[which(core.char$smeth3<0)]<-NA
          core.char$SEARCH_EMP<-ifelse(core.char$smeth3==4,1,0)
          core.char$SEARCH_EMP[is.na(core.char$SEARCH_EMP)]<-0
        core.char$smeth4[which(core.char$smeth4<0)]<-NA
          core.char$SEARCH_FRD<-ifelse(core.char$smeth4==5,1,0)
          core.char$SEARCH_FRD[is.na(core.char$SEARCH_FRD)]<-0
        core.char$smeth5[which(core.char$smeth5<0)]<-NA
          core.char$SEARCH_ADS<-ifelse(core.char$smeth5==6,1,0)
          core.char$SEARCH_ADS[is.na(core.char$SEARCH_ADS)]<-0
        core.char$smeth6[which(core.char$smeth6<0)]<-NA
          core.char$SEARCH_NEWS<-ifelse(core.char$smeth6==7,1,0)
          core.char$SEARCH_NEWS[is.na(core.char$SEARCH_NEWS)]<-0
        core.char$smeth7[which(core.char$smeth7<0)]<-NA
          core.char$SEARCH_SCHS<-ifelse(core.char$smeth7==8,1,0)
          core.char$SEARCH_SCHS[is.na(core.char$SEARCH_SCHS)]<-0
        core.char$smeth8[which(core.char$smeth8<0)]<-NA
          core.char$SEARCH_OTH<-ifelse(core.char$smeth8==9,1,0)
          core.char$SEARCH_OTH[is.na(core.char$SEARCH_OTH)]<-0
          
        core.char$searchft[which(core.char$searchft<0)]<-NA
          core.char$SEARCH_FT<-ifelse(core.char$searchft==1,1,0)
          core.char$SEARCH_PT<-ifelse(core.char$searchft==2,1,0)
        core.char$searchft<-NULL

    #Limitations Variables
        core.char$limkind[which(core.char$limkind<0)]<-NA
        core.char$limkind[which(core.char$limkind==2)]<-0
          names(core.char)[which(names(core.char)=="limkind")]<-"LIMKIND"   
        core.char$limamt[which(core.char$limamt<0)]<-NA
        core.char$limamt[which(core.char$limamt==2)]<-0
          names(core.char)[which(names(core.char)=="limamt")]<-"LIMAMT"  
        
    #Create subset with these variables
      
      char.2<-core.char[,c("ID","CHILD7","WAGE","OTHINC",
                           "enrollment","marriage","region","year",
                           "SEARCH_ST","SEARCH_PRV","SEARCH_EMP","SEARCH_FRD","SEARCH_ADS",
                           "SEARCH_NEWS","SEARCH_SCHS","SEARCH_OTH","AGE","LIMKIND","LIMAMT")]
      
#Create Height, Weight and BMI####
      temp<-core.char[,c("ID","weight","height","year")]
        #re-code the height which is sometimes in all inches and other in feet-inches
        temp$feet<-ifelse(temp$height>100,substr(temp$height,1,1),trunc(temp$height/12,0))
        temp$inch<-ifelse(temp$height>100,as.numeric(substr(temp$height,2,nchar(temp$height))),
                          temp$height-trunc(temp$height/12,0)*12)
        temp$height<-12*as.numeric(temp$feet)+as.numeric(temp$inch)
        temp$height[which(temp$height<0)]<-NA
            c<-temp %>%
              group_by(ID) %>%
              summarize(md=max(height,na.rm=TRUE))
            
            c$md[is.infinite(c$md)]<-NA
            c<-unique(c)
            names(c)<-c("ID","max_height")
        temp<-merge(temp,c,by="ID",all.x=TRUE)
          rm(c)
          
        #Interpolate the missing weights
          temp$weight[which(temp$weight<0)]<-NA
          
          a<-temp %>%
              group_by(ID) %>%
                  mutate(test=quantile(weight,.85,na.rm=TRUE))
          temp$weight[which(a$weight>a$test)]<-NA
           rm(a) 
            
          b<-temp %>%
            group_by(ID) %>% 
                summarise(weight2=round(mean(weight,na.rm=TRUE)))
          
          b<-b[!is.nan(b$weight2),]
          
          c<-temp %>%
              group_by(ID) %>%
                mutate(num=sum(!is.na(weight)))
          
            c<-c[,c("ID","num")]
            c<-unique(c)
            c<-c[which(c$num>2),]
          d<-merge(temp,c,by="ID",all.y=TRUE)
          
          e<-d %>%
              group_by(ID) %>%
                arrange(ID, year) %>%
                  mutate(time=seq(1,n())) %>%
                    mutate(weight3=round(approx(time,weight, n=n())$y),2) %>%
                      select(c(ID,weight3,year))
          
          f<-merge(b,e,by="ID",all=TRUE)
  

          temp<-merge(temp,f,by=c("ID","year"),all=TRUE)
            rm(a,b,c,d,e,f)
        
      #Convert to metrics for BMI calculations
          temp$weight<-conv_unit(temp$weight,"lbs","kg")
          temp$weight2<-conv_unit(temp$weight2,"lbs","kg")
          temp$weight3<-conv_unit(temp$weight3,"lbs","kg")
          temp$height<-conv_unit(temp$height,"inch","m")
          temp$max_height<-conv_unit(temp$max_height,"inch","m")
          
      #Calculate BMI
          temp$BMI_1<-temp$weight/((temp$max_height)^2)
          temp$BMI_2<-temp$weight2/((temp$max_height)^2)
          temp$BMI_3<-temp$weight3/((temp$max_height)^2)
      
      #subset Data
        char.3<-temp %>%
                  select(-c("feet","inch"))
        char.3<-char.3[!is.na(char.3$year),]
        char.3$BMI_Level1<-ifelse(char.3$BMI_1>29.9,"Obese",
                                  ifelse(char.3$BMI_1>24.9 & char.3$BMI_1<30, "Overweight",
                                         ifelse(char.3$BMI_1>18.49 & char.3$BMI_1<25, "Normal","Underweight")))
        char.3$BMI_Level2<-ifelse(char.3$BMI_2>29.9,"Obese",
                                  ifelse(char.3$BMI_2>24.9 & char.3$BMI_2<30, "Overweight",
                                         ifelse(char.3$BMI_2>18.49 & char.3$BMI_2<25, "Normal","Underweight")))
        char.3$BMI_Level3<-ifelse(char.3$BMI_3>29.9,"Obese",
                                  ifelse(char.3$BMI_3>24.9 & char.3$BMI_3<30, "Overweight",
                                         ifelse(char.3$BMI_3>18.49 & char.3$BMI_3<25, "Normal","Underweight")))
        rm(temp)

#Create final characteristic data for analysis ######
    core<-merge(char.2,char.3,by=c("ID","year"))
    core<-merge(char.1,core,by="ID",all.y=TRUE)
    
    core<-core %>%
      group_by(ID) %>%
        arrange(year, .by_group=TRUE)
  char.core<-core
  save(char.core,file="./Build/Output/core.RData")     
