#Creates the Characteristic files for the NLSY dataset from 1980 to 2004
#By Jeremy Groves
#January 6, 2021
#Translation and update from old STATA code (charct.do)

rm(list=ls())

library(tidyverse)
library(foreign)

#Loading extra characteristics added later
seek<-read.csv("./Build/Input/seeking.csv", as.is=TRUE, header=TRUE)
  names(seek)<-gsub("R","r",names(seek))
corr<-read.csv("./Build/Input/correction.csv", as.is=TRUE, header=TRUE)
  names(corr)<-gsub("R","r",names(corr))
seek<-merge(seek,corr,by="r0000100",all=TRUE)

#Create the characteristic files for each year of the data


#1980 Characteristics Data####
data<-read.dta("./Build/Input/nls1980.dta")
  data<-merge(data,seek,by="r0000100")
  names(data)<-gsub(".y","",names(data))
  
elements<-c("r0000100","r0000300","r0000500","r0000700","r0006500","r0007900","r0009600","r0214800","r0220200",
            "r0407602","r0406501","r0406401","r0389900","r0393520","r0393510","r0405601","r0389000","r0326800",
            "r0405700","r0406010",
            "r0312300","r0298900","r0299000","r0269800","r0268300","r0268400","r0268500",
            "r0268600","r0268700","r0268800","r0268900","r0269000")

vnam<-c("ID","bmon","byear","cntry_birth","hgc_mother","hgc_father","race","sex","age",
        "youngest","enroll","hgc_self","degree","smsa","urban","martial","children","num_dep",
        "region","income",
        "pinc","limkind","limamt","searchft","smeth1","smeth2","smeth3","smeth4",
        "smeth5","smeth6","smeth7","smeth8")

data<-data %>%
        select(elements) %>%
          rename_with(~vnam)
  
  #Fill in missing variables
      data$height<-NA
      data$weight<-NA
      
  #Create year and birthday
      data$year<-1980
      data$byear<-data$byear+1900
      data$bday<-as.Date(paste(data$bmon,"01",data$byear,sep="/"), "%m/%d/%Y") #We need a day so everyone born on first of month
        
  #Join to core data and save
      core.char<-data
      save(data, file="./Build/Input/char1980.RData")

#1981 Characteristic Data####

data<-read.dta("./Build/Input/nls1981.dta")
      data<-merge(data,seek,by="r0000100")
      names(data)<-gsub(".y","",names(data))

elements<-c("r0000100","r0000300","r0000500","r0000700","r0006500","r0007900","r0009600","r0214800","r0619010",
            "r0647102","r0619001","r0618901","r0533900","r0647000","r0646900","r0618601","r0533700","r0497300",
            "r0602810","r0618410",
            "r0481600","r0481700",
            "r0618200","r0618300","r0618301",
            "r0482600","r0478200","r0478300","r0451200","r0449700","r0449800","r0449900","r0450000","r0450100",
            "r0450200","r0450300","r0450400")

vnam<-c("ID","bmon","byear","cntry_birth","hgc_mother","hgc_father","race","sex","age",
        "youngest","enroll","hgc_self","degree","smsa","urban","martial","children","num_dep",
        "region","income",
        "height","weight",
        "AFQT_1","AFQT_2","AFQT_3",
        "pinc","limkind","limamt","searchft","smeth1","smeth2","smeth3","smeth4",
        "smeth5","smeth6","smeth7","smeth8")

data<-data %>%
  select(elements) %>%
  rename_with(~vnam)

  #Pull out armed forces test results and save
    test<-data[,c("ID","AFQT_1","AFQT_2","AFQT_3")]
    save(test,file="./Build/Output/test.RData")
    
  #Remove armed forces test data and add in missing
    data$AFQT_1<-NULL
    data$AFQT_2<-NULL
    data$AFQT_3<-NULL


    #Create year and birthday
    data$year<-1981
    data$byear<-data$byear+1900
    data$bday<-as.Date(paste(data$bmon,"01",data$byear,sep="/"), "%m/%d/%Y") #We need a day so everyone born on first of month
    
    #Join to core data and save

      core.char<-rbind(core.char,data)
      save(data, file="./Build/Input/char1981.RData")

#1982 Characteristic Data####
data<-read.dta("./Build/Input/nls1982.dta")
      data<-merge(data,seek,by="r0000100")
      names(data)<-gsub(".y","",names(data))
      
