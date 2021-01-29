library(DBI)
library(RMySQL)

MyDataBase <- dbConnect(
  drv = RMySQL::MySQL(),
  dbname = "shinydemo",
  host = "shiny-demo.csa7qlmguqrf.us-east-1.rds.amazonaws.com",
  username = "guest",
  password = "guest")

dbListTables(MyDataBase)

dbListFields(MyDataBase, 'CountryLanguage')
DataDB <- dbGetQuery(MyDataBase, "select * from CountryLanguage")

head(DataDB)
library(dplyr)
pop50.mex <-  DataDB %>% filter(Language == "Spanish")   # Ciudades del país de México con más de 50,000 habitantes

df<-as.data.frame(pop50.mex)

library(ggplot2)

ggplot(df,aes(x=Percentage, y=CountryCode,fill=IsOfficial))+geom_bar(colour="black",stat='identity')
