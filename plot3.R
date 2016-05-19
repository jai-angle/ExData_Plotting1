## This is the third of the plot assignment.
## It plots the graph based on datetime vs submetering data from the household_power_consumption.txt file.

filetoread <- "./ExData_Plotting1Data/household_power_consumption.txt"

##get all the data first
alldata <- read.table(filetoread, header = T, sep = ";", na.strings = "?", stringsAsFactors = FALSE)

##Get the subset of the data as per the requirement of the assignment
plotdata <- subset(alldata, Date ==  "1/2/2007" | Date == "2/2/2007")

plotvalues <- as.numeric(plotdata$Global_active_power)

plotdatetime <- strptime(paste(plotdata$Date, plotdata$Time, sep = " "), format = "%d/%m/%Y %H:%M:%S" )
Sub_metering_1 <- as.numeric(plotdata$Sub_metering_1)
Sub_metering_2 <- as.numeric(plotdata$Sub_metering_2)
Sub_metering_3 <- as.numeric(plotdata$Sub_metering_3)

plot(plotdatetime, Sub_metering_1, type = "l", xlab = "", ylab = "Energy Submetering")
lines(plotdatetime, Sub_metering_2, type = "l", xlab = "", col = "red")
lines(plotdatetime, Sub_metering_3, type = "l", xlab = "", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1, lwd = 2)

## once happy with the plot; now put it in the file and close it.
dev.copy(png, file = "~/ExData_Plotting1/plot3.png", width = 480, height = 480)
dev.off()

