b<-main %>%
  filter(BMI_Level == "Obese") %>%
  select(ID) %>%
  distinct()

table(main$Race, main$BMI_Level)

white<-main %>%
  subset(Race == "White")%>%
  mutate(OCC2 = droplevels(OCC2),
         IND2 = droplevels(IND2))

w<-main %>%
  subset(Race == "White")%>%
  mutate(OCC2 = droplevels(OCC2),
         IND2 = droplevels(IND2)) %>%
  group_by(Gender, BMI_Level) %>%
  summarise(min=min(length),mean = mean(length), max=max(length), var=var(length), iqr=IQR(length))


table(white$Gender, white$BMI_Level)


black<-main %>%
  subset(Race == "Black") %>%
  mutate(OCC2 = droplevels(OCC2),
         IND2 = droplevels(IND2))
b<-main %>%
  subset(Race == "Black") %>%
  mutate(OCC2 = droplevels(OCC2),
         IND2 = droplevels(IND2)) %>%
  group_by(Gender, BMI_Level) %>%
  summarise(min=min(length),mean = mean(length), max=max(length), var=var(length), iqr=IQR(length))


table(black$Gender, black$BMI_Level)

hispan<-main %>%
  subset(Race == "Hispanic")%>%
  mutate(OCC2 = droplevels(OCC2),
         IND2 = droplevels(IND2))

table(hispan$Gender, hispan$BMI_Level)

h<-main %>%
  subset(Race == "Hispanic")%>%
  mutate(OCC2 = droplevels(OCC2),
         IND2 = droplevels(IND2)) %>%
  group_by(Gender, BMI_Level) %>%
  summarise(min=min(length),mean = mean(length), max=max(length), var=var(length), iqr=IQR(length))
