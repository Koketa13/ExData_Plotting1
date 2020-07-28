#Load data.table package
library("data.table")
#Read Data and Store as Variable PowerCon
PowerCon <- data.table::fread(input = "household_power_consumption.txt", na.strings="?")
#Change Date Column to Date Type
PowerCon[, Date := lapply(.SD, as.Date, "%d/%m/%Y"), .SDcols = c("Date")]
#Filter to Desired Dates 02/01/2007 - 02/02/2007
PowerCon <- PowerCon[(Date >= "2007-02-01") & (Date <= "2007-02-02")]
#Create PNG File
png("plot1.png", width=480, height=480)
#Create Plot 1
hist(PowerCon[, Global_active_power], main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
dev.off()