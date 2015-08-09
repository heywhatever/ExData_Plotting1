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





# PLOT 4
# dividing the plotting area into 4
par(mfrow = c(2, 2))

# plotting the 1st one (the topleft plot)
plot(dat[, "Time"], dat[, "Global_active_power"], type = "l", lwd = 1, ylab = "Global Active Power", xlab = "")

# plotting the 2nd one (the topright plot)
plot(dat[, "Time"], dat[, "Voltage"], type = "l", lwd = 1, ylab = "Voltage", xlab = "datetime")

# plotting the 3rd one (the bottomleft plot)
plot(dat[, "Time"], dat[, "Sub_metering_1"], type = "l", lwd = 1,  ylab = "Energy sub metering",xlab="")
lines(dat[, "Time"], dat[, "Sub_metering_2"], lwd = 1, col = "red")
lines(dat[, "Time"], dat[, "Sub_metering_3"], lwd = 1, col = "blue")
legend("topright", legend = c("Sub_meeting_1", "Sub_meeting_2", "Sub_meeting_3"), lty = 1, col = c("black", "red", "blue"), cex = 0.6, bty = "n")

# plotting the 4th one (the bottomright plot)
plot(dat[, "Time"], dat[, "Global_reactive_power"], type = "l", lwd = 1, ylab = "Global_reactive_power", xlab = "datetime")