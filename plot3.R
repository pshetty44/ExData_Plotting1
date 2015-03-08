## Load sqldf library. We will subset the data even before loading using sql
library(sqldf)
pwcons<-read.csv.sql("./exdata-data-household_power_consumption/household_power_consumption.txt",
                     sep=";",
                     sql = "select * from file where Date in ('1/2/2007' , '2/2/2007')",
                     eol = "\n")
closeAllConnections()


## Create a png file
png(file ="plot3.png",bg="transparent",width=480, height=480,units="px")

## Draw the first line graph
plot(strptime(paste(pwcons$Date,pwcons$Time),"%d/%m/%Y %H:%M:%S"),
     pwcons$Sub_metering_1,
     type="l",
     ylab="Energy sub metering",
     xlab =""
)

## Use lines function to draw the second graph
lines(strptime(paste(pwcons$Date,pwcons$Time),"%d/%m/%Y %H:%M:%S"),
      pwcons$Sub_metering_2,
      type="l",
      col="red")

## Use lines function to draw the third graph
lines(strptime(paste(pwcons$Date,pwcons$Time),"%d/%m/%Y %H:%M:%S"),
      pwcons$Sub_metering_3,
      type="l",
      col="blue")

## Create a legend
legend("topright",
       legend= c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty=c(1,1,1),
       col=c("black","red","blue")
       )

dev.off()

