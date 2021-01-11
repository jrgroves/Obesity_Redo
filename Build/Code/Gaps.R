#Creates the "unemployment gaps files for the NLSY dataset from 1980 to 2004
#By Jeremy Groves
#January 6, 2021
#Translation and update from old STATA code (gaps2.do and gaps1.ado)

rm(list=ls())

library(tidyverse)
library(foreign)

gaps <- function(x) {
  j1s<-as.Date(paste(x[,2],x[,3],x[,4],sep="-"), "%m-%d-%y")
  j1e<-as.Date(paste(x[,5],x[,6],x[,7],sep="-"), "%m-%d-%y")
  j1ten<-x[,8]
  j1r<-x[,9]
  j1o<-x[,10]
  j1t<-x[,11]
  j1c<-x[,12]
  j1hr<-x[,57]
  j1cb<-x[,62]

  j2s<-as.Date(paste(x[,13],x[,14],x[,15],sep="-"), "%m-%d-%y")
  j2e<-as.Date(paste(x[,16],x[,17],x[,18],sep="-"), "%m-%d-%y")
  j2ten<-x[,19]
  j2r<-x[,20]
  j2o<-x[,21]
  j2t<-x[,22]
  j2c<-x[,23]
  j2hr<-x[,58]
  j2cb<-x[,63]
  
  j3s<-as.Date(paste(x[,24],x[,25],x[,26],sep="-"), "%m-%d-%y")
  j3e<-as.Date(paste(x[,27],x[,28],x[,29],sep="-"), "%m-%d-%y")
  j3ten<-x[,30]
  j3r<-x[,31]
  j3o<-x[,32]
  j3t<-x[,33]
  j3c<-x[,34]
  j3hr<-x[,59]
  j3cb<-x[,64]
  
  j4s<-as.Date(paste(x[,35],x[,36],x[,37],sep="-"), "%m-%d-%y")
  j4e<-as.Date(paste(x[,38],x[,39],x[,40],sep="-"), "%m-%d-%y")
  j4ten<-x[,41]
  j4r<-x[,42]
  j4o<-x[,43]
  j4t<-x[,44]
  j4c<-x[,45]
  j4hr<-x[,60]
  j4cb<-x[,65]
  
  j5s<-as.Date(paste(x[,46],x[,47],x[,48],sep="-"), "%m-%d-%y")
  j5e<-as.Date(paste(x[,49],x[,50],x[,51],sep="-"), "%m-%d-%y")
  j5ten<-x[,52]
  j5r<-x[,53]
  j5o<-x[,54]
  j5t<-x[,55]
  j5c<-x[,56]
  j5hr<-x[,61]
  j5cb<-x[,66]
  
  ID<-x[,1]
  
  temp<-data.frame(ID,j1s,j1e,j1ten,j1r,j1o,j1t,j1c,j1hr,j1cb,
                   j2s,j2e,j2ten,j2r,j2o,j2t,j2c,j2hr,j2cb,j3s,j3e,j3ten,j3r,j3o,j3t,j3c,j3hr,j3cb,
                   j4s,j4e,j4ten,j4r,j4o,j4t,j4c,j4hr,j4cb,j5s,j5e,j5ten,j5r,j5o,j5t,j5c,j5hr,j5cb)
  
  temp$gap5<-temp$j4s-temp$j5e
  temp$gap4<-temp$j3s-temp$j4e
  temp$gap3<-temp$j2s-temp$j3e
  temp$gap2<-temp$j1s-temp$j2e

  
  df1<-subset(temp,select=c(ID,gap5,j5ten:j5cb))
    df1<-df1[!is.na(df1$gap5),]
    names(df1)<-c("ID","gap","ten","reason","occ","type","class","rate","union")
  df2<-subset(temp,select=c(ID,gap4,j4ten:j4cb))
    df2<-df2[!is.na(df2$gap4),]
    names(df2)<-c("ID","gap","ten","reason","occ","type","class","rate","union")
  df3<-subset(temp,select=c(ID,gap3,j3ten:j3cb))
    df3<-df3[!is.na(df3$gap3),]
    names(df3)<-c("ID","gap","ten","reason","occ","type","class","rate","union")
  df4<-subset(temp,select=c(ID,gap2,j2ten:j2cb))
    df4<-df4[!is.na(df4$gap2),]
    names(df4)<-c("ID","gap","ten","reason","occ","type","class","rate","union")
    
  out<-rbind(df1,df2,df3,df4)
  out<-out[which(out$gap>0),]
  
  return(out)
}


