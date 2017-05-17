# Plot 4

# Reading data into R and reformatting data:
setwd("~/Documents/Computer-Data Science/4-Exploratory Data Analysis")
data1 <- read.table("./household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

# Subsetting data into 1/2/2007 and 2/2/2007
dataSelect <- subset(data1, Date %in% c("1/2/2007","2/2/2007"))

# convert Date character into Date class. why need this?
#dataSelect$Date <- as.Date(dataSelect$Date, format = "%d/%m/%Y")
date_time <- paste(as.Date(dataSelect$Date, format = "%d/%m/%Y"), dataSelect$Time)
dataSelect$Date_Time <- as.POSIXct(date_time)

# Plotting:
par(mfrow = c(2,2), mar = c(4,4,2,1), oma = c(0,0,2,0))
plot(dataSelect$Date_Time, dataSelect$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")
plot(dataSelect$Date_Time, dataSelect$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
with(dataSelect, {
    plot(Date_Time, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
    lines(Date_Time, Sub_metering_2, col = "red")
    lines(Date_Time, Sub_metering_3, col = "blue")
})
legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, bty = "n",
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
plot(dataSelect$Date_Time, dataSelect$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

# Creating PNG file by dev.copy:
dev.copy(png, file = "plot4.png")
dev.off()
