# read data from the file "household_power_consumption.txt"
# which should be downloaded and unzip to working directory from
# url = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

data <- read.table("household_power_consumption.txt",header=TRUE, sep=";", na.strings="?" )

# subset the data from the dates 2007-02-01 and 2007-02-02

data2 <- data[as.character(data$Date) %in% c("1/2/2007", "2/2/2007"),]

# remove the full data

rm(data)

# open phg device, create "plot1.png"  with a width of 480 pixels and a height of 480 pixels
#in the working directory 

png("plot1.png", width=480, height=480, units="px")

# build the histogramm for Global Active power
hist(as.numeric(as.character(data2$Global_active_power)), col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

#close the png file device
dev.off()
