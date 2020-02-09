##PLOT NUMBER 1##

library(data.table)

#Setting the working directory
setwd("D:/Coursera/Data Science - John Hopkins/4. Exploratory Data Analysis/Week 1/exdata_data_household_power_consumption")

#Loading, formatting and subsetting Data 
powerdata <- data.table::fread(input = "household_power_consumption.txt", na.strings = "?")
powerdata[, Date := lapply(.SD, as.Date, "%d/%m/%Y"), .SDcol = c("Date")]
powerdata <- powerdata[(Date >= "2007-02-01") & (Date <= "2007-02-02")]

#Making the plot
png("Plot1.png", width = 480, height = 480)
with(powerdata, hist(Global_active_power, xlab = "Global Active Power (kilowatts)", col = "red", main = "Global Active Power"))
dev.off()
