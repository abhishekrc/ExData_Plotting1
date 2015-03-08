# Plot 3

# Copy the source file over to your working directory
# Import the source file into a temp dataset
ds_full<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")

# Convert Date format into system format
ds_full<-transform(ds_full, Date = as.Date(Date,"%d/%m/%Y"))

# Extract data for the 2-day period
ds<-subset(ds_full,Date>="2007-02-01" & Date<="2007-02-02")

# Create a PNG file in your working directory (this will contain the plot image)
png(filename="plot3.png")

# Combine the date and time columns (using lubridate) & convert to calendar dates
dt<-paste(ds$Date,ds$Time)
dt<-as.POSIXct(dt)

# Create a line graph of Energy sub-metering by calendar date
plot(dt, ds$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering",col="black")
lines(dt, ds$Sub_metering_2, col="red")
lines(dt, ds$Sub_metering_3, col="blue")

# Legend
# Create vectors for legend values, line types and colors
lvalue<-c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
ltype<-c(1,1,1)
lcolor<-c("black","red","blue")
# Add this legend to graph
legend(x="topright",legend=lvalue,lty=ltype,col=lcolor)

dev.off()
