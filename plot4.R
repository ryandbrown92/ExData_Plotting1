# Open file and create table

setwd("C:/Users/Ryan Brown/Desktop/Coursera/Data Science/Exploratory Data Analysis/Week 1/Assignment")

library(lubridate)

hpc <- read.table( file = "./Data/household_power_consumption.txt", sep = ";", header = TRUE)

#subset data for date range

hpcSub <- hpc[as.character(hpc$Date) == "1/2/2007" | as.character(hpc$Date) == "2/2/2007", ]

date  <- dmy_hms(paste(as.character(hpcSub$Date), as.character(hpcSub$Time), sep = " "))
power  <- as.numeric(levels(hpcSub$Global_active_power))[hpcSub$Global_active_power]
voltage  <- as.numeric(levels(hpcSub$Voltage))[hpcSub$Voltage]
Global_reactive_power  <- as.numeric(levels(hpcSub$Global_reactive_power))[hpcSub$Global_reactive_power]
Sub_metering_1  <- as.numeric(levels(hpcSub$Sub_metering_1))[hpcSub$Sub_metering_1]
Sub_metering_2  <- as.numeric(levels(hpcSub$Sub_metering_2))[hpcSub$Sub_metering_2]
Sub_metering_3  <- hpcSub$Sub_metering_3

png("plot4.png", width = 480, height = 480)

par(mfrow = c(2,2))

plot(date, power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "" )

plot(date, voltage, ylab = "Voltage", xlab = "datetime", type = "l")

plot(x=date, y = Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering")
lines(date, Sub_metering_1)
lines(date, Sub_metering_2, col = "red")
lines(date, Sub_metering_3, col = "blue")
legend("topright", lty = c(1,1), col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(date, Global_reactive_power, ylab = "Global_reactive_power", xlab = "datetime", type = "l", lwd = 0.5)

dev.off()
