##  Name: plot4.R
##  Purpose: plots 4 charts on one page, each for Feb 1 - Feb 2, 2007 timeframe
##            1. Global_Active_Power consumption
##            2. Voltage reading
##            3. Energy Sub Metering (Sub_metering_1 - 3)
##            4. Global Reactive Power readings
##
##           The input data for this chart comes from 
##             "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
##
##  Output:  This will produce a file "plot4.png" with all the 4 charts mentioned above. 

## set the working directory and download the file, and unzip it.

   setwd("C:/users/gvsha/Documents/coursera/4Exp_DAnalysis")

   fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
   download.file(fileUrl, destfile = "exdata_data_household_power_consumption.zip")
   dateDownloaded <- date()

   unzip("exdata_data_household_power_consumption.zip")

## Read the csv file, fields separated by ;
##   then split the file for the dates needed (Feb 1-2, 2007)
##   use "strptime" function to combine the date and time fields, this will the x value for all charts

   pwr_mstr <- read.csv("household_power_consumption.txt",header = TRUE,sep = ";",dec = ".", fill = TRUE, stringsAsFactors=FALSE)

   pwr1 <- pwr_mstr[pwr_mstr$Date %in% c("1/2/2007","2/2/2007") ,] 

   x <- strptime(paste(pwr1$Date, pwr1$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

## set the "png" file to plot the graph instead of the screen
##   Specify the Grid to plot the 4 charts in one page
##      The "mfrow" argument will draw the charts in this order
##          1. Row1 / Col1
##          2. Row1 / Col2 
##          3. Row2 / Col1
##          4. Row2 / Col2 

   png("plot4.png", width=480, height=480)
   par(mfrow = c(2, 2))

##  Chart 1: Global Active Power consumption
##     extract the Global_active_power column, the y variable in this chart

   y11 <- as.numeric(pwr1$Global_active_power)
   plot(x, y11, type="l", xlab="", ylab="Global Active Power")

##  Chart 2: Voltage reading
##     extract the Voltage column, the y variable in this chart

   y21 <- as.numeric(pwr1$Voltage)
   plot(x, y21, type="l", xlab="datetime", ylab="Voltage")

##  Chart 3: Energy sub metering
##     extract the 3 columns, "Sub_metering_1", "Sub_metering_2", "Sub_metering_3", 
##     these will be the 3 y variables in this chart

   y31 <- as.numeric(pwr1$Sub_metering_1)
   y32 <- as.numeric(pwr1$Sub_metering_2)
   y33 <- as.numeric(pwr1$Sub_metering_3)

   plot(x, y31, type="l", xlab="", ylab="Energy sub metering")
   lines(x, y32, type="l", col="red")
   lines(x, y33, type="l", col="blue")
   legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty="n", lwd=2, col=c("black", "red", "blue"))

##  Chart 4: Global Reactive Power consumption
##     extract the Global_reactive_power column, the y variable in this chart

   y11 <- as.numeric(pwr1$Global_reactive_power)
   plot(x, y11, type="l", xlab="datetime", ylab="Global_rective_power")

  dev.off()

# End of plot4.R