elements<-c("r0000100","r0000300","r0000500","r0000700","r0006500","r0007900","r0009600","r0214800","r0898310",
            "r0898839","r0898301","r0898201","r0813500","r0897900","r0897800","r0898401","r0898837","r0797400",
            "r0897910","r0898600",
            "r0779800","r0779900",
            "r0782101","r0776400","r0776500","r0698000","r0696500","r0696600","r0696700","r0696800",
            "r0696900","r0697000","r0697100","r0697200")

vnam<-c("ID","bmon","byear","cntry_birth","hgc_mother","hgc_father","race","sex","age",
        "youngest","enroll","hgc_self","degree","smsa","urban","martial","children","num_dep",
        "region","income",
        "height","weight",
        "pinc","limkind","limamt","searchft","smeth1","smeth2","smeth3","smeth4",
        "smeth5","smeth6","smeth7","smeth8")

data<-data %>%
  select(elements) %>%
  rename_with(~vnam)

  #Add in missing

  #Create year and birthday
    data$year<-1982
    data$byear<-data$byear+1900
    data$bday<-as.Date(paste(data$bmon,"01",data$byear,sep="/"), "%m/%d/%Y") #We need a day so everyone born on first of month
    
  #Join to core data and save
    core.char<-rbind(core.char,data)
    save(data, file="./Build/Input/char1982.RData")

#1983 Characteristic Data####
data<-read.dta("./Build/Input/nls1983.dta")
    data<-merge(data,seek,by="r0000100")
    names(data)<-gsub(".y","",names(data))
    
elements<-c("r0000100","r0000300","r0000500","r0000700","r0006500","r0007900","r0009600","r0214800","r1145110",
            "r1146831","r1145101","r1145001","r1048700","r1146400","r1146500","r1144901","r1146829","r1039300",
            "r1144800","r1144500",
            "r1024001","r1021100","r1021200","r0940900","r0939500","r0939600","r0939700","r0939800",
            "r0939900","r0940000","r0940100","r0940200")

vnam<-c("ID","bmon","byear","cntry_birth","hgc_mother","hgc_father","race","sex","age",
        "youngest","enroll","hgc_self","degree","smsa","urban","martial","children","num_dep",
        "region","income",
        "pinc","limkind","limamt","searchft","smeth1","smeth2","smeth3","smeth4",
        "smeth5","smeth6","smeth7","smeth8")

data<-data %>%
  select(elements) %>%
  rename_with(~vnam)

  #Add in missing
    data$height<-NA
    data$weight<-NA

  #Create year and birthday
    data$year<-1983
    data$byear<-data$byear+1900
    data$bday<-as.Date(paste(data$bmon,"01",data$byear,sep="/"), "%m/%d/%Y") #We need a day so everyone born on first of month
    
  #Join to core data and save
    core.char<-rbind(core.char,data)
    save(data, file="./Build/Input/char1983.RData")

#1984 Characteristic Data####

data<-read.dta("./Build/Input/nls1984.dta")
    data<-merge(data,seek,by="r0000100")
    names(data)<-gsub(".y","",names(data))
    
elements<-c("r0000100","r0000300","r0000500","r0000700","r0006500","r0007900","r0009600","r0214800","r1520310",
            "r1522038","r1520301","r1520201","r1432000","r1521700","r1521600","r1520101","r1522036","r1426000",
            "r1520000","r1519700",
            "r1410701","r1390400","r1390500","r1251300","r1249800","r1249900","r1250000","r1250100",
            "r1250200","r1250300","r1250400","r1250500")

vnam<-c("ID","bmon","byear","cntry_birth","hgc_mother","hgc_father","race","sex","age",
        "youngest","enroll","hgc_self","degree","smsa","urban","martial","children","num_dep",
        "region","income",
        "pinc","limkind","limamt","searchft","smeth1","smeth2","smeth3","smeth4",
        "smeth5","smeth6","smeth7","smeth8")
data<-data %>%
  select(elements) %>%
  rename_with(~vnam)

  #Add in missing
  data$height<-NA
  data$weight<-NA
  
  #Create year and birthday
  data$year<-1984
  data$byear<-data$byear+1900
  data$bday<-as.Date(paste(data$bmon,"01",data$byear,sep="/"), "%m/%d/%Y") #We need a day so everyone born on first of month
  
  #Join to core data and save
  core.char<-rbind(core.char,data)
  save(data, file="./Build/Input/char1984.RData")

#1985 Characteristic Data####
data<-read.dta("./Build/Input/nls1985.dta")
  data<-merge(data,seek,by="r0000100")
  names(data)<-gsub(".y","",names(data))
  
