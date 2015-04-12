# Open file and create table

setwd("C:/Users/Ryan Brown/Desktop/Coursera/Data Science/Exploratory Data Analysis/Week 1/Assignment")

library(lubridate)

hpc <- read.table( file = "./Data/household_power_consumption.txt", sep = ";", header = TRUE)

#subset data for date range

hpcSub <- hpc[as.character(hpc$Date) == "1/2/2007" | as.character(hpc$Date) == "2/2/2007", ]

date  <- dmy_hms(paste(as.character(hpcSub$Date), as.character(hpcSub$Time), sep = " "))
Sub_metering_1  <- as.numeric(levels(hpcSub$Sub_metering_1))[hpcSub$Sub_metering_1]
Sub_metering_2  <- as.numeric(levels(hpcSub$Sub_metering_2))[hpcSub$Sub_metering_2]
Sub_metering_3  <- hpcSub$Sub_metering_3

png("plot3.png", width = 480, height = 480)

plot(x=date, y = Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering")
lines(date, Sub_metering_1)
lines(date, Sub_metering_2, col = "red")
lines(date, Sub_metering_3, col = "blue")
legend("topright", lty = c(1,1), col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))


dev.off()
