# Plot1.R

# Reading data into R and reformatting data:
setwd("~/Documents/Computer-Data Science/4-Exploratory Data Analysis")
data1 <- read.table("./household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?") 
# arguments of read.table tell formatting information about the table.

# Subsetting data into 1/2 and 2//2
# dataSelect <- subset(data1, Date %in% c("1/2/2007","2/2/2007")) is a short & correct way for subsetting Dates
dates1 <- subset(data1, Date == "1/2/2007")
dates2 <- subset(data1, Date == "2/2/2007")
dataSelect <- rbind(dates1, dates2)

# Plotting:
hist(dataSelect$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

# Creating PNG file by dev.copy:
dev.copy(png, file = "plot1.png")
dev.off()


