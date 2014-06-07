p<-read.csv("household_power_consumption.txt",
  header=TRUE, sep=";", na.strings=c("?"))
pp<-p[p$Date=="1/2/2007" | p$Date=="2/2/2007",]
pp$Date=as.Date(pp$Date, format="%d/%m/%Y")
pp$datetime<-strptime(paste(pp$Date, pp$Time),
  "%Y-%m-%d %H:%M:%S")
png(filename="plot2.png")
with(pp, plot(datetime, Global_active_power,
  type="l", ylab="Global Active Power (kilowatts)",
  xlab="", main=""))
dev.off()