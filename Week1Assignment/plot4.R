
library(lubridate)
# read in data for 01/02/2007 - 02/02/2007
data <- read.table(file = "household_power_consumption.txt", sep = ";", na.strings = "?", 
                   skip = 66637, nrow = 2880)

Sys.setenv(LANGUAGE="en")
Sys.setlocale("LC_TIME", "en_US.UTF-8")

# merge date and time into one column
data <- mutate(data, datetime = dmy_hms(paste(data$V1, data$V2)))


# setup multiple plots
par(mfrow = c(2,2))

# plot 1 (time series of Global Active Power)
plot(data$datetime,data$V3,"l", ylab = "Global Active Power (kilowatts)", xlab = "")

# plot 2 (time series of voltage)
plot(data$datetime,data$V5,"l", ylab = "Voltage", xlab = "datetime")
        
# plot 3 (time series of sub metering 1-3)
plot(data$datetime, data$V7, "l", xlab = "", ylab = "Energy sub metering")
lines(data$datetime, data$V8, col = "red")
lines(data$datetime, data$V9, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"), lty = 1, text.width = 85000, bty = "n")

# plot 4 (time series of Global Reactive Power)
plot(data$datetime,data$V4, "l", xlab = "datetime", ylab = "Global Reactive Power")



# save plot as png
dev.copy(png, "plot4.png", width = 480, height = 480)

# close file device
dev.off()