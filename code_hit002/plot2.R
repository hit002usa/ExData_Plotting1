raw_household_data <- read.table("./data/household_power_consumption.txt", header = TRUE, 
                                  sep = ";", comment.char = "%", stringsAsFactors = FALSE, na.strings = "?")
raw_household_data$Date <- as.Date(raw_household_data$Date, format = "%d/%m/%Y")
twoday_data <- raw_household_data[raw_household_data$Date == "2007-02-01" | raw_household_data$Date == "2007-02-02", ]
twoday_data$Time <- strptime(paste(twoday_data$Date, twoday_data$Time), format = "%Y-%m-%d %H:%M:%S")
twoday_data1 <- na.omit(twoday_data)
png("plot2.png", width = 480, height = 480, units = "px")
plot(twoday_data$Time, twoday_data$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
