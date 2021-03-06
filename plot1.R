unzip("powerdata.zip")
data<- read.table("household_power_consumption.txt",sep=";",header=TRUE)
data$Date<-strptime(data$Date,"%d/%m/%Y")
data$DateTime <- as.POSIXct(paste(data$Date, data$Time), format="%Y-%m-%d %H:%M:%S")
data_new<-data[as.Date(data$Date) >= "2007-02-01" & as.Date(data$Date) < "2007-02-03" ,]
for (i in 3:9){
  data_new[,i]<-as.numeric(as.character(data_new[,i]))
}
png(filename = "plot1.png", width = 480, height = 480, units = "px", pointsize = 11.75, bg = "transparent")
hist(data_new$Global_active_power,main="Global Active Power",col="red", xlab="Global Active Power (kilowatts)")
dev.off()
