p<-read.csv("household_power_consumption.txt",
  header=TRUE, sep=";", na.strings=c("?"))
pp<-p[p$Date=="1/2/2007" | p$Date=="2/2/2007",]
pp$Date=as.Date(pp$Date, format="%d/%m/%Y")
pp$DoW=format(pp$Date, format="%a")
pp$datetime<-strptime(paste(pp$Date, pp$Time),
  "%Y-%m-%d %H:%M:%S")
png(filename="plot3.png")
with(pp, {
  plot(datetime, Sub_metering_1, col="black",
    type="l", xlab="", ylab="Energy sub metering")
  lines(datetime, Sub_metering_2, col="red")
  lines(datetime, Sub_metering_3, col="blue")
})
legend("topright", legend=c("Sub_metering_1",
  "Sub_metering_2", "Sub_metering_3"),
  lty="solid", col=c("black", "red", "blue"))
dev.off()