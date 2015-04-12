# Open file and create table

setwd("C:/Users/Ryan Brown/Desktop/Coursera/Data Science/Exploratory Data Analysis/Week 1/Assignment")
library(lubridate)
hpc <- read.table( file = "./Data/household_power_consumption.txt", sep = ";", header = TRUE)

#subset data for date range

hpcSub <- hpc[as.character(hpc$Date) == "1/2/2007" | as.character(hpc$Date) == "2/2/2007", ]

date  <- dmy_hms(paste(as.character(hpcSub$Date), as.character(hpcSub$Time), sep = " "))
power  <- as.numeric(levels(hpcSub$Global_active_power))[hpcSub$Global_active_power]

png("plot2.png", width = 480, height = 480)

plot(date, power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "" )


dev.off()
