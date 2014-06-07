p<-read.csv("household_power_consumption.txt",
  header=TRUE, sep=";", na.strings=c("?"))
pp<-p[p$Date=="1/2/2007" | p$Date=="2/2/2007",]
p$Date=as.Date(p$Date, format="%d/%m/%Y")
png(filename="plot1.png")
with(pp,hist(Global_active_power, breaks=12,col="red",
  main="Global Active Power",
  xlab="Global Active Power (kilowatts)"),ylim=1200)
dev.off()