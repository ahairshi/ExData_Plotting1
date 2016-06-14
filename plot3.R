png(filename = "plot3.png",width = 480, height = 480, units = "px", pointsize = 12)

dev.cur()

with(consumption, plot(datetime, Sub_metering_1, xlab ="", ylab = "Energy sub metering",type = "l"))
with(consumption, points(datetime, Sub_metering_2, col = "red", type = "l"))
with(consumption, points(datetime, Sub_metering_3, col = "blue", type = "l"))
legend("topright",  lty = 1, lwd = 2, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()
