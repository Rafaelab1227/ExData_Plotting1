#Charge packages
library(lubridate)
library(tidyr)

#set directory
setwd("C:/Users/rafaela.becerra/Desktop/R/R4/Week 1")

#read file
DF<-data.frame()
DF<-read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?", stringsAsFactors = FALSE)

#Change type
DF$Date<- as.Date(DF$Date,"%d/%m/%Y" )

#Subset
Date1<-as.Date("2007-02-01", "%Y-%m-%d")
Date2<-as.Date("2007-02-02", "%Y-%m-%d")
DF<-DF[DF$Date>=Date1 & DF$Date<=Date2,]

#Join date and time
DF<-unite(DF, Datetime, c(Date,Time), sep=" ")
DF$Datetime<-strptime(DF$Datetime, format="%Y-%m-%d %H:%M:%S")

#plot2
with(DF, plot(Datetime, Global_active_power, ylab="Global Active Power (kilowatts)", xlab="", type="l"))
dev.copy(png, file="plot2.png",width = 480, height = 480)
dev.off()