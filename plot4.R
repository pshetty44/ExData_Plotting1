## Load sqldf library. We will subset the data even before loading using sql
library(sqldf)
pwcons<-read.csv.sql("./exdata-data-household_power_consumption/household_power_consumption.txt",
                     sep=";",
                     sql = "select * from file where Date in ('1/2/2007' , '2/2/2007')",
                     eol = "\n")
closeAllConnections()


## Create a png file
png(file ="plot4.png",bg="transparent",width=480, height=480,units="px")

## Use par function to create 4 plots in the same page
par(mfrow=c(2,2)) 

## First plot
plot(strptime(paste(pwcons$Date,pwcons$Time),"%d/%m/%Y %H:%M:%S"),
     pwcons$Global_active_power,
     type="l",
     ylab="Global Active Power",
     xlab =""
)
## Second plot
plot(strptime(paste(pwcons$Date,pwcons$Time),"%d/%m/%Y %H:%M:%S"),
     pwcons$Voltage,
     type="l",
     ylab="Voltage",
     xlab ="datetime"
)
## Third plot
plot(strptime(paste(pwcons$Date,pwcons$Time),"%d/%m/%Y %H:%M:%S"),
     pwcons$Sub_metering_1,
     type="l",
     ylab="Energy sub metering",
     xlab =""
)

lines(strptime(paste(pwcons$Date,pwcons$Time),"%d/%m/%Y %H:%M:%S"),
      pwcons$Sub_metering_2,
      type="l",
      col="red")

lines(strptime(paste(pwcons$Date,pwcons$Time),"%d/%m/%Y %H:%M:%S"),
      pwcons$Sub_metering_3,
      type="l",
      col="blue")

legend("topright",
       legend= c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty=c(1,1,1),
       col=c("black","red","blue"),
       bty="n"
)

## Fourth plot
plot(strptime(paste(pwcons$Date,pwcons$Time),"%d/%m/%Y %H:%M:%S"),
     pwcons$Global_reactive_power,
     type="l",
     ylab="Global_reactive_power",
     xlab ="datetime"
)

dev.off()