elements<-c("r0000100","r0000300","r0000500","r0000700","r0006500","r0007900","r0009600","r0214800","r1891010",
            "r1892738","r1891001","r1890901","r1865400","r1892400","r1892300","r1890801","r1892736","r1790700",
            "r1890700","r1890400",
            "r1773900","r1774000",
            "r1778501","r1773300","r1773400","r1646500","r1645000","r1645100","r1645200","r1645300",
            "r1645400","r1645500","r1645600","r1645700")

vnam<-c("ID","bmon","byear","cntry_birth","hgc_mother","hgc_father","race","sex","age",
        "youngest","enroll","hgc_self","degree","smsa","urban","martial","children","num_dep",
        "region","income",
        "height","weight",
        "pinc","limkind","limamt","searchft","smeth1","smeth2","smeth3","smeth4",
        "smeth5","smeth6","smeth7","smeth8")

data<-data %>%
  select(elements) %>%
  rename_with(~vnam)

  #Add in missing

  #Create year and birthday
  data$year<-1985
  data$byear<-data$byear+1900
  data$bday<-as.Date(paste(data$bmon,"01",data$byear,sep="/"), "%m/%d/%Y") #We need a day so everyone born on first of month
  
  #Join to core data and save
  core.char<-rbind(core.char,data)
  save(data, file="./Build/Input/char1985.RData")

#1986 CHaracteristic Data####
data<-read.dta("./Build/Input/nls1986.dta")
  data<-merge(data,seek,by="r0000100")
  names(data)<-gsub(".y","",names(data))
  
elements<-c("r0000100","r0000300","r0000500","r0000700","r0006500","r0007900","r0009600","r0214800","r2258110",
            "r2259838","r2258101","r2258001","r2231500","r2259500","r2259400","r2257901","r2259836","r2153800",
            "r2257800","r2257500",
            "r2141300",
            "r2141601","r2140800","r2140900","r1919100","r1917600","r1917700","r1917800","r1917900",
            "r1918000","r1918100","r1918200","r1918300")

vnam<-c("ID","bmon","byear","cntry_birth","hgc_mother","hgc_father","race","sex","age",
        "youngest","enroll","hgc_self","degree","smsa","urban","martial","children","num_dep",
        "region","income",
        "weight",
        "pinc","limkind","limamt","searchft","smeth1","smeth2","smeth3","smeth4",
        "smeth5","smeth6","smeth7","smeth8")

data<-data %>%
  select(elements) %>%
  rename_with(~vnam)

  #Add in missing
  data$height<-NA
  
  #Create year and birthday
  data$year<-1986
  data$byear<-data$byear+1900
  data$bday<-as.Date(paste(data$bmon,"01",data$byear,sep="/"), "%m/%d/%Y") #We need a day so everyone born on first of month
  
  #Join to core data and save
  core.char<-rbind(core.char,data)
  save(data, file="./Build/Input/char1986.RData")

#1987 Characteristic Data####
data<-read.dta("./Build/Input/nls1987.dta")
  data<-merge(data,seek,by="r0000100")
  names(data)<-gsub(".y","",names(data))
  
elements<-c("r0000100","r0000300","r0000500","r0000700","r0006500","r0007900","r0009600","r0214800","r2445510",
            "r2448038","r2445501","r2445401","r2427300","r2447000","r2446900","r2445301","r2448036","r2362400",
            "r2445200","r2444700",
            "r2350301","r2348600","r2348700","r2315200","r2313700","r2313800","r2313900","r2314000",
            "r2314100","r2314200","r2314300","r2314400")

vnam<-c("ID","bmon","byear","cntry_birth","hgc_mother","hgc_father","race","sex","age",
        "youngest","enroll","hgc_self","degree","smsa","urban","martial","children","num_dep",
        "region","income",
        "pinc","limkind","limamt","searchft","smeth1","smeth2","smeth3","smeth4",
        "smeth5","smeth6","smeth7","smeth8")
data<-data %>%
  select(elements) %>%
  rename_with(~vnam)

  #Add in missing
  data$height<-NA
  data$weight<-NA
  
  #Create year and birthday
  data$year<-1987
  data$byear<-data$byear+1900
  data$bday<-as.Date(paste(data$bmon,"01",data$byear,sep="/"), "%m/%d/%Y") #We need a day so everyone born on first of month
  
  #Join to core data and save
  core.char<-rbind(core.char,data)
  save(data, file="./Build/Input/char1987.RData")

#1988 Characteristic Data####
data<-read.dta("./Build/Input/nls1988.dta")
  data<-merge(data,seek,by="r0000100")
  names(data)<-gsub(".y","",names(data))
  
