# Plot 1

# Reading data into R and reformatting data:
setwd("~/Exploratory Data Analysis")
data1 <- read.table("./household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?") 

# Subsetting data into 1/2 and 2//2
dates1 <- subset(data1, Date == "1/2/2007")
dates2 <- subset(data1, Date == "2/2/2007")
dataSelect <- rbind(dates1, dates2)

# Plotting:
hist(dataSelect$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

# Creating PNG file by dev.copy:
dev.copy(png, file = "plot1.png")
dev.off()


