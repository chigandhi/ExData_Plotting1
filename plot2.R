## plot2.R
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

setClass ('myTime')
setAs("character","myTime", function(from) as.POSIXlt(from, format="%H:%M:%S") )

powerTable <- read.table("household_power_consumption.txt", header=T, sep=";", na.strings="?", colClasses= c("myDate", "myTime", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))

#powerTable$timestamp <- as.POSIXct(paste(powerTable$Date, powerTable$Time), "%d/%m/%Y %H:%M:%S")

subsetPower <- subset(powerTable,(powerTable$Date == as.Date("2007/02/01") | powerTable$Date == as.Date("2007/02/02")))
#subsetPower <- rbind(subsetPower, powerTable[,(powerTable$Date == as.Date("2007/02/02"))])

plot(x=subsetPower$Time, y=subsetPower$Global_active_power, type="l")