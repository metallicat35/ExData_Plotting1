#set working directory
setwd("~/Desktop/Coursera/Exploratory Data Analysis /Week 1")
plot3_data = read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F)
#Convert date 
plot3_data$Date <- as.Date(plot3_data$Date, format="%d/%m/%Y")

#Take subset of data to plot and convert dates
plot3_data_subset <- subset(plot3_data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02")) 

plot3_datetime <- paste(as.Date(plot3_data_subset$Date), plot3_data_subset$Time)
plot3_data_subset$Datetime <- as.POSIXct(plot3_datetime)


#Plot 3
with(plot3_data_subset, {
  plot(Sub_metering_1~Datetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=2, lwd=4, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Save to PNG File
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()