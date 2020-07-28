#Load data.table package
library("data.table")
#Read data and store as PowerCon
PowerCon <- data.table::fread(input = "household_power_consumption.txt", na.strings="?")
#Make a POSIXct date capable of being filtered and graphed by time of day
PowerCon[, dateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]
#Filter Dates for 02/01/2007 and 02/02/2007
PowerCon <- PowerCon[(dateTime >= "2007-02-01") & (dateTime < "2007-02-03")]
#Create PNG file
png("plot4.png", width=480, height=480)
#Set up par()
par(mfrow=c(2,2))
#Plot1
plot(x = PowerCon[, dateTime], y = PowerCon[, Global_active_power], type="l", xlab="", ylab="Global Active Power (kilowatts)")
#Plot 2
plot(PowerCon[, dateTime],PowerCon[, Voltage], type="l", xlab="datetime", ylab="Voltage")
#Plot 3
plot(PowerCon[, dateTime], PowerCon[, Sub_metering_1], type="l", xlab="", ylab="Energy sub metering")
lines(PowerCon[, dateTime], PowerCon[, Sub_metering_2],col="red")
lines(PowerCon[, dateTime], PowerCon[, Sub_metering_3],col="blue")
legend("topright", col=c("black","red","blue"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lty=c(1,1), lwd=c(1,1))
#plot 4
plot(PowerCon[, dateTime], PowerCon[,Global_reactive_power], type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()