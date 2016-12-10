cat("\014")
graphics.off()
# Generate data in certain dates:
# 2007-02-01; 2007-02-02

dat = read.table("data\\household_power_consumption.txt",sep=';',header=TRUE)
day=dat$Date
day=as.Date(day,"%d/%m/%Y")
n=(day== "2007-02-01" | day== "2007-02-02")
n=which(n)
dat0=dat[n,]
save(dat0,file="Dat.RData")


## Load data in 2007-02-01; 2007-02-02 if re-start the project
#  load("Dat.RData")

Act_Pow=dat0$Global_active_power
Act_Pow=as.numeric(as.character(Act_Pow))

png(filename="Plot1.png",width=480,height=480)
hist(Act_Pow,xlab="Global Active Power (kilowatts)",
     col="red",main="Global Active Power")
dev.off()