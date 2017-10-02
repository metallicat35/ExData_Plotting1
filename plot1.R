#set working directory
setwd("~/Desktop/Coursera/Exploratory Data Analysis /Week 1")
plot1_data = read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F)
#Convert date 
plot1_data$Date <- as.Date(plot1_data$Date, format="%d/%m/%Y")

#Take subset of data to plot
plot1_data_subset <- subset(plot1_data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02")) 

#Plot 1
hist(plot1_data_subset$Global_active_power, main="Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency",col="red")
# Save to PNG File
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()

