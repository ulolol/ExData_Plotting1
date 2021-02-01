library("data.table")


powertable <- data.table::fread(input = "household_power_consumption.txt", na.strings="?")


powertable[, dateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]

powertable <- powertable[(dateTime >= "2007-02-05") & (dateTime < "2007-02-07")]

png("plot3.png", width=480, height=480)

plot(powertable[, dateTime], powertable[, Sub_metering_1], type="l", xlab="", ylab="Energy sub metering")
lines(powertable[, dateTime], powertable[, Sub_metering_2],col="red")
lines(powertable[, dateTime], powertable[, Sub_metering_3],col="blue")
legend("topright"
       , col=c("black","red","blue")
       , c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  ")
       ,lty=c(1,1), lwd=c(1,1))

dev.off()

