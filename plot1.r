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

# Plot 1: Histogram of Global Active Power
hist(hpc_sub$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", main = "Global Active Power", breaks = 13, ylim = c(0,1200))

# Save as PNG file
dev.copy(png, file = "plot1.png", height = 480, width = 480)
dev.off()