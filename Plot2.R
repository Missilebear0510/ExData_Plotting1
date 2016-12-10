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


# ## Load data in 2007-02-01; 2007-02-02 if re-start the project
#   load("Dat.RData")

Act_Pow=dat0$Global_active_power
Act_Pow=as.numeric(as.character(Act_Pow))

date=as.character(dat0$Date)
tim=as.character(dat0$Time)
n=1:length(date)
for(i in n){
as=sprintf('%s %s',date[i], tim[i])
t[i]=strptime(as," %d/%m/%Y %H:%M:%S")
}

 png(filename="Plot2.png",width=480,height=480)
 plot(t,Act_Pow,ylab="Global Active Power (kilowatts)",
      xlab="",type="l",lty=1)
 dev.off()