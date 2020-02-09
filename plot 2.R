##PLOT NUMBER 2##

library(data.table)

#Setting the working directory
setwd("D:/Coursera/Data Science - John Hopkins/4. Exploratory Data Analysis/Week 1/exdata_data_household_power_consumption")

#Loading, formatting and subsetting Data 
powerdata <- data.table::fread(input = "household_power_consumption.txt", na.strings = "?")

#Adding another column with date and time
powerdata[, datentime := as.POSIXct(paste(Date,Time), format = "%d/%m/%Y %H:%M:%S")]
powerdata <- powerdata[(datentime >= "2007-02-01") & (datentime < "2007-02-03")]

#Making the plot
png("plot2.png", width=480, height=480)
with(powerdata, plot(x = datentime, y = Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)"))
dev.off()