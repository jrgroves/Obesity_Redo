#Creates the Characteristic files for the NLSY dataset from 1980 to 2004
#By Jeremy Groves
#January 6, 2021
#Translation and update from old STATA code (charct.do)

rm(list=ls())

library(tidyverse)
library(foreign)





#Create the characteristic files for each year of the data

data<-read.dta("./Build/Input/nls1980.dta")
elements<-c("r0000100","r0000300","r0000500","r0000700","r0006500","r0007900","r0009600","r0214800","r0220200",
            "r0326800","r0388800","r0389000","r0389900","r0393510","r0393520","r0393540","r0405700","r0406401",
            "r0406500","r0406010","r0407602")

vnam<-c("ID","bmon","byear","cntry_birth","hgc_mother","hgc_father","race","sex","age","num_depend",
        "matrial","num_child","hs_dipl","urban_res","smsa_res","unempl_rate","region","hgc_self",
        "enroll","income","youngest")

data<-data %>%
        select(elements) %>%
          rename_with(~vnam)


data$height<-NA
data$weight<-NA

  data$year<-1980

core.char<-data

save(data, file="./Build/Input/char1980.RData")

data<-read.dta("./Build/Input/nls1981.dta")
elements<-c("r0000100","r0000300","r0000500","r0000700","r0006500","r0007900","r0009600","r0214800","r0619010",
            "r0497300","r0618601","r0418100","r0646900","r0647000","r0646800","r0602810","r0417400","r0619000",
            "r0481600","r0481700","r0618410","r0647102","r0618200","r0618300","r0618301")

vnam<-c("ID","bmon","byear","cntry_birth","hgc_mother","hgc_father","race","sex","age","num_depend",
        "matrial","hs_dipl","urban_res","smsa_res","unempl_rate","region","hgc_self",
        "enroll","height","weight","income","youngest","AFQT_1","AFQT_2","AFQT_3")

data<-data %>%
  select(elements) %>%
  rename_with(~vnam)

test<-data[,c("ID","AFQT_1","AFQT_2","AFQT_3")]
  save(test,file="./Build/Output/test.RData")
  
  data$AFQT_1<-NULL
  data$AFQT_2<-NULL
  data$AFQT_3<-NULL
  data$num_child<-NA

data$year<-1981

core.char<-rbind(core.char,data)

save(data, file="./Build/Input/char1981.RData")

data<-read.dta("./Build/Input/nls1982.dta")
elements<-c("r0000100","r0000300","r0000500","r0000700","r0006500","r0007900","r0009600","r0214800",
            "r0898310","r0797400","r0898401","r0897800","r0897900","r0898100","r0897910","r0898200",
            "r0898300","r0779800","r0779900","r0898600","r0898839")

vnam<-c("ID","bmon","byear","cntry_birth","hgc_mother","hgc_father","race","sex","age","num_depend",
        "matrial","urban_res","smsa_res","unempl_rate","region","hgc_self",
        "enroll","height","weight","income","youngest")

data<-data %>%
  select(elements) %>%
  rename_with(~vnam)

data$num_child<-NA

data$year<-1982

core.char<-rbind(core.char,data)

save(data, file="./Build/Input/char1982.RData")

data<-read.dta("./Build/Input/nls1983.dta")
elements<-c("r0000100","r0000300","r0000500","r0000700","r0006500","r0007900","r0009600","r0214800",
            "r1145110","r1039300","r1144901","r1146500","r1146400","r1146600","r1144800","r1145000",
            "r1145100","r1144500","r1146831")
vnam<-c("ID","bmon","byear","cntry_birth","hgc_mother","hgc_father","race","sex","age","num_depend",
        "matrial","urban_res","smsa_res","unempl_rate","region","hgc_self","enroll","income","youngest")
data<-data %>%
  select(elements) %>%
  rename_with(~vnam)
data$year<-1983

core.char<-rbind(core.char,data)

save(data, file="./Build/Input/char1983.RData")

