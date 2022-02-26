library(data.table)

power <- fread("household_power_consumption.txt")
power <- power[(Date=="1/2/2007") | (Date=="2/2/2007")]
power$Global_active_power <- as.numeric(power$Global_active_power)

png(file="./plot1.png")
hist(power$Global_active_power, col="red", main = "Global Active Power", 
     xlab="Global Active Power (kilowatts)")
dev.off()