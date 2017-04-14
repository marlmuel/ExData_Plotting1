# plot plot2 for Assignment I in Exploratorive Data Analysis

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
# plotting
plot(x=febData$DateTime, y=febData$Global_active_power, 
     xlab = "", ylab = "Global Active Power (kilowatts)", main = "", type="l")
dev.print(png, file = "plot2.png", width = 480, height = 480)
dev.off()
