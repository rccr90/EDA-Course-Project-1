##Download from Coursera link
temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp, method = "curl")
data <- read.table(unz(temp, "household_power_consumption.txt"))
unlink(temp)##import data

##If its in your working directory
household_power_consumption <- read.csv("~/Dropbox/Cousera/Exploratory Data/Course Project 1/household_power_consumption.txt", sep=";")
data <- read.csv("household_power_consumption.txt")

##Subset the two days
data <- subset(household_power_consumption, household_power_consumption$Date == "2/2/2007" | household_power_consumption$Date == "1/2/2007")

##Plot 4
##1 
par(mfrow = c(2,2))
with(data, plot(y = as.numeric(Global_active_power)/500,
                x = Times, type = "l",
                ylab="Global Active Power",
                xlab = ""))
##2
with(data, plot(y = as.numeric(as.character(data$Voltage)), x = Times,
                type ="l", xlab = "datetime",
                ylab = "Voltage"))

##3
plot(y = as.numeric(as.character(data$Sub_metering_1)), x = data$Times, type = "l", col = "black",
     yaxt="n", ylab = "Energy sub metering", ylim =c(-.1, 40))
axis(2, at = c(0,10,20,30))
lines(data$Times, as.numeric(as.character(data$Sub_metering_2)), col = "red", type = "l")
lines(data$Times, as.numeric(as.character(data$Sub_metering_3)), col = "blue", type = "l")
legend("topright", cex = 0.7,
       pch = 1, col = c("black","red", "blue"), bty = "n", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
##4
with(data, plot(y = as.numeric(as.character(Global_reactive_power)),
                x = Times, type = "l", ylab = "Global_reactive_power",
                xlab = "datetime"))


png("plot4.png", width = 480, height = 480)
##Plot 4
##1 
par(mfrow = c(2,2))
with(data, plot(y = as.numeric(Global_active_power)/500,
                x = Times, type = "l",
                ylab="Global Active Power",
                xlab = ""))
##2
with(data, plot(y = as.numeric(as.character(data$Voltage)), x = Times,
                type ="l", xlab = "datetime",
                ylab = "Voltage"))

##3
plot(y = as.numeric(as.character(data$Sub_metering_1)), x = data$Times, type = "l", col = "black",
     yaxt="n", ylab = "Energy sub metering", ylim =c(-.1, 40))
axis(2, at = c(0,10,20,30))
lines(data$Times, as.numeric(as.character(data$Sub_metering_2)), col = "red", type = "l")
lines(data$Times, as.numeric(as.character(data$Sub_metering_3)), col = "blue", type = "l")
legend("topright", cex = 0.7,
       pch = 1, col = c("black","red", "blue"), bty = "n", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
##4
with(data, plot(y = as.numeric(as.character(Global_reactive_power)),
                x = Times, type = "l", ylab = "Global_reactive_power",
                xlab = "datetime"))

dev.off()

