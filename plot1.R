#Read File
consumption <- read.table("household_power_consumption.txt", skip = 66636, nrow = 2880, sep = ";",col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), header = TRUE)
consumption$datetime <- strptime(paste(consumption$Date, consumption$Time), format="%d/%m/%Y %H:%M:%S") 



png(filename = "plot1.png",width = 480, height = 480, units = "px", pointsize = 12)
dev.cur()
hist(consumption$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()

