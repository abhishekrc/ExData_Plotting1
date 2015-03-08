# Plot 4

# Copy the source file over to your working directory
# Import the source file into a temp dataset
ds_full<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")

# Convert Date format into system format
ds_full<-transform(ds_full, Date = as.Date(Date,"%d/%m/%Y"))

# Extract data for the 2-day period
ds<-subset(ds_full,Date>="2007-02-01" & Date<="2007-02-02")

# Create a PNG file in your working directory (this will contain the plot image)
png(filename="plot4.png")

# Combine the date and time columns (using lubridate) & convert to calendar dates
dt<-paste(ds$Date,ds$Time)
dt<-as.POSIXct(dt)

# Save in 2x2 matrix form
par(mfrow=c(2,2))

# Create all 4 charts

# 1 - Create a line graph of Global Active Power by calendar date
plot(dt,ds$Global_active_power,type="l",xlab="",ylab="Global Active Power")

# 2 - Create a line graph of Voltage by calendar date
plot(dt,ds$Voltage,type="l",xlab="datetime",ylab="Voltage")

# 3 - Create a line graph of Energy sub-metering by calendar date
plot(dt, ds$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering",col="black")
lines(dt, ds$Sub_metering_2, col="red")
lines(dt, ds$Sub_metering_3, col="blue")
# Create vectors for legend values, line types and colors
lvalue<-c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
ltype<-c(1,1,1)
lcolor<-c("black","red","blue")
# Add this legend to graph
legend(x="topright",legend=lvalue,lty=ltype,col=lcolor,bty="n")

# 4 - Create a line graph of Global reactive power by calendar date
plot(dt,ds$Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power")

dev.off()
