#plot2.R

if(!exists("DT_TARGET_SET")) {
  # Getting, cleaning and subsetting of the data is done here:
  source("AS01_Bench.R")
}

with(DT_TARGET_SET, 
     plot(POSIX_DATE,Global_active_power,
          type="l",ylab="Global Active Power (kilowatts)",xlab="")
     )
