# Read the Data
myD <- read.table("household_power_consumption.txt", header = TRUE, sep = ";",
                  na.strings = "?")
# names of Data:
# "Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage"               "Global_intensity"     
# "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"     

# Get the necessary data:
needmyD <- subset(myD, Date == "1/2/2007" | Date == "2/2/2007")
needmyD <- transform(needmyD, Date = paste(Date, Time))
needmyD$Date <- strptime(needmyD$Date, "%d/%m/%Y %H:%M:%S")
needmyD$Time <- NULL
##############################################################################
# Create the plot4
par(mfrow = c(2,2), mar = c(4, 4, 1, 1))

#topleft
plot(needmyD$Date, needmyD$Global_active_power,
     type = "l", ylab = "Global Active Power", xlab = "")
#topright
plot(needmyD$Date, needmyD$Voltage,
     type = "l", ylab = "Voltage", xlab = "datatime")
#bottomleft
plot(needmyD$Date, needmyD$Sub_metering_1,
     type = "l", ylab = "Energy Sub Metering", col = "black", xlab = "")
lines(needmyD$Date, needmyD$Sub_metering_2, col = "red")
lines(needmyD$Date, needmyD$Sub_metering_3, col = "blue")
legend("topright", col = c("black", "red", "blue"),
       lty = c(1,1,1), cex = 0.5, bty = "n",
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
#bottomright
plot(needmyD$Date, needmyD$Global_reactive_power,
     type = "l", ylab = "Global reactive power", xlab = "datatime")
# Save the plot in PNG file
dev.copy(png, "plot4.png", width = 480, height = 480)
dev.off()