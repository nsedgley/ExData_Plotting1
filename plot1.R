data <- read.table("household_power_consumption.txt", header=TRUE, sep=";",na.strings="?")
data$DateTime <- paste(data$Date, data$Time, sep=" ")
data$DateTime <- strptime(data$DateTime, format = "%d/%m/%Y %H:%M:%S")
data <- data[(data$DateTime > as.POSIXct('2007-01-31 24:00:00') & data$DateTime < as.POSIXct('2007-02-03 00:00:00')), ]

#plot 1
png(filename = "plot1.png")
hist(data$Global_active_power, col="red",xlab="Global Active Power(kilowatts)",main="Global Active Power")
dev.off()

