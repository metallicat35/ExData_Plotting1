#set working directory
setwd("~/Desktop/Coursera/Exploratory Data Analysis /Week 1")
plot4_data = read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F)
#Convert date 
plot4_data$Date <- as.Date(plot4_data$Date, format="%d/%m/%Y")

#Take subset of data to plot and convert dates
plot4_data_subset <- subset(plot4_data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02")) 

plot4_datetime <- paste(as.Date(plot4_data_subset$Date), plot4_data_subset$Time)
plot4_data_subset$Datetime <- as.POSIXct(plot4_datetime)


#Plot 4
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(plot4_data_subset, {
  plot(Global_active_power~Datetime, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  plot(Voltage~Datetime, type="l", 
       ylab="Voltage (volt)", xlab="")
  plot(Sub_metering_1~Datetime, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty = "n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power~Datetime, type="l", 
       ylab="Global Rective Power (kilowatts)",xlab="")
})
# Save to PNG File
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()