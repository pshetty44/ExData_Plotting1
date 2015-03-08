## Load sqldf library. We will subset the data even before loading using sql
library(sqldf)
pwcons<-read.csv.sql("./exdata-data-household_power_consumption/household_power_consumption.txt",
                     sep=";",
                     sql = "select * from file where Date in ('1/2/2007' , '2/2/2007')",
                     eol = "\n")
closeAllConnections()


## Create a png file
png(file ="plot1.png",bg="transparent",width=480, height=480,units="px")

## Draw a histogram
hist(pwcons$Global_active_power,
     col="red",
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)"
     )
dev.off()