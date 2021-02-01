library("data.table")



powertable <- data.table::fread(input = "household_power_consumption.txt", na.strings="?")



powertable[, dateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]


powertable <- powertable[(dateTime >= "2007-02-05") & (dateTime < "2007-02-07")]

png("plot2.png", width=480, height=480)


plot(x = powertable[, dateTime], y = powertable[, Global_active_power], type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.off()