corr<-read.csv("./Build/Input/correction.csv", header=TRUE, as.is=TRUE)
   names(corr)<-gsub("R","r",names(corr))
gaps2<-read.csv("./Build/Input/GAPS.csv", as.is=TRUE, header=TRUE)
  names(gaps2)<-gsub("R","r",names(gaps2))
   
#1980 Unemployment Gaps####
data<-read.dta("./Build/Input/nls1980.dta")
  data<-merge(data,corr,by="r0000100",all.x=TRUE)
  names(data)<-gsub(".x","",names(data))
  names(data)<-gsub(".y","z",names(data))
  
  data<-merge(data,gaps2,by="r0000100",all.x=TRUE)
    names(data)<-gsub(".y","",names(data))

elements<-c("r0000100","r0332700","r0332710","r0332720","r0333200","r0333210","r0333220","r0333221","r0333300",
            "r0338300","r0338400","r0338500","r0344200","r0344210","r0344220","r0344700","r0344710","r0344720",
            "r0344721","r0344800","r0349800","r0349900","r0350000","r0355700","r0355710","r0355720","r0356200",
            "r0356210","r0356220","r0356221","r0356300","r0361300","r0361400","r0361500","r0367200","r0367210",
            "r0367220","r0367700","r0367710","r0367720","r0367721","r0367800","r0372800","r0372900","r0373000",
            "r0378700","r0378710","r0378720","r0379200","r0379210","r0379220","r0379221","r0379300","r0384300",
            "r0384400","r0384500","r0338910","r0350410","r0361910","r0373410","r0384910","r0339200","r0350700",
            "r0362200","r0373700","r0385200")

data<-data %>%
      select(elements) 

%>%
        gaps()
data$year<-1980
  core.gap<-data
  
#1981 unemployment gaps####
  
data<-read.dta("./Build/Input/nls1981.dta")
  data<-merge(data,corr,by="r0000100",all.x=TRUE)
  names(data)<-gsub(".x","",names(data))
  names(data)<-gsub(".y","z",names(data))
  
  data<-merge(data,gaps2,by="r0000100",all.x=TRUE)
  names(data)<-gsub(".y","",names(data))

data$r0578600<-15 #Day of leaving job 4 is missing

elements<-c("r0000100","r0538800","r0538900","r0539000","r0539200","r0539300","r0539400","r0539410","r0539500",
            "r0546000","r0546100","r0546200","r0551900","r0552000","r0552100","r0552300","r0552400","r0552500",
            "r0552510","r0552600","r0559100","r0559200","r0559300","r0565000","r0565100","r0565200","r0565400",
            "r0565500","r0565600","r0565610","r0565700","r0572200","r0572300","r0572400","r0578100","r0578200",
            "r0578300","r0578500","r0578600","r0578700","r0578710","r0578800","r0585300","r0585400","r0585500",
            "r0591200","r0591300","r0591400","r0591600","r0591700","r0591800","r0591810","r0591900","r0598400",
            "r0598500","r0598600","r0546610","r0559710","r0572810","r0585910","r0599010","r0546900","r0560000",
            "r0573100","r0586200","r0599300")

data<-data %>%
  select(elements) %>%
  gaps()

data$year<-1981
core.gap<-rbind(core.gap,data)


#1982 unemployment gaps####

data<-read.dta("./Build/Input/nls1982.dta")
data<-merge(data,corr,by="r0000100",all.x=TRUE)
names(data)<-gsub(".x","",names(data))
names(data)<-gsub(".y","z",names(data))

data<-merge(data,gaps2,by="r0000100",all.x=TRUE)
names(data)<-gsub(".y","",names(data))

