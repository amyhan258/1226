library(data.table)
library(tidymodels)
library(tidyverse)
library(lubridate)
library(hms)
a="5:34:56"
b="23:54:45"
c="0"
as_hms(c)
as.numeric(a)
a

as.numeric(as_hms(a)+as_hms("24:00:00")-as_hms(b))/60

d=0.0
ifelse(d==0,1,2)

interval(as_hms(a),as_hms(b)) %>% as.period()
difftime(a-b)



dt1 <- data.table(a=1:6, b=2:7,c=3:8,cd=5:10)
dt1


dt1[,abcdef:=rowSums(.SD), .SDcols=grep ("c", names(dt1), value=T) ]

  

d


data(ames, package = "modeldata")
set.seed(393)
ames_missing <- ames
ames_missing$Longitude[sample(1:nrow(ames), 200)] <- NA
ames_missing$Latitude[sample(1:nrow(ames), 50)] <- NA

imputed_ames <-
  recipe(Sale_Price~.,data = ames_missing) %>%
  step_impute_linear(
    c(Longitude,Latitude),
    impute_with = imp_vars(c("Street","Alley"))
  ) %>%
  prep(ames_missing)

imputed <-
  bake(imputed_ames, new_data = ames_missing) 
  


