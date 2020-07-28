#Load data.table package
library("data.table")
#Read Data and Store as PowerCon
PowerCon <- data.table::fread(input = "household_power_consumption.txt", na.strings="?")
#Make POSIXct date capable of being filtered and graphed by time of day
PowerCon[, dateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]
#Filter Dates to 02/01/2007 and 02/02/2007
PowerCon <- PowerCon[(dateTime >= "2007-02-01") & (dateTime < "2007-02-03")]
#Create PNG File
png("plot2.png", width=480, height=480)
#Create Plot 2
plot(x = PowerCon[, dateTime], y = PowerCon[, Global_active_power], type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()