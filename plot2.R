#plot 2
library(readr)#for fast reading
hdata<-read.csv2("./household/household_power_consumption.txt",sep=";", nrow=2075259,
                 na.strings="?")
#subsetting the data
sub_hdata<-hdata[hdata$Date %in% c("1/2/2007","2/2/2007"),]
datetime <- strptime(paste(sub_hdata$Date,sub_hdata$Time), "%d/%m/%Y %H:%M:%S") 
png(file="plot2.png",height = 480,width = 480)
plot(datetime,as.numeric(sub_hdata$Global_active_power)/1000,type="l",ylab="Global Active Power(Kilowatts)")
dev.off()

