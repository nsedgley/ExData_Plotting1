data <- read.table("household_power_consumption.txt", header=TRUE, sep=";",na.strings="?")
data$DateTime <- paste(data$Date, data$Time, sep=" ")
data$DateTime <- strptime(data$DateTime, format = "%d/%m/%Y %H:%M:%S")
data <- data[(data$DateTime > as.POSIXct('2007-01-31 24:00:00') & data$DateTime < as.POSIXct('2007-02-03 00:00:00')), ]

#plot 2
png(filename = "plot2.png")
plot(data$DateTime, data$Global_active_power, type="l",xlab="", ylab="Global Active Power(kilowatts)",cex.lab=1,cex.axis=1)
dev.off()