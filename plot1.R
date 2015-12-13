filename <- "./data/household_power_consumption.txt"
data <- read.table(filename,header = TRUE,sep = ";",colClasses = c("character", "character", rep("numeric",7)),na = '?')
dim(data)

## Subsetting the data
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data <- data[data$Date >= "2007-02-01" & data$Date <= "2007-02-02",]
dim(data)

## Plot 1
hist(data$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
## Saving to file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
