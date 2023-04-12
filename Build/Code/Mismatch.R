mismatch <- main %>%
filter(Height2 != Height3) %>%
select(ID, Year, BMI_Level) %>%
rename(BMI_L_H3 = BMI_Level)

mismatch2 <-mismatch

load("./mismatch.RData")

mis<-mismatch2 %>%
  full_join(., mismatch, by=c("ID", "Year")) %>%
  filter(BMI_L_H3 != BMI_L_H2) %>%
  select(ID, Year) %>%
  distinct() %>%
  mutate(drop = 1)

save(mis, file="./Build/Input/mismatch.RData")
