data <- read.table("household_power_consumption.txt", header=TRUE, sep=";",na.strings="?")
data$DateTime <- paste(data$Date, data$Time, sep=" ")
data$DateTime <- strptime(data$DateTime, format = "%d/%m/%Y %H:%M:%S")
data <- data[(data$DateTime > as.POSIXct('2007-01-31 24:00:00') & data$DateTime < as.POSIXct('2007-02-03 00:00:00')), ]

#plot 4
png(filename = "plot4.png")
par(mfcol=c(2,2))
plot(data$DateTime, data$Global_active_power, type="l",xlab="", ylab="Global Active Power(kilowatts)",cex.lab=1,cex.axis=1)
plot(data$DateTime, data$Sub_metering_1, type="l",xlab="", ylab="Energy sub metering")
points(data$DateTime, data$Sub_metering_2, type="l", col="red")
points(data$DateTime, data$Sub_metering_3, type="l", col="blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))
plot(data$DateTime, data$Voltage, type="l",xlab="datetime", ylab="Voltage",cex.lab=1,cex.axis=1)
plot(data$DateTime, data$Global_reactive_power, type="l",xlab="datetime", ylab="Global_reactive_power",cex.lab=1,cex.axis=1)
dev.off()