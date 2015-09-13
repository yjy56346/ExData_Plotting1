#
# Exploratory Data Analysis - Project 1: Plot 4 - Y.J. Yoon
# Due - 13 Sep 2015
#

# Reading data - extracted the 2880 rows for 2007-2-1 => 2007-2-2
#                and used it to speed up read time from 2M+ rows!

x <- read.csv2("household_power_consumption.txt", 
               header = TRUE, 
               sep = ";", 
               dec = ".", 
               na.strings = "?",
               #               nrows = 2100000,
               stringsAsFactors = FALSE)

x[[1]] <- as.POSIXlt(paste(x[[1]], x[[2]]), format = "%d/%m/%Y %H:%M:%S")

# Plotting data

par(mfrow = c(2,2), mar = c(4,4,0.5,0)) 

with(x, {
    plot(Date, Global_active_power, 
         ylab = "Global Active Power",
         xlab = NA, type = "l")

    plot(Date, Voltage, 
     ylab = "Voltage",
     xlab = "datetime", type = "l")

    plot(Date, Sub_metering_1, 
             ylab = "Energy sub metering",
             xlab = NA,
             type = "l")

    with(x, points(Date, Sub_metering_2, col = "red", type = "l"))
    with(x, points(Date, Sub_metering_3, col = "blue", type = "l"))
    legend("topright", lwd = 1, col = c("black", "blue", "red"), 
           legend = c("Sub_metering_1", 
                      "Sub_metering_2",
                      "Sub_metering_3"), bty = "n") 

    plot(Date, Global_reactive_power, 
         ylab = "Global_reactive_power",
         xlab = "datetime", type = "l")
})
    
# Writing data

dev.copy(png, file="plot4.png")
dev.off()