elements<-c("r0000100","r0833200","r0833300","r0833400","r0833600","r0833700","r0833800","r0833810","r0833900",
            "r0840500","r0840600","r0840700","r0846300","r0846400","r0846500","r0846700","r0846800","r0846900",
            "r0846910","r0847000","r0853600","r0853700","r0853800","r0859400","r0859500","r0859600","r0859800",
            "r0859900","r0860000","r0860010","r0860100","r0866700","r0866800","r0866900","r0872500","r0872600",
            "r0872700","r0872900","r0873000","r0873100","r0873110","r0873200","r0879800","r0879900","r0880000",
            "r0885600","r0885700","r0885800","r0886000","r0886100","r0886200","r0886210","r0886300","r0892900",
            "r0893000","r0893100","r0841010","r0854110","r0867210","r0880310","r0893410","r0841200","r0854300",
            "r0867400","r0880500","r0893600")

data<-data %>%
  select(elements) %>%
  gaps()

data$year<-1982
core.gap<-rbind(core.gap,data)

#1983 unemployment gaps####

data<-read.dta("./Build/Input/nls1983.dta")
data<-merge(data,corr,by="r0000100",all.x=TRUE)
names(data)<-gsub(".x","",names(data))
names(data)<-gsub(".y","z",names(data))

data<-merge(data,gaps2,by="r0000100",all.x=TRUE)
names(data)<-gsub(".y","",names(data))

elements<-c("r0000100","r1080400","r1080500","r1080600","r1080800","r1080900","r1081000","r1081010","r1081100",
            "r1087700","r1087800","r1087900","r1093600","r1093700","r1093800","r1094000","r1094100","r1094200",
            "r1094210","r1094300","r1100900","r1101000","r1101100","r1106800","r1106900","r1107000","r1107200",
            "r1107300","r1107400","r1107410","r1107500","r1114100","r1114200","r1114300","r1120000","r1120100",
            "r1120200","r1120400","r1120500","r1120600","r1120610","r1120700","r1127300","r1127400","r1127500",
            "r1133200","r1133300","r1133400","r1133600","r1133700","r1133800","r1133810","r1133900","r1140500",
            "r1140600","r1140700","r1088210","r1101410","r1114610","r1127810","r1141010","r1088500","r1101700",
            "r1114900","r1128100","r1141300")

data<-data %>%
  select(elements) %>%
  gaps()

data$year<-1983
core.gap<-rbind(core.gap,data)

#1984 unemployment gaps####

data<-read.dta("./Build/Input/nls1984.dta")
data<-merge(data,corr,by="r0000100",all.x=TRUE)
names(data)<-gsub(".x","",names(data))
names(data)<-gsub(".y","z",names(data))

data<-merge(data,gaps2,by="r0000100",all.x=TRUE)
names(data)<-gsub(".y","",names(data))

elements<-c("r0000100","r1456100","r1456200","r1456300","r1456500","r1456600","r1456700","r1456710","r1456800",
            "r1463400","r1463500","r1463600","r1469200","r1469300","r1469400","r1469600","r1469700","r1469800",
            "r1469810","r1469900","r1476500","r1476600","r1476700","r1482300","r1482400","r1482500","r1482700",
            "r1482800","r1482900","r1482910","r1483000","r1489600","r1489700","r1489800","r1495400","r1495500",
            "r1495600","r1495800","r1495900","r1496000","r1496010","r1496100","r1502700","r1502800","r1502900",
            "r1508500","r1508600","r1508700","r1508900","r1509000","r1509100","r1509110","r1509200","r1515800",
            "r1515900","r1516000","r1463910","r1477010","r1490110","r1503210","r1516310","r1464200","r1477300",
            "r1490400","r1503500","r1516600")

data<-data %>%
  select(elements) %>%
  gaps()

data$year<-1984
core.gap<-rbind(core.gap,data)

#1985 unemployment gaps####

data<-read.dta("./Build/Input/nls1985.dta")
data<-merge(data,corr,by="r0000100",all.x=TRUE)
names(data)<-gsub(".x","",names(data))
names(data)<-gsub(".y","z",names(data))

data<-merge(data,gaps2,by="r0000100",all.x=TRUE)
names(data)<-gsub(".y","",names(data))

