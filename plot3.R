# DEALING WITH THE DATA
# initial steps: to input all relative data
data <- read.csv("household_power_consumption.txt", sep = ";")

# initial steps: to change the lingual editing environment
Sys.setlocale("LC_ALL", "English")

# giving up useless ones
data <- data[(data$Date == "1/2/2007") | (data$Date =="2/2/2007"), ]

# making all data in right forms
data$Date <- as.Date(data$Date, "%d/%m/%Y")
data$Global_active_power <- as.numeric(as.character(data$Global_active_power))
data$Global_reactive_power <- as.numeric(as.character(data$Global_reactive_power))
data$Voltage <- as.numeric(as.character(data$Voltage))
data$Sub_metering_1 <- as.numeric(as.character(data$Sub_metering_1))
data$Sub_metering_2 <- as.numeric(as.character(data$Sub_metering_2))
data$Sub_metering_3 <- as.numeric(as.character(data$Sub_metering_3))

# dealing with the form of times
dat1 <- paste(data2$Date, as.character(data2$Time), sep = ",")
dat2 <- strptime(dat1, format = "%Y-%m-%d,%H:%M:%S")

# reuniting the final data list(be named "dat")
dat <- data.frame(Time = dat2, data[, 3:9])





# PLOT 3
# plotting the first line
plot(dat[, "Time"], dat[, "Sub_metering_1"], type = "l", lwd = 1, ylab = "Energy sub metering", xlab="")

# adding the other lines
lines(dat[, "Time"], dat[, "Sub_metering_2"], lwd = 1, col = "red")
lines(dat[, "Time"], dat[, "Sub_metering_3"], lwd = 1, col = "blue")

# adding the graphic tag
legend("topright", legend = c("Sub_meeting_1", "Sub_meeting_2", "Sub_meeting_3"), lty = 1, col = c("black", "red", "blue"), cex = 0.6)