#Charge packages
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

#Form of the plot
par(mfrow=c(2,2), mar=c(4,4,0,1), oma=c(0,0,0,0))

#plot1
with(DF, plot(Datetime, Global_active_power, ylab="Global Active Power", xlab="", type="l"))

#plot2
with(DF, plot(Datetime, Voltage, ylab="Voltage", xlab="datetime", type="l"))

#plot3
with(DF, plot(Datetime, Sub_metering_1, ylab="Energy sub metering", xlab="", type="l"))
lines(DF$Datetime, DF$Sub_metering_2, col="red")
lines(DF$Datetime, DF$Sub_metering_3, col="blue")
legend("topright", y.intersp=0.5, cex=1, text.width = strwidth("1,000,0000"),lty = 1, xjust = 1, yjust = 1, bty="n", col=c("black","blue","red"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

#plot4
with(DF, plot(Datetime, Global_reactive_power, ylab="Global_reactive_power", xlab="datetime", type="l"))

dev.copy(png, file="plot4.png",width = 480, height = 480)
dev.off()