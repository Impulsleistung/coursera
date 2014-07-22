#Operative Funktionen

# Datensatz laden
dat<-read.table(unz("rprog-data-quiz1_data.zip","hw1_data.csv"), sep = ",",header = TRUE,quote = "\"")

# --Prüfungsfragen
# - Wie viele Zeilen haben einen ungültigen Wert (Ozon)
good_dat<-dat[complete.cases(dat),]
dim(good_dat)

# - Mittelwert jeder Spalte
colMeans(x = dat, na.rm = TRUE)

# - Mittelwert eines Subset (Solar.R bei Ozon>31 && Temp>90)
dat_sub <- subset(x = good_dat, subset = good_dat$Oz>31 & good_dat$Te>90)
colMeans(x = dat_sub)
# - Maximalwert einer Spalte (Ozon im Monat Mai)
dat_sub <- subset(x = good_dat, subset = good_dat$Month==5)
max(dat_sub$Ozone)

