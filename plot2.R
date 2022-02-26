library(data.table)

power <- fread("household_power_consumption.txt", na.strings="?")
power <- power[(Date=="1/2/2007") | (Date=="2/2/2007")]
power$Global_active_power <- as.numeric(power$Global_active_power)
power$Datetime <- paste(power$Date, power$Time)
power$Datetime <- as.POSIXct(power$Datetime, format="%d/%m/%Y %T")


png(file="./plot2.png")
plot(power$Datetime, power$Global_active_power, type="l", xlab="", 
     ylab = "Global Active Power (kilowatts)")
dev.off()