#
# Exploratory Data Analysis - Project 1: Plot 1 - Y.J. Yoon
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

par(mfrow = c(1,1), mar = c(5,4,2,1)) 

hist(x$Global_active_power, 
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)", 
     ylab = "Frequency", 
     col = "red")

# Writing data

dev.copy(png, file="plot1.png")
dev.off()

