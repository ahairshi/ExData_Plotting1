#Read File
consumption <- read.table("household_power_consumption.txt", skip = 66636, nrow = 2880, sep = ";",col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), header = TRUE)
consumption$datetime <- strptime(paste(consumption$Date, consumption$Time), format="%d/%m/%Y %H:%M:%S") 

png(filename = "plot4.png",width = 480, height = 480, units = "px", pointsize = 12)
dev.cur()


par(mfrow = c(2,2), mar = c(4,4,2,1), oma = c(0,0,2,0))

with(consumption,plot(datetime, Global_active_power, type = "l", ylab = "Global Active Power", xlab = ""))
with(consumption,plot(datetime, Voltage, type = "l"))

with(consumption, plot(datetime, Sub_metering_1,xlab = "", ylab = "Energy sub metering",type = "l"))
with(consumption, points(datetime, Sub_metering_2, col = "red", type = "l"))
with(consumption, points(datetime, Sub_metering_3, col = "blue", type = "l"))
legend("topright",  lty = 1, lwd = 2,bty = "n", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

with(consumption,plot(datetime, Global_reactive_power, type = "l"))

dev.off()
