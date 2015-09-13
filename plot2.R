##  Name: plot2.R
##  Purpose: plots an line chart of the "power consumption" for Feb 1 - Feb 2, 2007
##           The input data for this comes from 
##             "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
##
##  Output:  This will produce a file "plot2.png", a line chart of power consumption for Feb 1-2, 2007

## set the working directory and download the file, and unzip it.

  setwd("C:/users/gvsha/Documents/coursera/4Exp_DAnalysis")

  fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  download.file(fileUrl, destfile = "exdata_data_household_power_consumption.zip")
  dateDownloaded <- date()

  unzip("exdata_data_household_power_consumption.zip")

## Read the csv file, fields separated by ;
##   then split the file for the dates needed (Feb 1-2, 2007)
##   use "strptime" function to combine the date and time fields, this will the x value in the chart
##   extract the Global_active_power column, this will be the y value in the chart
##
##   set the "png" file to plot the graph instead of the screen
##   Plot a line chart between the x and y variables
##   close the device

  pwr_mstr <- read.csv("household_power_consumption.txt",header = TRUE,sep = ";",dec = ".", fill = TRUE, stringsAsFactors=FALSE)

  pwr1 <- pwr_mstr[pwr_mstr$Date %in% c("1/2/2007","2/2/2007") ,] 

  x <- strptime(paste(pwr1$Date, pwr1$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
  y <- as.numeric(pwr1$Global_active_power)

  png("plot2.png", width=480, height=480)
  plot(x,y, type="l", xlab="", ylab="Global Active Power (kilowatts)")
  dev.off()

# End of plot2.R
