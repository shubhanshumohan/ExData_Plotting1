#plot 4
library(readr)#for fast reading
hdata<-read.csv2("./household/household_power_consumption.txt",sep=";", nrow=2075259,
                 na.strings="?")
#subsetting the data
sub_hdata<-hdata[hdata$Date %in% c("1/2/2007","2/2/2007"),]
datetime <- strptime(paste(sub_hdata$Date,sub_hdata$Time), "%d/%m/%Y %H:%M:%S") 
png(file="plot4.png",height = 480,width=480)
par(mfrow=c(2,2))
#plots for first row
plot(datetime,as.numeric(sub_hdata$Global_active_power)/1000,type="l",ylab="Global Active Power")
plot(datetime,as.numeric(sub_hdata$Voltage),type="l",ylab="Voltage")
#plot for 2nd row 
plot(datetime,as.numeric(sub_hdata$Sub_metering_1),type="l",ylab="Energy sub metering")
points(datetime,as.numeric(sub_hdata$Sub_metering_2),type="l",col="red")
points(datetime,as.numeric(sub_hdata$Sub_metering_3),type="l",col="blue")
#legend("topright",col=c("black","red","blue"),legend=c("sub_metering_1","sub_metering
#_2","sub_metering_3"),lty=1)
##
plot(datetime,as.numeric(sub_hdata$Global_active_power)/10000,type="l",ylab="Global Active Power"
 )
dev.off()

