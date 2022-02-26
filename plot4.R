library(data.table)

power <- fread("household_power_consumption.txt", na.strings="?")
power <- power[(Date=="1/2/2007") | (Date=="2/2/2007")]
power$Global_active_power <- as.numeric(power$Global_active_power)
power$Datetime <- paste(power$Date, power$Time)
power$Datetime <- as.POSIXct(power$Datetime, format="%d/%m/%Y %T")


png(file="./plot4.png")
par(mfrow=c(2,2))
plot(power$Datetime, power$Global_active_power, type="l", xlab="", 
     ylab = "Global Active Power")
plot(power$Datetime, power$Voltage, type="l", xlab="datetime", 
     ylab = "Voltage")
plot(power$Datetime, power$Sub_metering_1, type="l", xlab="", ylab = "Energy sub metering")
lines(power$Sub_metering_2~power$Datetime, col="red")
lines(power$Sub_metering_3~power$Datetime, col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col=c("black", "red", "blue"), pch="———")
plot(power$Datetime, power$Voltage, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()
