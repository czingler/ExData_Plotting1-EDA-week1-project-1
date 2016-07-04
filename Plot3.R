## czingler 3.7.2016
## Plot3.R

## Data set Electric power consumption zip file downloaded, 
## and unzipped in working directory before scripts run
## check file in working directory using dir()

datafile <- "./household_power_consumption.txt"
data <- read.table(datafile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#viewdata head(subSetData)
#dimdata dim(subSetData)

datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
global_active_power <- as.numeric(subSetData$Global_active_power)

sub_metering_1 <- as.numeric(subSetData$Sub_metering_1)
sub_metering_2 <- as.numeric(subSetData$Sub_metering_2)
sub_metering_3 <- as.numeric(subSetData$Sub_metering_3)

png("plot3.png", width=480, height=480)
plot(datetime, sub_metering_1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, sub_metering_2, type="l", col="red")
lines(datetime, sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()

