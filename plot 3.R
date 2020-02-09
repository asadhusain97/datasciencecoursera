##PLOT NUMBER 3##

library(data.table)

#Setting the working directory
setwd("D:/Coursera/Data Science - John Hopkins/4. Exploratory Data Analysis/Week 1/exdata_data_household_power_consumption")

#Loading, formatting and subsetting Data 
powerdata <- data.table::fread(input = "household_power_consumption.txt", na.strings = "?")

#Adding another column with date and time
powerdata[, datentime := as.POSIXct(paste(Date,Time), format = "%d/%m/%Y %H:%M:%S")]
powerdata <- powerdata[(datentime >= "2007-02-01") & (datentime < "2007-02-03")]

#Making the plot
png("plot3.png", width=480, height=480)
with(powerdata, plot(datentime, Sub_metering_1,type = "l", xlab = "", ylab = "Energy sub metering"))
lines(powerdata[, datentime], powerdata[, Sub_metering_2], col = "red")
lines(powerdata[, datentime], powerdata[, Sub_metering_3], col = "blue")
legend("topright", col = c("Black", "Red", "Blue"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1,1))
dev.off()