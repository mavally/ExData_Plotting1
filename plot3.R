unzip("powerdata.zip")
data<- read.table("household_power_consumption.txt",sep=";",header=TRUE)
unzip("powerdata.zip")
data<- read.table("household_power_consumption.txt",sep=";",header=TRUE)
data$Date<-strptime(data$Date,"%d/%m/%Y")
data$DateTime <- as.POSIXct(paste(data$Date, data$Time), format="%Y-%m-%d %H:%M:%S")
data_new<-data[as.Date(data$Date) >= "2007-02-01" & as.Date(data$Date) < "2007-02-03" ,]
for (i in 3:9){
  data_new[,i]<-as.numeric(as.character(data_new[,i]))
}
png(filename = "plot3.png", width = 480, height = 480, pointsize=11.8, units = "px", bg = "transparent")
plot(data_new$DateTime, data_new$Sub_metering_1, type = "l", xlab = "", 
         ylab = "Energy sub metering", col="black")
lines(data_new$DateTime, data_new$Sub_metering_2, type = "l", col="red")
lines(data_new$DateTime, data_new$Sub_metering_3, type = "l", col="blue")
legend("topright", lty=1,col=c("black","red","blue"),
              legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()