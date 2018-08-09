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
 
 #Plot4
  par(mfcol = c(2, 2), mar=c(4,4,2,1),oma = c(0, 0, 2, 0))
 with(sample,plot(date_time,Global_active_power,pch=".",ylab="Global Active Power(Kilowatts)",xlab=""))
 lines(sample$date_time,sample$Global_active_power)
 
 with(sample,plot(date_time,Sub_metering_1,pch=".",col="red",ylab="Energy Sum Metering",xlab=""))
 with(sample,points(date_time,Sub_metering_2,pch=".",col="black"))
 with(sample,points(date_time,Sub_metering_3,pch=".",col="blue"))
 lines(sample$date_time,sample$Sub_metering_2,col="red")
 lines(sample$date_time,sample$Sub_metering_1,col="black")
 lines(sample$date_time,sample$Sub_metering_3,col="blue")
 legend("topright",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1)

 with(sample, plot(date_time,Voltage,pch="."))
 lines(sample$date_time,sample$Voltage)
  
 with(sample,plot(date_time,Global_reactive_power,pch="."))
 lines(sample$date_time,sample$Global_reactive_power)
 
 dev.copy(png,file="plot4.png",width=480,height=480)
 dev.off()
