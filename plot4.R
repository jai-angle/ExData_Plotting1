## This is the fourth of the plot assignment.
## It plots 4 graphs in the frame based on the  data from the household_power_consumption.txt file.

filetoread <- "./ExData_Plotting1Data/household_power_consumption.txt"

##get all the data first
alldata <- read.table(filetoread, header = T, sep = ";", na.strings = "?", stringsAsFactors = FALSE)

##Get the subset of the data as per the requirement of the assignment
plotdata <- subset(alldata, Date ==  "1/2/2007" | Date == "2/2/2007")

plotvalues <- as.numeric(plotdata$Global_active_power)

GlobalActivePower <- as.numeric(plotdata$Global_active_power)
GlobalReActivePower <- as.numeric(plotdata$Global_reactive_power)

plotdatetime <- strptime(paste(plotdata$Date, plotdata$Time, sep = " "), format = "%d/%m/%Y %H:%M:%S" )
Sub_metering_1 <- as.numeric(plotdata$Sub_metering_1)
Sub_metering_2 <- as.numeric(plotdata$Sub_metering_2)
Sub_metering_3 <- as.numeric(plotdata$Sub_metering_3)
voltage <- as.numeric(plotdata$Voltage)

##par(mfrow = c(2, 2))
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
plot(plotdatetime, GlobalActivePower, type = "l", xlab = "", ylab = "Global Active Power", cex = 0.2)
plot(plotdatetime, voltage, type = "l", xlab = "datetime", ylab = "Voltage")
plot(plotdatetime, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(plotdatetime, Sub_metering_2, type = "l", xlab = "", col = "red")
lines(plotdatetime, Sub_metering_3, type = "l", xlab = "", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd=2, col=c("black", "red", "blue"), bty="n")


plot(plotdatetime, GlobalReActivePower, type = "l", xlab = "datetime", ylab = "Global_reactive_power", cex = 0.2)

## once happy with the plot; now put it in the file and close it.
dev.copy(png, file = "~/ExData_Plotting1/plot4.png", width = 480, height = 480)
dev.off()

