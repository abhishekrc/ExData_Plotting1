# Plot 1

# Copy the source file over to your working directory
# Import the source file into a temp dataset
ds_full<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")

# Convert Date format into system format
ds_full<-transform(ds_full, Date = as.Date(Date,"%d/%m/%Y"))

# Extract data for the 2-day period
ds<-subset(ds_full,Date>="2007-02-01" & Date<="2007-02-02")

# Create a PNG file in your working directory (this will contain the plot image)
png(filename="plot1.png")

# Create the frequency diagram for Global Active Power
# Name axes and chart as shown in sample
hist(ds$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()
