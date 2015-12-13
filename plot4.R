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

attach(data)
## Plot 4
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
plot(Global_active_power~Datetime, type="l", 
     ylab="Global Active Power", xlab="")
plot(Voltage~Datetime, type="l", 
     ylab="Voltage", xlab="datetime")
plot(Sub_metering_1~Datetime, type="l", 
     ylab="Energy sub metering", xlab="")
lines(Sub_metering_2~Datetime,col='Red')
lines(Sub_metering_3~Datetime,col='Blue')
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=1,cex=0.5,pt.cex = 1, bty="n",
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
plot(Global_reactive_power~Datetime, type="l", 
     ylab="Global_reactive_power",xlab="datetime")

## Saving to file
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()
