# Plot 2

# Copy the source file over to your working directory
# Import the source file into a temp dataset
ds_full<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")

# Convert Date format into system format
ds_full<-transform(ds_full, Date = as.Date(Date,"%d/%m/%Y"))

# Extract data for the 2-day period
ds<-subset(ds_full,Date>="2007-02-01" & Date<="2007-02-02")

# Create a PNG file in your working directory (this will contain the plot image)
png(filename="plot2.png")

# Combine the date and time columns (using lubridate) & convert to calendar dates
dt<-paste(ds$Date,ds$Time)
dt<-as.POSIXct(dt)

# Create a line graph of Global Active Power by calendar date
plot(dt,ds$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")
dev.off()
