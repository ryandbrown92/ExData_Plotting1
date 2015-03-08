# Open file and create table

setwd("C:/Users/Ryan Brown/Desktop/Coursera/Data Science/Exploratory Data Analysis/Week 1/Assignment")

hpc <- read.table( file = "./Data/household_power_consumption.txt", sep = ";", header = TRUE)

#convert date column values to date data type

hpc <- transform(hpc, Date = as.Date(Date, "%d/%m/%Y"))

#select date range

hpcSub <- subset(hpc, Date == as.Date("01/02/2007", "%d/%m/%Y") | Date == as.Date("02/02/2007", "%d/%m/%Y"))

png("plot1.png", width = 480, height = 480)
hist(as.numeric(as.character(hpcSub[[3]])), plot= True, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()
