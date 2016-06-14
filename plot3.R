#Read File
consumption <- read.table("household_power_consumption.txt", skip = 66636, nrow = 2880, sep = ";",col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), header = TRUE)
consumption$datetime <- strptime(paste(consumption$Date, consumption$Time), format="%d/%m/%Y %H:%M:%S") 

png(filename = "plot3.png",width = 480, height = 480, units = "px", pointsize = 12)

dev.cur()

with(consumption, plot(datetime, Sub_metering_1, xlab ="", ylab = "Energy sub metering",type = "l"))
with(consumption, points(datetime, Sub_metering_2, col = "red", type = "l"))
with(consumption, points(datetime, Sub_metering_3, col = "blue", type = "l"))
legend("topright",  lty = 1, lwd = 2, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()