elements<-c("r0000100","r0000300","r0000500","r0000700","r0006500","r0007900","r0009600","r0214800","r2871300",
            "r2877700","r2871201","r2871101","r2747300","r2872800","r2872700","r2871000","r2877500","r2735100",
            "r2870800","r2870200",
            "r2711500",
            "r2722501","r2711000","r2711100","r2523100","r2521600","r2521700","r2521800","r2521900",
            "r2522000","r2522100","r2522200","r2522300")

vnam<-c("ID","bmon","byear","cntry_birth","hgc_mother","hgc_father","race","sex","age",
        "youngest","enroll","hgc_self","degree","smsa","urban","martial","children","num_dep",
        "region","income",
        "weight",
        "pinc","limkind","limamt","searchft","smeth1","smeth2","smeth3","smeth4",
        "smeth5","smeth6","smeth7","smeth8")

data<-data %>%
  select(elements) %>%
  rename_with(~vnam)

  #Add in missing
  data$height<-NA
  
  #Create year and birthday
  data$year<-1988
  data$byear<-data$byear+1900
  data$bday<-as.Date(paste(data$bmon,"01",data$byear,sep="/"), "%m/%d/%Y") #We need a day so everyone born on first of month
  
  #Join to core data and save
  core.char<-rbind(core.char,data)
  save(data, file="./Build/Input/char1988.RData")
  
#1989 Characteristic Data####

data<-read.dta("./Build/Input/nls1989.dta")
  data<-merge(data,seek,by="r0000100")
  names(data)<-gsub(".y","",names(data))
  
elements<-c("r0000100","r0000300","r0000500","r0000700","r0006500","r0007900","r0009600","r0214800","r3075000",
            "r3074901","r3074801","r2990100","r3076500","r3076400","r3074700","r3076841","r3074500","r3074000",
            "r2959600",
            "r2971401","r2959100","r2959200","r2922000","r2920500","r2920600","r2920700","r2920800",
            "r2920900","r2921000","r2921100","r2921200")

vnam<-c("ID","bmon","byear","cntry_birth","hgc_mother","hgc_father","race","sex","age",
        "enroll","hgc_self","degree","smsa","urban","martial","children","region","income",
        "weight",
        "pinc","limkind","limamt","searchft","smeth1","smeth2","smeth3","smeth4",
        "smeth5","smeth6","smeth7","smeth8")
data<-data %>%
  select(elements) %>%
  rename_with(~vnam)

  #Add in missing
  data$youngest<-NA
  data$num_dep<-NA
  data$height<-NA
  
  #Create year and birthday
  data$year<-1989
  data$byear<-data$byear+1900
  data$bday<-as.Date(paste(data$bmon,"01",data$byear,sep="/"), "%m/%d/%Y") #We need a day so everyone born on first of month
  
  #Join to core data and save
  core.char<-rbind(core.char,data)
  save(data, file="./Build/Input/char1989.RData")
  
#1990 Characteristic Data####

data<-read.dta("./Build/Input/nls1990.dta")
  data<-merge(data,seek,by="r0000100")
  names(data)<-gsub(".y","",names(data))
  
elements<-c("r0000100","r0000300","r0000500","r0000700","r0006500","r0007900","r0009600","r0214800","r3401700",
            "r3407800","r3401601","r3401501","r3306400","r3403200","r3403100","r3401400","r3407600","r3401200","r3400700",
            "r3271000",
            "r3279401","r3270500","r3270600","r3124700","r3123200","r3123300","r3123400","r3123500",
            "r3123600","r3123700","r3123800","r3123900")

vnam<-c("ID","bmon","byear","cntry_birth","hgc_mother","hgc_father","race","sex","age",
        "youngest","enroll","hgc_self","degree","smsa","urban","martial","children","region","income",
        "weight",
        "pinc","limkind","limamt","searchft","smeth1","smeth2","smeth3","smeth4",
        "smeth5","smeth6","smeth7","smeth8")

data<-data %>%
  select(elements) %>%
  rename_with(~vnam)

  #Add in missing
  data$num_dep<-NA
  data$height<-NA
  
  #Create year and birthday
  data$year<-1990
  data$byear<-data$byear+1900
  data$bday<-as.Date(paste(data$bmon,"01",data$byear,sep="/"), "%m/%d/%Y") #We need a day so everyone born on first of month
  
  #Join to core data and save
  core.char<-rbind(core.char,data)
  save(data, file="./Build/Input/char1990.RData")

  
#1991 Characteristics Data####
  
data<-read.dta("./Build/Input/nls1991.dta")
  data<-merge(data,seek,by="r0000100")
  names(data)<-gsub(".y","",names(data))
  
