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

# open phg device, create "plot4.png"  with a width of 480 pixels and a height of 480 pixels
#in the working directory 
png("plot4.png", width=480, height=480, units="px")

#set nnumber of rows and coloms 2x2
par(mfrow = c(2,2))

# build 4 plots
with(data2, {
  plot(DT, Global_active_power, xlab = "" ,ylab="Global Active Power", type="l")
  
  plot(DT, Voltage, xlab = "datetime" ,ylab="Voltage", type="l")
  
  plot(DT, Sub_metering_1,xlab = "" ,ylab="Energy sub metering", type="l")
  points(DT, Sub_metering_2, type = "l", col = "red")
  points(DT, Sub_metering_3, type = "l", col = "blue")
  legend("topright", lty=1, lwd=2, col = c("black", "red", "blue"), legend = c("Sub_metering_1"
                                            , "Sub_metering_2", "Sub_metering_3"), bty = "n")
  
  plot(DT, Global_reactive_power, xlab = "datetime" ,ylab="Global_reactive_power", type="l")
})
#close the png file device
dev.off()