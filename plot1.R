library("data.table")

#Read data
powertable <- data.table::fread(input = "household_power_consumption.txt", na.strings="?")

# Convert Date Column to Date Type
powertable[, Date := lapply(.SD, as.Date, "%d/%m/%Y"), .SDcols = c("Date")]

# Select Dates from 2007-02-05 to 2007-02-07
powertable <- powertable[(Date >= "2007-02-05") & (Date <= "2007-02-07")]

#Initialize PNG

png("plot1.png", width=480, height=480)

#Plot Graph

hist(powertable[, Global_active_power], main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

#Shutdown device

dev.off()