data<-read.dta("./Build/Input/nls1984.dta")
elements<-c("r0000100","r0000300","r0000500","r0000700","r0006500","r0007900","r0009600","r0214800",
            "r1520310","r1426000","r1520101","r1521600","r1521700","r1521800","r1520000","r1520200",
            "r1520300","r1519700","r1522038")
vnam<-c("ID","bmon","byear","cntry_birth","hgc_mother","hgc_father","race","sex","age","num_depend",
        "matrial","urban_res","smsa_res","unempl_rate","region","hgc_self","enroll","income","youngest")
data<-data %>%
  select(elements) %>%
  rename_with(~vnam)
data$year<-1984

core.char<-rbind(core.char,data)

save(data, file="./Build/Input/char1984.RData")

data<-read.dta("./Build/Input/nls1985.dta")
elements<-c("r0000100","r0000300","r0000500","r0000700","r0006500","r0007900","r0009600","r0214800",
            "r1891010","r1790700","r1890801","r1892300","r1892400","r1892500","r1890700","r1890900",
            "r1891000","r1773900","r1774000","r1890400","r1892738")
vnam<-c("ID","bmon","byear","cntry_birth","hgc_mother","hgc_father","race","sex","age","num_depend",
        "matrial","urban_res","smsa_res","unempl_rate","region","hgc_self","enroll","height","weight",
        "income","youngest")
data<-data %>%
  select(elements) %>%
  rename_with(~vnam)
data$year<-1985

core.char<-rbind(core.char,data)

save(data, file="./Build/Input/char1985.RData")

data<-read.dta("./Build/Input/nls1986.dta")
elements<-c("r0000100","r0000300","r0000500","r0000700","r0006500","r0007900","r0009600","r0214800",
            "r2258110","r2153800","r2257901","r2259400","r2259500","r2257800","r2259600","r2258000",
            "r2258100","r2141300","r2257500","r2259838")
vnam<-c("ID","bmon","byear","cntry_birth","hgc_mother","hgc_father","race","sex","age","num_depend",
        "matrial","urban_res","smsa_res","unempl_rate","region","hgc_self","enroll","weight",
        "income","youngest")
data<-data %>%
  select(elements) %>%
  rename_with(~vnam)
data$year<-1986

core.char<-rbind(core.char,data)

save(data, file="./Build/Input/char1986.RData")

data<-read.dta("./Build/Input/nls1987.dta")
elements<-c("r0000100","r0000300","r0000500","r0000700","r0006500","r0007900","r0009600","r0214800",
            "r0000600","r2362400","r2445300","r2446900","r2447000","r2447100","r2445200","r2445400",
            "r2445500","r2444700","r2448038")
vnam<-c("ID","bmon","byear","cntry_birth","hgc_mother","hgc_father","race","sex","age","num_depend",
        "matrial","urban_res","smsa_res","unempl_rate","region","hgc_self","enroll",
        "income","youngest")
data<-data %>%
  select(elements) %>%
  rename_with(~vnam)
data$year<-1987

core.char<-rbind(core.char,data)

save(data, file="./Build/Input/char1987.RData")

data<-read.dta("./Build/Input/nls1988.dta")
elements<-c("r0000100","r0000300","r0000500","r0000700","r0006500","r0007900","r0009600","r0214800",
            "r0000600","r2735100","r2870900","r2872700","r2872800","r2872900","r2870800","r2871100",
            "r2871200","r2711500","r2870200","r2877700")
vnam<-c("ID","bmon","byear","cntry_birth","hgc_mother","hgc_father","race","sex","age","num_depend",
        "matrial","urban_res","smsa_res","unempl_rate","region","hgc_self","enroll","weight",
        "income","youngest")
data<-data %>%
  select(elements) %>%
  rename_with(~vnam)
data$year<-1988

core.char<-rbind(core.char,data)

save(data, file="./Build/Input/char1988.RData")

data<-read.dta("./Build/Input/nls1989.dta")
elements<-c("r0000100","r0000300","r0000500","r0000700","r0006500","r0007900","r0009600","r0214800",
            "r0000600","r3074600","r3076400","r3076500","r3076600","r3074500","r3074800","r3074900",
            "r2959600","r3074000","r3076843")
