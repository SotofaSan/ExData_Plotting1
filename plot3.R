# read data from the file "household_power_consumption.txt"
# which should be downloaded and unzip to working directory from
# url = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

data <- read.table("household_power_consumption.txt",header=TRUE, sep=";", na.strings="?")

# subset the data from the dates 2007-02-01 and 2007-02-02
data2 <- data[as.character(data$Date) %in% c("1/2/2007", "2/2/2007"),]

# remove the full data
rm(data)

# combne date and time in DT
data2$DT <- paste(data2$Date, data2$Time)
# transfer DT into time format
data2$DT <- strptime(data2$DT, "%d/%m/%Y %H:%M:%S")

# open phg device, create "plot3.png"  with a width of 480 pixels and a height of 480 pixels
#in the working directory 
png("plot3.png", width=480, height=480, units="px")

# build the plot for Energy sub metering (3 variables) vs DateTime(DT)  with legend
with(data2, plot(DT, Sub_metering_1,xlab = "" ,ylab="Energy sub metering", type="l"))
with(data2, points(DT, Sub_metering_2, type = "l", col = "red"))
with(data2, points(DT, Sub_metering_3, type = "l", col = "blue"))
legend("topright", lty=1, lwd=2, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#close the png file device
dev.off()