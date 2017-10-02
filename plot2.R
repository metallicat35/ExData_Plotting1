#set working directory
setwd("~/Desktop/Coursera/Exploratory Data Analysis /Week 1")
plot2_data = read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F)
#Convert date 
plot2_data$Date <- as.Date(plot2_data$Date, format="%d/%m/%Y")

#Take subset of data to plot and convert dates
plot2_data_subset <- subset(plot2_data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02")) 

plot2_datetime <- paste(as.Date(plot2_data_subset$Date), plot2_data_subset$Time)
plot2_data_subset$Datetime <- as.POSIXct(plot2_datetime)


#Plot 2
plot(plot2_data_subset$Global_active_power~plot2_data_subset$Datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")
# Save to PNG File
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()