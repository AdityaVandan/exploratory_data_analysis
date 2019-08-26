
library(lubridate)
# read in data for 01/02/2007 - 02/02/2007
data <- read.table(file = "household_power_consumption.txt", sep = ";", na.strings = "?", 
                   skip = 66637, nrow = 2880)

Sys.setenv(LANGUAGE="en")
Sys.setlocale("LC_TIME", "en_US.UTF-8")

# merge date and time into one column
data <- mutate(data, datetime = dmy_hms(paste(data$V1, data$V2)))

# plot times series of sub metering 1-3
plot(data$datetime, data$V7, "l", xlab = "", ylab = "Energy sub metering")
lines(data$datetime, data$V8, col = "red")
lines(data$datetime, data$V9, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1, text.width = 45000)

# save plot as png
dev.copy(png, "plot3.png", width = 480, height = 480)

# close file device
dev.off()