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

Vol=dat0$Voltage
Vol=as.numeric(as.character(Vol))

Rec_Pow=dat0$Global_reactive_power
Rec_Pow=as.numeric(as.character(Rec_Pow))

date=as.character(dat0$Date)
tim=as.character(dat0$Time)
n=1:length(date)
for(i in n){
as=sprintf('%s %s',date[i], tim[i])
t[i]=strptime(as," %d/%m/%Y %H:%M:%S")
}

 for(i in 1:3){
   a<-as.character(dat0[,6+i])
   b<-as.numeric(a)
   sub[,i]=b
 }

 
 png(filename="Plot4.png",width=480,height=480)
par(mfrow=c(2,2))

plot(t,Act_Pow,ylab="Global active power",xlab="",type="l",lty=1,col='black')
plot(t,Vol,ylab="Voltage",xlab="datetime",type="l",lty=1,col='black')


plot(t,sub[,1],ylab="Energy sub metering",
     xlab="",type="l",lty=1,col='black')
lines(t,sub[,2],type="l",lty=1,col='red')
lines(t,sub[,3],type="l",lty=1,col='blue')
legend("topright",c("Sub_metering_1",
                    "Sub_metering_2", "Sub_metering_3"),
       lty=1,col= c('black', 'red','blue'),bty='n')


plot(t,Rec_Pow,ylab="Global_rective_power",xlab="datetime",type="l",lty=1,col='black')

 dev.off()



