#household_power_consumption data dowloaded and unzipped in current working directory.

current <- read.csv("household_power_consumption.txt",header=TRUE,stringsAsFactors = FALSE,sep=";")
current$Date <- dmy(current$Date)
sample <- subset(current,current$Date=="2007-02-01"|current$Date=="2007-02-02")

# Added another column date_time by clubbing date and time columns.
sample$date_time = ymd_hms(paste(sample$Date, sample$Time)) 

 sample$Global_reactive_power<- as.numeric(sample$Global_reactive_power)
 sample$Voltage<- as.numeric(sample$Voltage)
 sample$Global_intensity<- as.numeric(sample$Global_intensity)
 sample$Sub_metering_1<- as.numeric(sample$Sub_metering_1)
 sample$Sub_metering_2<- as.numeric(sample$Sub_metering_2)
 sample$Sub_metering_3<- as.numeric(sample$Sub_metering_3)
 
 #Plot3
 with(sample,plot(date_time,Sub_metering_1,pch=".",col="red",ylab="Energy Sum Metering",xlab=""))
 with(sample,points(date_time,Sub_metering_2,pch=".",col="black"))
 with(sample,points(date_time,Sub_metering_3,pch=".",col="blue"))
 lines(sample$date_time,sample$Sub_metering_2,col="red")
 lines(sample$date_time,sample$Sub_metering_1,col="black")
 lines(sample$date_time,sample$Sub_metering_3,col="blue")
 legend("topright",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1)
 dev.copy(png,file="plot3.png",width=480,height=480)
 dev.off()
