plot4 <- function(){
    
    ## Read in the data from the data set the separator is specified as ; and the
    ## NA values are defined as ?
    data<-read.table("household_power_consumption.txt",header=TRUE, sep=";", na.strings="?")
    
    ## Merge time and date together and convert to timestamp
    data$timestamp<-strptime(paste(data$Date,data$Time), format="%d/%m/%Y%H:%M:%S")

    
    ## Subset the data to chose only the two days of interest
    data <- subset(data, timestamp >= "2007-02-01 00:00:00" & timestamp <= "2007-02-02 23:59:00")
    

    ## Open the PNG device to write write the graph into
    png(filename = "plot4.png", width = 480, height = 480, units = "px")
    
    ## set up the plot window for 2x2 plots
    par(mfrow= c(2,2))
    
    ## Create the first plot, top left
    plot(data$timestamp,data$Global_active_power, "l", xlab = "", ylab="Global Active Power")
    
    ## Create the second plot on top right
    plot(data$timestamp,data$Voltage, "l", xlab = "datetime", ylab="Voltage")
    
    ## Create the third plot on bottom left
    plot(data$timestamp, data$Sub_metering_1, "l", col="black", xlab="", ylab="Energy sub metering")
    points(data$timestamp, data$Sub_metering_2, "l", col="red")
    points(data$timestamp, data$Sub_metering_3, "l", col="blue")
    
    ## Prepare the strings for the legend and colors
    leg<- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
    color<- c("black", "red", "blue")
    
    ## create legend
    legend("topright", legend = leg, lwd=2, col=color, bty = "n")
    
    ## Create 4th plot, bottom right
    plot(data$timestamp, data$Global_reactive_power, "l", xlab="datetime", ylab="Global_reactive_power")
    
    ## Close the device and return to standard device
    dev.off()

    
}


