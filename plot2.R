## This is the second of the plot assignment.
## It plots the graph based on datetine vs Global Active Power data from the household_power_consumption.txt file.

filetoread <- "./ExData_Plotting1Data/household_power_consumption.txt"

##get all the data first
alldata <- read.table(filetoread, header = T, sep = ";", na.strings = "?", stringsAsFactors = FALSE)

##Get the subset of the data as per the requirement of the assignment
plotdata <- subset(alldata, Date ==  "1/2/2007" | Date == "2/2/2007")

plotvalues <- as.numeric(plotdata$Global_active_power)

plotdatetime <- strptime(paste(plotdata$Date, plotdata$Time, sep = " "), format = "%d/%m/%Y %H:%M:%S" )

##now plot the graph as per the requirement
plot(plotdatetime, plotvalues, type = "l", xlab = "", ylab = "Global Active Power (killowatts)")

## once happy with the plot; now put it in the file and close it.
dev.copy(png, file = "~/ExData_Plotting1/plot2.png", width = 480, height = 480)
dev.off()

