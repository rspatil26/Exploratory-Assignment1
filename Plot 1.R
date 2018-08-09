# Exploratory-Assignment1
#household_power_consumption data dowloaded and unzipped in current working directory.

current <- read.csv("household_power_consumption.txt",header=TRUE,stringsAsFactors = FALSE,sep=";")
current$Date <- dmy(current$Date)
sample <- subset(current,current$Date=="2007-02-01"|current$Date=="2007-02-02")

# Added another column date_time by clubbing date and time columns.
sample$date_time = ymd_hms(paste(sample$Date, sample$Time)) 

sample$Global_active_power<- as.numeric(sample$Global_active_power)

hist(sample$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power(KiloWatts)")
