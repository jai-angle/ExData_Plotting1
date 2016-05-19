## This is the first of the plot assignment.
## It plots the histogram based on Global Active Power data from the household_power_consumption.txt file.

filetoread <- "./ExData_Plotting1Data/household_power_consumption.txt"

##get all the data first
alldata <- read.table(filetoread, header = T, sep = ";", na.strings = "?", stringsAsFactors = FALSE)

##Get the subset of the data as per the requirement of the assignment
plotdata <- subset(alldata, Date ==  "1/2/2007" | Date == "2/2/2007")

plotvalues <- as.numeric(plotdata$Global_active_power)

#plotvalues
hist(plotvalues, xlab = "Global Active Power (killowatts)", col = "red", main = "Global Active Power")

## once happy with the plot; now put it in the file and close it.
dev.copy(png, file = "~/ExData_Plotting1/plot1.png", width = 480, height = 480)
dev.off()

