# plot plot3 for Assignment I in Exploratorive Data Analysis

setwd("/Users/Marlen/Desktop/CourseraDataScience")
fileName <- "household_power_consumption.txt"
powerData <- read.csv(fileName, sep=";", na.strings = "?", header=TRUE)
powerData$Date <- as.Date(powerData$Date, format="%d/%m/%Y")
# merge Date and Time column
DateTime <- paste(powerData$Date, powerData$Time, sep="_")
DateTimeFormat <- strptime(DateTime, format = "%Y-%m-%d_%H:%M:%S")
# add newly created DateTime column to data frame
powerData$DateTime <- DateTimeFormat
# subset data frame for dates between 2007-02-01 and 2007-02-02
febData <- powerData[(powerData$Date=="2007-02-01" | powerData$Date=="2007-02-02"),]
#plotting
par(mfrow = c(2, 2), mar = c(4, 4, 2, 1), oma = c(0, 0, 0, 0))
with(febData, {
    plot(DateTime, Global_active_power, main = "", xlab = "", ylab = "Global Active Power", type="l")
    plot(DateTime, Voltage, main = "", xlab = "datetime", ylab = "Voltage", type="l")
    plot(x=febData$DateTime, y=febData$Sub_metering_1,
         xlab = "", ylab = "Energy Submetering", main = "", type = "l")
    lines(x=febData$DateTime, y=febData$Sub_metering_2, col="red")
    lines(x=febData$DateTime, y=febData$Sub_metering_3, col="blue")
    legend("topright",c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
           lty=1,col = c("black", "red", "blue"))
    plot(DateTime, Global_reactive_power, main = "", xlab = "datetime", ylab = "Global_reactive_power", type="l")
})
dev.print(png, file = "plot4.png", width = 480, height = 480)
dev.off()
