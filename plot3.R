library(data.table)

power <- fread("household_power_consumption.txt", na.strings="?")
power <- power[(Date=="1/2/2007") | (Date=="2/2/2007")]
power$Global_active_power <- as.numeric(power$Global_active_power)
power$Datetime <- paste(power$Date, power$Time)
power$Datetime <- as.POSIXct(power$Datetime, format="%d/%m/%Y %T")


png(file="./plot3.png")
plot(power$Datetime, power$Sub_metering_1, type="l", xlab="", ylab = "Energy sub metering")
lines(power$Sub_metering_2~power$Datetime, col="red")
lines(power$Sub_metering_3~power$Datetime, col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col=c("black", "red", "blue"), pch="———")
dev.off()