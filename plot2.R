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

##Plot 2 
data$Times <- paste(data$Date, data$Time, sep = " ")
data$Times <-  as.POSIXct(strptime(data$Times, "%d/%m/%Y %H:%M:%S"))
with(data, plot(y = Global_active_power, x = Times, type ="l",
                ylab ="Global Active Power (kilowatts)", xlab =""))
png("plot2.png", width = 480, height = 480)
with(data, plot(y = Global_active_power, x = Times, type ="l",
                ylab ="Global Active Power (kilowatts)", xlab =""))
dev.off()

