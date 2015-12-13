filename <- "./data/household_power_consumption.txt"
data <- read.table(filename,header = TRUE,sep = ";",colClasses = c("character", "character", rep("numeric",7)),na = '?')
dim(data)

## Subsetting the data
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data <- data[data$Date >= "2007-02-01" & data$Date <= "2007-02-02",]
dim(data)

## Converting dates
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

## Plot 2
plot(data$Global_active_power~data$Datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")
## Saving to file
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
