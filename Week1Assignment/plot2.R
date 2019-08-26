
library(lubridate)
# read in data for 01/02/2007 - 02/02/2007
data <- read.table(file = "household_power_consumption.txt", sep = ";", na.strings = "?", 
                   skip = 66637, nrow = 2880)

Sys.setenv(LANGUAGE="en")
Sys.setlocale("LC_TIME", "en_US.UTF-8")

# merge date and time into one column
data <- mutate(data, datetime = dmy_hms(paste(data$V1, data$V2)))

# plot time series of Global Active Power
plot(data$datetime,data$V3,"l", ylab = "Global Active Power (kilowatts)", xlab = "")

# save plot as png
dev.copy(png, "plot2.png", width = 480, height = 480)

# close file device
dev.off()