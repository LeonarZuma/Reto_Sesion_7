
library(rvest)
myurl <- "https://www.glassdoor.com.mx/Sueldos/data-scientist-sueldo-SRCH_KO0,14.htm"
file <- read_html(myurl) 


tables <- html_nodes(file, "table")  

table1 <- html_table(tables[1], fill = TRUE)

table <- na.omit(as.data.frame(table1)) 

str(table)
table$Sueldo<-gsub("/mes" , "" , table$Sueldo)
table$Sueldo<-gsub("MXN\\$" , "" , table$Sueldo)
table$Sueldo<-gsub("\\," , "" , table$Sueldo)
head(table)

table$Sueldo<-as.numeric(as.character(table$Sueldo))
str(table)

maximo<-table[which.max(table$Sueldo),]
minimo<-table[which.min(table$Sueldo),]
