plot2 <- function(){
    
    ## Read in the data from the data set the separator is specified as ; and the
    ## NA values are defined as ?
    data<-read.table("household_power_consumption.txt",header=TRUE, sep=";", na.strings="?")
    
    ## Merge time and date together and convert to timestamp
    data$timestamp<-strptime(paste(data$Date,data$Time), format="%d/%m/%Y%H:%M:%S")

    
    ## Subset the data to chose only the two days of interest
    data <- subset(data, timestamp >= "2007-02-01 00:00:00" & timestamp <= "2007-02-02 23:59:00")
    

    ## Open the PNG device to write write the graph into
    png(filename = "plot2.png", width = 480, height = 480, units = "px")
    
    ## Create the histogram with
    plot(data$timestamp,data$Global_active_power, "l", xlab = "", ylab="Global Active Power (kilowatts)")
    
    
    ## Close the device and return to standard device
    dev.off()
    


    
}