elements<-c("r0000100","r1802900","r1803000","r1803100","r1803300","r1803400","r1803500","r1803510","r1803600",
            "r1810200","r1810300","r1810400","r1815600","r1815700","r1815800","r1816000","r1816100","r1816200",
            "r1816210","r1816300","r1822900","r1823000","r1823100","r1828300","r1828400","r1828500","r1828700",
            "r1828800","r1828900","r1828910","r1829000","r1835600","r1835700","r1835800","r1841000","r1841100",
            "r1841200","r1841400","r1841500","r1841600","r1841610","r1841700","r1848300","r1848400","r1848500",
            "r1853700","r1853800","r1853900","r1854100","r1854200","r1854300","r1854310","r1854400","r1861000",
            "r1861100","r1861200","r1810710","r1823410","r1836110","r1848810","r1861510","r1811000","r1823700",
            "r1836400","r1849100","r1861800")

data<-data %>%
  select(elements) %>%
  gaps()

data$year<-1985
core.gap<-rbind(core.gap,data)

#1986 unemployment gaps####

data<-read.dta("./Build/Input/nls1986.dta")
data<-merge(data,corr,by="r0000100",all.x=TRUE)
names(data)<-gsub(".x","",names(data))
names(data)<-gsub(".y","z",names(data))

data<-merge(data,gaps2,by="r0000100",all.x=TRUE)
names(data)<-gsub(".y","",names(data))

elements<-c("r0000100","r2164500","r2164600","r2164700","r2164900","r2165000","r2165100","r2165110","r2165200",
            "r2171900","r2172000","r2172100","r2178100","r2178200","r2178300","r2178500","r2178600","r2178700",
            "r2178710","r2178800","r2185500","r2185600","r2185700","r2191700","r2191800","r2191900","r2192100",
            "r2192200","r2192300","r2192310","r2192400","r2199100","r2199200","r2199300","r2205300","r2205400",
            "r2205500","r2205700","r2205800","r2205900","r2205910","r2206000","r2212700","r2212800","r2212900",
            "r2218900","r2219000","r2219100","r2219300","r2219400","r2219500","r2219510","r2219600","r2226300",
            "r2226400","r2226500","r2172410","r2186010","r2199610","r2213210","r2226810","r2173500","r2187100",
            "r2200700","r2214300","r2227900")

data<-data %>%
  select(elements) %>%
  gaps()

data$year<-1987
core.gap<-rbind(core.gap,data)

#1987 unemployment gaps####

data<-read.dta("./Build/Input/nls1987.dta")
data<-merge(data,corr,by="r0000100",all.x=TRUE)
names(data)<-gsub(".x","",names(data))
names(data)<-gsub(".y","z",names(data))

data<-merge(data,gaps2,by="r0000100",all.x=TRUE)
names(data)<-gsub(".y","",names(data))

elements<-c("r0000100","r2371900","r2372000","r2372100","r2372300","r2372400","r2372500","r2372510","r2372600",
            "r2376700","r2376800","r2376900","r2383200","r2383300","r2383400","r2383600","r2383700","r2383800",
            "r2383810","r2383900","r2388000","r2388100","r2388200","r2394500","r2394600","r2394700","r2394900",
            "r2395000","r2395100","r2395110","r2395200","r2399300","r2399400","r2399500","r2405800","r2405900",
            "r2406000","r2406200","r2406300","r2406400","r2406410","r2406500","r2410600","r2410700","r2410800",
            "r2417100","r2417200","r2417300","r2417500","r2417600","r2417700","r2417710","r2417800","r2421900",
            "r2422000","r2422100","r2377210","r2388510","r2399810","r2411110","r2422410","r2378500","r2389800",
            "r2401100","r2412400","r2423700")

data<-data %>%
  select(elements) %>%
  gaps()

data$year<-1987
core.gap<-rbind(core.gap,data)

#1988 unemployment gaps####

data<-read.dta("./Build/Input/nls1988.dta")
data<-merge(data,corr,by="r0000100",all.x=TRUE)
names(data)<-gsub(".x","",names(data))
names(data)<-gsub(".y","z",names(data))

