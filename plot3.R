data <- read.table("household_power_consumption.txt", header=TRUE, sep=";",na.strings="?")
data$DateTime <- paste(data$Date, data$Time, sep=" ")
data$DateTime <- strptime(data$DateTime, format = "%d/%m/%Y %H:%M:%S")
data <- data[(data$DateTime > as.POSIXct('2007-01-31 24:00:00') & data$DateTime < as.POSIXct('2007-02-03 00:00:00')), ]

#plot 3
png(filename = "plot3.png")
plot(data$DateTime, data$Sub_metering_1, type="l",xlab="", ylab="Energy sub metering")
points(data$DateTime, data$Sub_metering_2, type="l", col="red")
points(data$DateTime, data$Sub_metering_3, type="l", col="blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))
dev.off()