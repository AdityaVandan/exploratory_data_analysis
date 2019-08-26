
# read in data for 01/02/2007 - 02/02/2007
data <- read.table(file = "household_power_consumption.txt", sep = ";", na.strings = "?", 
                   skip = 66637, nrow = 2880)

# plot Global Active Power as histogram
hist(data$V3, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

# save plot as png
dev.copy(png, "plot1.png", width = 480, height = 480)

# close file device
dev.off()