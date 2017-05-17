# Plot 3

# Reading data into R and reformatting data:
setwd("~/Exploratory Data Analysis")
data1 <- read.table("./household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

# Subsetting data into 1/2/2007 and 2/2/2007
dataSelect <- subset(data1, Date %in% c("1/2/2007","2/2/2007"))

# Converting Date character into Date class. 
date_time <- paste(as.Date(dataSelect$Date, format = "%d/%m/%Y"), dataSelect$Time)
dataSelect$Date_Time <- as.POSIXct(date_time)

# Plotting:
with(dataSelect, {
    plot(Date_Time, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
    lines(Date_Time, Sub_metering_2, col = "red")
    lines(Date_Time, Sub_metering_3, col = "blue")
})
legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2,
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

# Creating PNG file by dev.copy:
dev.copy(png, file = "plot3.png")
dev.off()

