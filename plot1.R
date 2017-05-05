#set directory
setwd("C:/Users/rafaela.becerra/Desktop/R/R4/Week 1")

#read file
DF<-data.frame()
DF<-read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?", stringsAsFactors = FALSE)

#Change type
DF$Date<- as.Date(DF$Date,"%d/%m/%Y" )
DF$Time<-strptime(DF$Time, format="%H:%M:%S")

#Subset
Date1<-as.Date("2007-02-01", "%Y-%m-%d")
Date2<-as.Date("2007-02-02", "%Y-%m-%d")
DF1<-DF[DF$Date>=Date1 & DF$Date<=Date2,]

#plot1
with(DF1, hist(Global_active_power, main="Global Active Power", col="red", xlab="Global Active Power (kilowatts)"))
dev.copy(png, file="plot1.png",width = 480, height = 480)
dev.off()