data<-merge(data,gaps2,by="r0000100",all.x=TRUE)
names(data)<-gsub(".y","",names(data))

elements<-c("r0000100","r2762800","r2762900","r2763000","r2763200","r2763300","r2763400","r2763410","r2763500",
            "r2771500","r2771600","r2771700","r2775700","r2775800","r2775900","r2776100","r2776200","r2776300",
            "r2776310","r2776400","r2784400","r2784500","r2784600","r2788600","r2788700","r2788800","r2789000",
            "r2789100","r2789200","r2789210","r2789300","r2797300","r2797400","r2797500","r2801500","r2801600",
            "r2801700","r2801900","r2802000","r2802100","r2802110","r2802200","r2810200","r2810300","r2810400",
            "r2814400","r2814500","r2814600","r2814800","r2814900","r2815000","r2815010","r2815100","r2823100",
            "r2823200","r2823300","r2772210","r2785110","r2798010","r2810910","r2823810","r2773200","r2786100",
            "r2799000","r2811900","r2824800")

data<-data %>%
  select(elements) %>%
  gaps()

data$year<-1988
core.gap<-rbind(core.gap,data)

#1989 unemployment gaps####

data<-read.dta("./Build/Input/nls1989.dta")
data<-merge(data,corr,by="r0000100",all.x=TRUE)
names(data)<-gsub(".x","",names(data))
names(data)<-gsub(".y","z",names(data))

data<-merge(data,gaps2,by="r0000100",all.x=TRUE)
names(data)<-gsub(".y","",names(data))

elements<-c("r0000100","r3004600","r3004700","r3004800","r3005000","r3005100","r3005200","r3005210","r3005300",
            "r3013300","r3013400","r3013500","r3017700","r3017800","r3017900","r3018100","r3018200","r3018300",
            "r3018310","r3018400","r3026400","r3026500","r3026600","r3030800","r3030900","r3031000","r3031200",
            "r3031300","r3031400","r3031410","r3031500","r3039500","r3039600","r3039700","r3043900","r3044000",
            "r3044100","r3044300","r3044400","r3044500","r3044510","r3044600","r3052600","r3052700","r3052800",
            "r3057000","r3057100","r3057200","r3057400","r3057500","r3057600","r3057610","r3057700","r3065700",
            "r3065800","r3065900","r3014010","r3027110","r3040210","r3053310","r3066410","r3015100","r3028200",
            "r3041300","r3054400","r3067500")

data<-data %>%
  select(elements) %>%
  gaps()

data$year<-1989
core.gap<-rbind(core.gap,data)

#1990 unemployment gaps####

data<-read.dta("./Build/Input/nls1990.dta")
data<-merge(data,corr,by="r0000100",all.x=TRUE)
names(data)<-gsub(".x","",names(data))
names(data)<-gsub(".y","z",names(data))

data<-merge(data,gaps2,by="r0000100",all.x=TRUE)
names(data)<-gsub(".y","",names(data))

elements<-c("r0000100","r3332000","r3332100","r3332200","r3332400","r3332500","r3332600","r3332610","r3332700",
            "r3340700","r3340800","r3340900","r3346000","r3346100","r3346200","r3346400","r3346500","r3346600",
            "r3346610","r3346700","r3354700","r3354800","r3354900","r3360000","r3360100","r3360200","r3360400",
            "r3360500","r3360600","r3360610","r3360700","r3368700","r3368800","r3368900","r3374000","r3374100",
            "r3374200","r3374400","r3374500","r3374600","r3374610","r3374700","r3382700","r3382800","r3382900",
            "r3388000","r3388100","r3388200","r3388400","r3388500","r3388600","r3388610","r3388700","r3396700",
            "r3396800","r3396900","r3341500","r3355500","r3369500","r3383500","r3397500","r3343900","r3357900",
            "r3371900","r3385900","r3399900")

data<-data %>%
  select(elements) %>%
  gaps()

data$year<-1990
core.gap<-rbind(core.gap,data)

#1991 unemployment gaps####

data<-read.dta("./Build/Input/nls1991.dta")
data<-merge(data,corr,by="r0000100",all.x=TRUE)
names(data)<-gsub(".x","",names(data))
names(data)<-gsub(".y","z",names(data))

