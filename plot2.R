#
# Exploratory Data Analysis - Project 1: Plot 2 - Y.J. Yoon
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

par(mfrow = c(1,1), mar = c(4,5,2,1)) 

plot(x$Date, x$Global_active_power, 
     ylab = "Global Active Power (kilowatts)",
     xlab = NA, type = "l")

# Writing data

dev.copy(png, file="plot2.png")
dev.off()

