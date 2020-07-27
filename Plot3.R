##Preparation
```{r}
#puliing the csv and naming the variables
household_power_consumption<- read.table("household_power_consumption.txt",skip=1,sep=";")
names(household_power_consumption) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
```

##Third  plot

```{r}
sub_power_consumption <- subset(household_power_consumption,household_power_consumption$Date=="1/2/2007" | household_power_consumption$Date =="2/2/2007")


#changing Date and Time variable
sub_power_consumption$Date <- as.Date(sub_power_consumption$Date, format="%d/%m/%Y")
sub_power_consumption$Time <- strptime(sub_power_consumption$Time, format="%H:%M:%S")
sub_power_consumption[1:1440,"Time"] <- format(sub_power_consumption[1:1440,"Time"],"2007-02-01 %H:%M:%S")
sub_power_consumption[1441:2880,"Time"] <- format(sub_power_consumption[1441:2880,"Time"],"2007-02-02 %H:%M:%S")


#making the plot and saving it to Plot3.png
plot(sub_power_consumption$Time,sub_power_consumption$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
with(sub_power_consumption,lines(Time,as.numeric(as.character(Sub_metering_1))))
with(sub_power_consumption,lines(Time,as.numeric(as.character(Sub_metering_2)),col="red"))
with(sub_power_consumption,lines(Time,as.numeric(as.character(Sub_metering_3)),col="blue"))
legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.copy(device = png, width = 480, height = 480, file = "Plot3.png")
```

#Plot3.png
```{r}
sub_power_consumption <- subset(household_power_consumption,household_power_consumption$Date=="1/2/2007" | household_power_consumption$Date =="2/2/2007")


#changing Date and Time variable
sub_power_consumption$Date <- as.Date(sub_power_consumption$Date, format="%d/%m/%Y")
sub_power_consumption$Time <- strptime(sub_power_consumption$Time, format="%H:%M:%S")
sub_power_consumption[1:1440,"Time"] <- format(sub_power_consumption[1:1440,"Time"],"2007-02-01 %H:%M:%S")
sub_power_consumption[1441:2880,"Time"] <- format(sub_power_consumption[1441:2880,"Time"],"2007-02-02 %H:%M:%S")


#making the plot and saving it to Plot3.png
plot(sub_power_consumption$Time,sub_power_consumption$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
with(sub_power_consumption,lines(Time,as.numeric(as.character(Sub_metering_1))))
with(sub_power_consumption,lines(Time,as.numeric(as.character(Sub_metering_2)),col="red"))
with(sub_power_consumption,lines(Time,as.numeric(as.character(Sub_metering_3)),col="blue"))
legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
```


