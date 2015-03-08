## Load sqldf library. We will subset the data even before loading using sql
library(sqldf)
pwcons<-read.csv.sql("./exdata-data-household_power_consumption/household_power_consumption.txt",
                     sep=";",
                     sql = "select * from file where Date in ('1/2/2007' , '2/2/2007')",
                     eol = "\n")
closeAllConnections()


## Create a png file
png(file ="plot2.png",bg="transparent",width=480, height=480,units="px")

## Draw a line plot
plot(strptime(paste(pwcons$Date,pwcons$Time),"%d/%m/%Y %H:%M:%S"),
     pwcons$Global_active_power,
     type="l",
     ylab="Global Active Power (kilowatts)",
     xlab =""
)
dev.off()