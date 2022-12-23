#Contains old gap data 97 codes that create gaps



reason == 6 ~ "Active Military",
reason == 0 ~ "Missing",
reason == 1 ~ ))

%>%
  mutate(spell = cumsum(Unemp)) %>%
  mutate(
    spell2 = {
      r <- rle(Unemp)
      r$values <- cumsum(r$values) * r$values
      inverse.rle(r) 
    }
  )
e <- d %>%
  arrange(ID,period) %>%
  group_by(ID)%>%
  mutate(Wid=seq_along(Week))

spell.time<-e %>%   #Need this for translation later
  subset(ID==1) %>%
  select(period,Wid)
spell.time$ID<-NULL

g <- e %>%
  group_by(ID, grp = rleid(spell2)) %>%
  filter(spell2 !=0) %>%
  summarise(spell_length = n()) %>% 
  mutate(Spell=seq_along(ID)) %>%
  select(-grp)

#Use e to start a new data set for spell start and end

f<-e %>%
  group_by(ID) %>%
  mutate(Ten=lag(Ten),
         UID=lag(UID)) %>%
  subset(spell2>0) %>%
  mutate(Wid2=lead(Wid)) %>%
  mutate(blah=ifelse(Wid+1==(Wid2), 1, 0)) %>%
  mutate(ends=ifelse(blah==0,Wid,0)) %>%
  mutate(starts=lag(ifelse(ends>0,lead(Wid),0)))

f$starts[is.na(f$starts)]<-f$Wid[is.na(f$starts)]
f$ends[is.na(f$ends)]<-f$Wid[is.na(f$ends)]

f <- f %>%
  subset(ends !=0 | starts !=0) %>%
  mutate(ends=lead(ends)) %>%
  group_by(ID) %>%
  distinct(spell2, .keep_all=TRUE) %>%
  select(ID,spell,spell2,ends,starts,Exp,Ten,UID)


f<-merge(f,spell.time,by.x="starts",by.y="Wid")
names(f)[which(names(f)=="period")]<-"Spell.Start"
f<-merge(f,spell.time,by.x="ends",by.y="Wid")
names(f)[which(names(f)=="period")]<-"Spell.Ends"



f$JID<-paste(f$ID,f$UID,sep="_")
f<-merge(f, c, by="JID", all.x=TRUE)

f<-f%>%
  arrange(ID,spell2) %>%
  select(-ends,-starts,-spell)
gaps<-merge(f,g,by.x=c("ID","spell2"),by.y=c("ID","Spell"),all.x=TRUE )

gaps<-arrange(gaps,ID,spell2)
names(gaps)[which(names(gaps)=="spell2")]<-"Spell.Num"

rm(d,e,f,g,spell.time,new_data,core,c)



search$count=1

search<-search %>%
  group_by(ID) %>%
  mutate(Spell.Num=cumsum(count)) %>%
  select(-count)