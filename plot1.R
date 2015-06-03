## plot1.R
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
setAs("character","myTime", function(from) as.POSIXlt(from, format="%T") )

powerTable <- read.table("household_power_consumption.txt", header=T, sep=";", na.strings="?", colClasses= c("myDate", "myTime", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))

hist(powerTable[powerTable$Date == as.Date("2007/02/01") | powerTable$Date == as.Date("2007/02/02"),"Global_active_power"], col = "red", border="black", xlab = "Global Active Power (kilowatts)", main="Global Active Power")

setwd(outputDirectory)
dev.copy (png, "plot1.png")
dev.off()

