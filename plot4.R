## plot4.R
## Chirag Gandhi
## Change this to the correct working directory
workingDirectory <- c("C:\\Users\\Chirag\\chirag personal\\US\\coursera\\ExData")
outputDirectory <- c("C:\\Users\\Chirag\\chirag personal\\US\\coursera\\ExData\\ExData_Plotting1")

## DO NOT change below this
## set working directory
setwd(workingDirectory)

## Read the column names
setClass('myDate')
setAs("character","myDate", function(from) as.Date(from, format="%d/%m/%Y") )

powerTable <- read.table("household_power_consumption.txt", header=T, sep=";", na.strings="?", colClasses= c("myDate", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))

subsetPower <- subset(powerTable,(powerTable$Date == as.Date("2007/02/01") | powerTable$Date == as.Date("2007/02/02")))

subsetPower$timestamp <- as.POSIXct(paste(subsetPower$Date, subsetPower$Time), "%d/%m/%Y %H:%M:%S")

par (mfrow=c(2,2))

## plot on top left
plot(x=subsetPower$timestamp, y=subsetPower$Global_active_power, type="l", xlab=" ", ylab="Global Active Power (kilowatts)")

## plot on top right
plot(x=subsetPower$timestamp, y=subsetPower$Voltage, type="l", xlab="datetime", ylab="Voltage")

## plot on bottom left
colors <- c("black", "red", "blue")

plot(x=subsetPower$timestamp, y=subsetPower$Sub_metering_1, type="l", xlab=" ", ylab="Energy sub metering", col="black")
lines(x=subsetPower$timestamp, y=subsetPower$Sub_metering_2, col="red")
lines(x=subsetPower$timestamp, y=subsetPower$Sub_metering_3, col="blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col= colors)

## plot on bottom right
plot(x=subsetPower$timestamp, y=subsetPower$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")