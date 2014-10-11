#plot1.R

if(!exists("DT_TARGET_SET")) {
  # Getting, cleaning and subsetting of the data is done here:
  source("AS01_Bench.R")
}

hist(DT_TARGET_SET$Global_active_power,
     col = "red",main = "Global Active Power",xlab = "Global Active Power (kilowatts)")
