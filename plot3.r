# Read in full dataset 
data <- read.csv("./data/household_power_consumption.txt", sep = ";", header = TRUE,
                 na.strings = "?", nrows = 2075259, check.names = F, stringsAsFactors = F, 
                 comment.char = "", quote = '\"')

# Keep observations for 2007-02-01 and 2007-02-02
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data <- subset(data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

# Create new variable combining date and time
datetime <- paste(as.Date(data$Date), data$Time)
data$datetime <- as.POSIXct(datetime)

# Plot 3: Multivariate line plot
plot(hpc_sub$dt, hpc_sub$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")

points(hpc_sub$dt, hpc_sub$Sub_metering_2, type = "l", col = "red")

points(hpc_sub$dt, hpc_sub$Sub_metering_3, type = "l", col = "blue")

legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Save as PNG file
dev.copy(png, file = "plot3.png", height = 480, width = 480)
dev.off()