##Preparation
```{r}
#puliing the csv and naming the variables
household_power_consumption<- read.table("household_power_consumption.txt",skip=1,sep=";")
names(household_power_consumption) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
```

##First plot
```{r}
sub_power_consumption <- subset(household_power_consumption,household_power_consumption$Date=="1/2/2007" | household_power_consumption$Date =="2/2/2007")

#making the plot and saving it to Plot1.png
png("Plot1.png", width=480, height=480)
hist(as.numeric(as.character(sub_power_consumption$Global_active_power)),col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)")
dev.copy(device = png, width = 480, height = 480, file = "Plot1.png")
```

#Plot1.png
```{r}
hist(as.numeric(as.character(sub_power_consumption$Global_active_power)),col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)")
```