elements<-c("r0000100","r0000300","r0000500","r0000700","r0006500","r0007900","r0009600","r0214800","r3657100",
            "r3657001","r3656901","r3577400","r3658600","r3658500","r3656800","r3659046","r3656600","r3656100",
            "r3559001","r3558000","r3558100","r3520400","r3518900","r3519000","r3519100","r3519200",
            "r3519300","r3519400","r3519500","r3519600")

vnam<-c("ID","bmon","byear","cntry_birth","hgc_mother","hgc_father","race","sex","age",
        "enroll","hgc_self","degree","smsa","urban","martial","children","region","income",
        "pinc","limkind","limamt","searchft","smeth1","smeth2","smeth3","smeth4",
        "smeth5","smeth6","smeth7","smeth8")
data<-data %>%
  select(elements) %>%
  rename_with(~vnam)

  #Add in missing
  data$youngest<-NA
  data$num_dep<-NA
  data$height<-NA
  data$weight<-NA
  
  #Create year and birthday
  data$year<-1991
  data$byear<-data$byear+1900
  data$bday<-as.Date(paste(data$bmon,"01",data$byear,sep="/"), "%m/%d/%Y") #We need a day so everyone born on first of month
  
  #Join to core data and save
  core.char<-rbind(core.char,data)
  save(data, file="./Build/Input/char1991.RData")
  
#1992 Characteristics Data####

data<-read.dta("./Build/Input/nls1992.dta")
  data<-merge(data,seek,by="r0000100")
  names(data)<-gsub(".y","",names(data))
  
elements<-c("r0000100","r0000300","r0000500","r0000700","r0006500","r0007900","r0009600","r0214800","r4007600",
            "r4009448","r4007501","r4007401","r3921500","r4009100","r4009000","r4007300","r4009446","r4007100","r4006600",
            "r3886400",
            "r3897101","r3885600","r3885700","r3725300","r3723800","r3723900","r3724000","r3724100",
            "r3724200","r3724300","r3724400","r3724500")

vnam<-c("ID","bmon","byear","cntry_birth","hgc_mother","hgc_father","race","sex","age",
        "youngest","enroll","hgc_self","degree","smsa","urban","martial","children","region","income",
        "weight",
        "pinc","limkind","limamt","searchft","smeth1","smeth2","smeth3","smeth4",
        "smeth5","smeth6","smeth7","smeth8")

data<-data %>%
  select(elements) %>%
  rename_with(~vnam)

    #Add in missing
    data$num_dep<-NA
    data$height<-NA
    
    #Create year and birthday
    data$year<-1992
    data$byear<-data$byear+1900
    data$bday<-as.Date(paste(data$bmon,"01",data$byear,sep="/"), "%m/%d/%Y") #We need a day so everyone born on first of month
    
    #Join to core data and save
    core.char<-rbind(core.char,data)
    save(data, file="./Build/Input/char1992.RData")

#1993 Characteristic Data####
data<-read.dta("./Build/Input/nls1993.dta")
    data<-merge(data,seek,by="r0000100")
    names(data)<-gsub(".y","",names(data))
    
elements<-c("r0000100","r0000300","r0000500","r0000700","r0006500","r0007900","r0009600","r0214800","r4418700",
            "r4444800","r4418601","r4418501","r4400200","r4420200","r4420100","r4418400","r4400500","r4418200","r4417700",
            "r4284800",
            "r4295101","r4284000","r4284100","r4177100","r4175201","r4175202","r4175203","r4175204",
            "r4175205","r4175206","r4175207","r4175208")
    
vnam<-c("ID","bmon","byear","cntry_birth","hgc_mother","hgc_father","race","sex","age",
       "youngest","enroll","hgc_self","degree","smsa","urban","martial","children","region","income",
       "weight",
       "pinc","limkind","limamt","searchft","smeth1","smeth2","smeth3","smeth4",
       "smeth5","smeth6","smeth7","smeth8")

data<-data %>%
  select(elements) %>%
  rename_with(~vnam)

  #Add in missing
  data$num_dep<-NA
  data$height<-NA

  #Create year and birthday
  data$year<-1993
  data$byear<-data$byear+1900
  data$bday<-as.Date(paste(data$bmon,"01",data$byear,sep="/"), "%m/%d/%Y") #We need a day so everyone born on first of month
  
  #Join to core data and save
  core.char<-rbind(core.char,data)
  save(data, file="./Build/Input/char1993.RData")
  
#Merge the Test Data back into sample
  core.char<-merge(core.char,test,by="ID",all.x=TRUE)

save(core.char,file="./Build/Output/corechar.RData")


