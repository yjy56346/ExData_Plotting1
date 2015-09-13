#
# Exploratory Data Analysis - Project 1: Plot 3 - Y.J. Yoon
# Due - 13 Sep 2015
#

# Reading data

x <- read.csv2("household_power_consumption.txt", 
               header = TRUE, 
               sep = ";", 
               dec = ".", 
               na.strings = "?",
               #               nrows = 2100000,
               stringsAsFactors = FALSE)

x[[1]] <- as.POSIXlt(paste(x[[1]], x[[2]]), format = "%d/%m/%Y %H:%M:%S")

# Plotting data

par(mfrow = c(1,1), mar = c(4,5,2,1)) 

with(x, plot(Date, Sub_metering_1, 
             ylab = "Energy sub metering",
             xlab = NA,
             type = "l"))

with(x, points(Date, Sub_metering_2, col = "red", type = "l"))
with(x, points(Date, Sub_metering_3, col = "blue", type = "l"))
legend("topright", lwd = 1, col = c("black", "blue", "red"), 
       legend = c("Sub_metering_1", 
                  "Sub_metering_2",
                  "Sub_metering_3"))

# Writing data

dev.copy(png, file="plot3.png")
dev.off()
