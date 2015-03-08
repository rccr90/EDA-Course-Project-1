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

##Plot 3 
plot(y = as.numeric(as.character(data$Sub_metering_1)), x = data$Times, type = "l", col = "black",
     yaxt="n", ylab = "Energy sub metering", ylim = c(-.1,40))
axis(2, at = c(0,10,20,30))
lines(data$Times, as.numeric(as.character(data$Sub_metering_2)), col = "red", type = "l")
lines(data$Times, data$Sub_metering_3, col = "blue", type = "l")
legend("topright", pch = 1, col = c("black","red", "blue"),legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

##Creat png file
png("plot3.png", width = 480, height = 480)

plot(y = as.numeric(as.character(data$Sub_metering_1)), x = data$Times, type = "l", col = "black",
     yaxt="n", ylab = "Energy sub metering", ylim = c(-.1,40))
axis(2, at = c(0,10,20,30))
lines(data$Times, as.numeric(as.character(data$Sub_metering_2)), col = "red", type = "l")
lines(data$Times, data$Sub_metering_3, col = "blue", type = "l")
legend("topright", pch = 1, col = c("black","red", "blue"),legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()
