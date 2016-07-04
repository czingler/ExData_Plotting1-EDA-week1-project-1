## czingler 3.7.2016
## Plot1.R

## Data set Electric power consumption zip file downloaded, 
## and unzipped in working directory before scripts run
## check file in working directory using dir()

datafile <- "./household_power_consumption.txt"
data <- read.table(datafile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#viewdata head(subSetData)
#dimdata dim(subSetData)

global_active_power <- as.numeric(subSetData$Global_active_power)
png("plot1.png", width=480, height=480)
hist(global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()