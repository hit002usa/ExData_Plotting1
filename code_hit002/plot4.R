raw_household_data <- read.table("./data/household_power_consumption.txt", header = TRUE, 
                                  sep = ";", comment.char = "%", stringsAsFactors = FALSE, na.strings = "?")
raw_household_data$Date <- as.Date(raw_household_data$Date, format = "%d/%m/%Y")
twoday_data <- raw_household_data[raw_household_data$Date == "2007-02-01" | raw_household_data$Date == "2007-02-02", ]
twoday_data$Time <- strptime(paste(twoday_data$Date, twoday_data$Time), format = "%Y-%m-%d %H:%M:%S")
twoday_data1 <- na.omit(twoday_data)
png("plot4.png", width = 480, height = 480, units = "px")
par(mfrow = c(2, 2), mar = c(4, 4, 2 ,1))
plot(twoday_data$Time, twoday_data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")
plot(twoday_data$Time, twoday_data$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
plot(twoday_data$Time, twoday_data$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(twoday_data$Time, twoday_data$Sub_metering_2, type = "l", col = "red")
lines(twoday_data$Time, twoday_data$Sub_metering_3, type = "l", col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty = c(1, 1, 1), lwd = c(2.5, 2.5, 2.5), col = c("black", "red", "blue"))
plot(twoday_data$Time, twoday_data$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
dev.off()
