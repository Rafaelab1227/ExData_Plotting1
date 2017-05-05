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

#plot3
with(DF, plot(Datetime, Sub_metering_1, ylab="Energy sub metering", xlab="", type="l"))
lines(DF$Datetime, DF$Sub_metering_2, col="red")
lines(DF$Datetime, DF$Sub_metering_3, col="blue")
legend("topright", y.intersp=0.4, cex=1, text.width = strwidth("1,0000,0000"),xjust=1,lty = 1, col=c("black","blue","red"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.copy(png, file="plot3.png",width = 480, height = 480)
dev.off()