data<-merge(data,gaps2,by="r0000100",all.x=TRUE)
names(data)<-gsub(".y","",names(data))
elements<-c("r0000100","r3597000","r3597100","r3597200","r3597400","r3597500","r3597600","r3597610","r3597700",
            "r3605000","r3605100","r3605200","r3609100","r3609200","r3609300","r3609500","r3609600","r3609700",
            "r3609710","r3609800","r3617100","r3617200","r3617300","r3621200","r3621300","r3621400","r3621600",
            "r3621700","r3621800","r3621810","r3621900","r3629200","r3629300","r3629400","r3633300","r3633400",
            "r3633500","r3633700","r3633800","r3633900","r3633910","r3634000","r3641300","r3641400","r3641500",
            "r3645400","r3645500","r3645600","r3645800","r3645900","r3646000","r3646010","r3646100","r3653400",
            "r3653500","r3653600","r3605800","r3617900","r3630000","r3642100","r3654200","r3607000","r3619100",
            "r3631200","r3643300","r3655400")

data<-data %>%
  select(elements) %>%
  gaps()

data$year<-1991
core.gap<-rbind(core.gap,data)

#1992 unemployment gaps####

data<-read.dta("./Build/Input/nls1992.dta")
data<-merge(data,corr,by="r0000100",all.x=TRUE)
names(data)<-gsub(".x","",names(data))
names(data)<-gsub(".y","z",names(data))

data<-merge(data,gaps2,by="r0000100",all.x=TRUE)
names(data)<-gsub(".y","",names(data))

elements<-c("r0000100","r3947100","r3947200","r3947300","r3947500","r3947600","r3947700","r3947800","r3947900",
            "r3955200","r3955300","r3955400","r3959300","r3959400","r3959500","r3959700","r3959800","r3959900",
            "r3960000","r3960100","r3967400","r3967500","r3967600","r3971500","r3971600","r3971700","r3971900",
            "r3972000","r3972100","r3972200","r3972300","r3979600","r3979700","r3979800","r3983700","r3983800",
            "r3983900","r3984100","r3984200","r3984300","r3984400","r3984500","r3991800","r3991900","r3992000",
            "r3995900","r3996000","r3996100","r3996300","r3996400","r3996500","r3996600","r3996700","r4004000",
            "r4004100","r4004200","r3956000","r3968200","r3980400","r3992600","r4004800","r3957200","r3969400",
            "r3981600","r3993800","r4006000")

data<-data %>%
  select(elements) %>%
  gaps()

data$year<-1992
core.gap<-rbind(core.gap,data)

#1993 unemployment gaps####

data<-read.dta("./Build/Input/nls1993.dta")
data<-merge(data,corr,by="r0000100",all.x=TRUE)
names(data)<-gsub(".x","",names(data))
names(data)<-gsub(".y","z",names(data))

data<-merge(data,gaps2,by="r0000100",all.x=TRUE)
names(data)<-gsub(".y","",names(data))

elements<-c("r0000100","r4187800","r4187801","r4187802","r4440300","r4440301","r4440302","r4416300","r4188000",
            "r4193700","r4193800","r4193900","r4200700","r4200701","r4200702","r4201200","r4201201","r4201202",
            "r4416400","r4200900","r4206100","r4206200","r4206300","r4208300","r4208301","r4208302","r4208800",
            "r4208801","r4208802","r4416500","r4208500","r4213300","r4213400","r4213500","r4215300","r4215301",
            "r4215302","r4215800","r4215801","r4215802","r4416600","r4215500","r4220900","r4221000","r4221100",
            "r4222900","r4222901","r4222902","r4223400","r4223401","r4223402","r4416700","r4223100","r4228300",
            "r4228400","r4228500","r4199200","r4207000","r4214200","r4221800","r4229000","r4200000","r4207600",
            "r4214800","r4222400","r4229600")

data<-data %>%
  select(elements) %>%
  gaps()

data$year<-1993
core.gap<-rbind(core.gap,data)

save(core.gap,file="./Build/Output/coregap.RData")

