##PLOT NUMBER 4##

library(data.table)

#Setting the working directory
setwd("D:/Coursera/Data Science - John Hopkins/4. Exploratory Data Analysis/Week 1/exdata_data_household_power_consumption")

#Loading, formatting and subsetting Data 
powerdata <- data.table::fread(input = "household_power_consumption.txt", na.strings = "?")

#Adding another column with date and time
powerdata[, datentime := as.POSIXct(paste(Date,Time), format = "%d/%m/%Y %H:%M:%S")]
powerdata <- powerdata[(datentime >= "2007-02-01") & (datentime < "2007-02-03")]

#Making the plot
png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))

with(powerdata, plot(datentime, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power"))

with(powerdata, plot(datentime, Voltage, type = "l", xlab = "", ylab = "Voltage"))

with(powerdata, plot(datentime, Sub_metering_1, type = "l", xlab = "", ylab = "Energy Sub Metering"))
lines(powerdata[, datentime], powerdata[, Sub_metering_2], col = "red")
lines(powerdata[, datentime], powerdata[, Sub_metering_3], col = "blue")
legend("topright", col = c("Black", "Red", "Blue"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1,1))

with(powerdata, plot(datentime, Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power"))

dev.off()