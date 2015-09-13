##  Name: plot3.R
##  Purpose: plots an line chart of 3 variables for Feb 1 - Feb 2, 2007
##            "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"
##
##           The input data for this chart comes from 
##             "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
##
##  Output:  This will produce a file "plot3.png", a line chart for Feb 1-2, 2007, the 3 variables
##            "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"

## set the working directory and download the file, and unzip it.

   setwd("C:/users/gvsha/Documents/coursera/4Exp_DAnalysis")

   fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
   download.file(fileUrl, destfile = "exdata_data_household_power_consumption.zip")
   dateDownloaded <- date()

   unzip("exdata_data_household_power_consumption.zip")

## Read the csv file, fields separated by ;
##   then split the file for the dates needed (Feb 1-2, 2007)
##   use "strptime" function to combine the date and time fields, this will the x value in the chart
##   extract the 3 columns, "Sub_metering_1", "Sub_metering_2", "Sub_metering_3", 
##      these will be the 3 y variables in the chart
##
##   set the "png" file to plot the graph instead of the screen
##   Plot line charts between the x and y variables
##      Each line would be specified in a different color, and there is an appropriate legend for each line
##   close the device

   pwr_mstr <- read.csv("household_power_consumption.txt",header = TRUE,sep = ";",dec = ".", fill = TRUE, stringsAsFactors=FALSE)

   pwr1 <- pwr_mstr[pwr_mstr$Date %in% c("1/2/2007","2/2/2007") ,] 

   x <- strptime(paste(pwr1$Date, pwr1$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

   y1 <- as.numeric(pwr1$Sub_metering_1)
   y2 <- as.numeric(pwr1$Sub_metering_2)
   y3 <- as.numeric(pwr1$Sub_metering_3)

   png("plot3.png", width=480, height=480)
   plot(x, y1, type="l", xlab="", ylab="Energy sub metering")
   lines(x, y2, type="l", col="red")
   lines(x, y3, type="l", col="blue")
   legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd=2, col=c("black", "red", "blue"))
   dev.off()

# End of plot3.R
