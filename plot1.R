#plot 1
#reading the data
library(readr)#for fast reading
hdata<-read.csv2("./household/household_power_consumption.txt",sep=";", nrow=2075259,
                 na.strings="?")
#subsetting the data
sub_hdata<-hdata[hdata$Date %in% c("1/2/2007","2/2/2007"),]
png(file="plot1.png",height = 480,width = 480)
hist(as.numeric(sub_hdata$Global_active_power)/1000,xlab="Global Active Power(Kilowatts)",col="red",
   main="Global Active Power")

dev.off()
