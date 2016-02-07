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
# Create the plot3
with(needmyD, {
        plot(Date, Sub_metering_1, type = "l", ylab = "Energy Sub Metering",
             col = "black", xlab = "")
        lines(Date, Sub_metering_2, col = "red")
        lines(Date, Sub_metering_3, col = "blue")
        legend("topright", pch = "-", col = c("black", "red", "blue"), 
               legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
})
# Save the plot in PNG file
dev.copy(png, "plot3.png", width = 480, height = 480)
dev.off()