vnam<-c("ID","bmon","byear","cntry_birth","hgc_mother","hgc_father","race","sex","age",
        "matrial","urban_res","smsa_res","unempl_rate","region","hgc_self","enroll","weight",
        "income","youngest")
data<-data %>%
  select(elements) %>%
  rename_with(~vnam)
data$year<-1989

core.char<-rbind(core.char,data)

save(data, file="./Build/Input/char1989.RData")

data<-read.dta("./Build/Input/nls1990.dta")
elements<-c("r0000100","r0000300","r0000500","r0000700","r0006500","r0007900","r0009600","r0214800",
            "r0000600","r3401300","r3403100","r3403200","r3403300","r3401200","r3401500","r3401600",
            "r3271000","r3400700","r3407800")
vnam<-c("ID","bmon","byear","cntry_birth","hgc_mother","hgc_father","race","sex","age",
        "matrial","urban_res","smsa_res","unempl_rate","region","hgc_self","enroll","weight",
        "income","youngest")
data<-data %>%
  select(elements) %>%
  rename_with(~vnam)
data$year<-1990

core.char<-rbind(core.char,data)

save(data, file="./Build/Input/char1990.RData")

data<-read.dta("./Build/Input/nls1991.dta")
elements<-c("r0000100","r0000300","r0000500","r0000700","r0006500","r0007900","r0009600","r0214800",
            "r0000600","r3656700","r3658500","r3658600","r3658700","r3656600","r3656900","r3657000",
            "r3656100","r3659048")
vnam<-c("ID","bmon","byear","cntry_birth","hgc_mother","hgc_father","race","sex","age",
        "matrial","urban_res","smsa_res","unempl_rate","region","hgc_self","enroll",
        "income","youngest")
data<-data %>%
  select(elements) %>%
  rename_with(~vnam)
data$year<-1991

core.char<-rbind(core.char,data)

save(data, file="./Build/Input/char1991.RData")

data<-read.dta("./Build/Input/nls1992.dta")
elements<-c("r0000100","r0000300","r0000500","r0000700","r0006500","r0007900","r0009600","r0214800",
            "r0000600","r4007300","r4009000","r4009100","r4009200","r4007100","r4007400","r4007500",
            "r3886400","r4006600","r4009448")
vnam<-c("ID","bmon","byear","cntry_birth","hgc_mother","hgc_father","race","sex","age",
        "matrial","urban_res","smsa_res","unempl_rate","region","hgc_self","enroll","weight",
        "income","youngest")
data<-data %>%
  select(elements) %>%
  rename_with(~vnam)
data$year<-1992

core.char<-rbind(core.char,data)

save(data, file="./Build/Input/char1992.RData")

data<-read.dta("./Build/Input/nls1993.dta")
elements<-c("r0000100","r0000300","r0000500","r0000700","r0006500","r0007900","r0009600","r0214800",
            "r0000600","r4418300","r4420100","r4420200","r4420300","r4418200","r4418500","r4418600",
            "r4417700")
vnam<-c("ID","bmon","byear","cntry_birth","hgc_mother","hgc_father","race","sex","age",
       "matrial","urban_res","smsa_res","unempl_rate","region","hgc_self","enroll",
        "income")
data<-data %>%
  select(elements) %>%
  rename_with(~vnam)
data$year<-1993

core.char<-rbind(core.char,data)

save(data, file="./Build/Input/char1993.RData")

data<-read.dta("./Build/Input/nls1994.dta")
elements<-c("r0000100","r0000300","r0000500","r0000700","r0006500","r0007900","r0009600","r0214800",
            "r0000600","r5081300","r5083100","r5083200","r5083300","r5081200","r5081500","r5081600",
            "r5080700","r5087600")

vnam<-c("ID","bmon","byear","cntry_birth","hgc_mother","hgc_father","race","sex","age",
        "matrial","urban_res","smsa_res","unempl_rate","region","hgc_self","enroll",
        "income","youngest")

data<-data %>%
  select(elements) %>%
  rename_with(~vnam)
data$year<-1994

save(data, file="./Build/Input/char1994.RData")

save(core.char,file="./Build/Output/corechar.RData")


