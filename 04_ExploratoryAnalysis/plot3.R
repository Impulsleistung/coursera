#plot3.R

if(!exists("DT_TARGET_SET")) {
  # Getting, cleaning and subsetting of the data is done here:
  source("AS01_Bench.R")
}

with(DT_TARGET_SET, 
     plot(POSIX_DATE,Sub_metering_1,
          type="l",ylab="Energy sub metering",xlab="")
)
with(DT_TARGET_SET, 
     lines(POSIX_DATE,Sub_metering_2,
          type="l",ylab="",xlab="",col="red")
)
with(DT_TARGET_SET, 
     lines(POSIX_DATE,Sub_metering_3,
           type="l",ylab="",xlab="",col="blue")
)
legend("topright",
       col=c("black","red","blue"),
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty=1, lwd=2.5 )
