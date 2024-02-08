### Load databases ###

baseCatch <- read.table(file = "annualCatch.csv", header = T, sep = ",")

baseCaL <- read.table(file = "Anch_yearLength_sPeru_1962on.csv", header = T, sep = ",")

baseAc <- read.table(file = "indiceTB.csv", header = T, sep = ",")

baseU <- read.table(file = "CPUE.csv", header = T, sep = ",")


### Parameters

Years <- baseCatch$Year
nYears <- length(Years)

aWL <- 0.0046
bWL <- 3.1467


# Breakpoints (coming from external tests)

bkP <- c(1959, 1973, 1982, 1992, 2012, 2024)

Reg <- NULL

for(i in 1:(length(bkP)-1)){
  
  Period <- bkP[i]:(bkP[i+1]-1)
  Posi <- which(baseCatch$Year %in% Period)
  Catch <- baseCatch$Catch[Posi]/1e6
  mCatch <- mean(Catch)             
  repCatch <- rep(mCatch, length(Period))

  Reg <- c(Reg, repCatch)
    
}

baseCatch$Reg <- Reg


# Fake base

baseFake <- data.frame(Year = Years, Fake = rep(NA, nYears))
  


### Calculate and arrange length based indicators

names(baseCaL) <- c("Year", "Catch", seq(4,20,0.5))

minMark <- 4
maxMark <- 20
juvMark <- 11.5

posi_minMark <- which(names(baseCaL) == minMark)
posi_maxMark <- which(names(baseCaL) == maxMark)
posi_juvMark <- which(names(baseCaL) == juvMark)

Marks <- seq(minMark, maxMark, 0.5)

baseCaL$Mo <- rep(NA, nrow(baseCaL))
baseCaL$Min <- rep(NA, nrow(baseCaL))
baseCaL$Max <- rep(NA, nrow(baseCaL))
baseCaL$pJn <- rep(NA, nrow(baseCaL))
baseCaL$pJw <- rep(NA, nrow(baseCaL))

for (i in 1:length(baseCaL$Mo)){
  
  baseCaL$Mo[i] <-  ifelse(sum(baseCaL[i,posi_minMark:posi_maxMark]) == 0, NA, as.numeric(names(which.max(baseCaL[i,posi_minMark:posi_maxMark]))))
  baseCaL$Min[i] <- ifelse(sum(baseCaL[i,posi_minMark:posi_maxMark]) == 0, NA, Marks[which(baseCaL[i,posi_minMark:posi_maxMark] > 0)[1]])
  baseCaL$Max[i] <- ifelse(sum(baseCaL[i,posi_minMark:posi_maxMark]) == 0, NA, Marks[tail(which(baseCaL[i,posi_minMark:posi_maxMark] > 0),1)])
  
  baseCaL$pJn[i] <-  ifelse(sum(baseCaL[i,posi_minMark:posi_maxMark]) == 0, NA, (sum(baseCaL[i,posi_minMark:posi_juvMark]) / sum(baseCaL[i,posi_minMark:posi_maxMark]) *100))

  WaL <- (sum(aWL * (Marks ^ bWL) * baseCaL[i,posi_minMark:posi_juvMark]) / sum(aWL * (Marks ^ bWL) * baseCaL[i,posi_minMark:posi_maxMark])) * 100
  baseCaL$pJw[i] <- WaL 

  }

baseCaL <- merge(baseFake, baseCaL, by = "Year", all.x = T)



### Arrange acoustic base

maxAc <- rep(NA, length(unique(baseAc$Year)))
meanAc <- rep(NA, length(unique(baseAc$Year)))

for(i in 1:length(unique(baseAc$Year))){
  
  base_i <- baseAc[baseAc$Year == unique(baseAc$Year)[i],]
  maxAc[i] <- max(base_i$TB)
  meanAc[i] <- mean(base_i$TB)
  
}

baseAc2 <- data.frame(Year = unique(baseAc$Year), maxB = maxAc, meanB = meanAc)
baseAc2 <- merge(baseFake, baseAc2, by = "Year", all.x = T)



### Arrange cpue base

baseU <- merge(baseFake, baseU, by = "Year", all.x = T)





### Plot

png(filename = "indAnchSur.png", width = 1000, height = 1250, res = 125)

par(mfrow = c(5,1))
par(oma = c(0,4,0,0), mar = c(2,2,1,2))

plot(baseCatch$Year, baseCatch$Catch/1e6, xlab = "", ylab = "", xaxt = "n", type = "h", lwd = 5, ylim = c(0, 1.5))
lines(baseCatch$Year, baseCatch$Reg, lty = 2, col = "orangered")
axis(side = 1, at = Years, labels = F)
axis(side = 1, at = seq(min(Years)+1, max(Years), 5), labels = seq(min(Years)+1, max(Years), 5), cex.axis = 1.25)
mtext(text = "Desembarques \n (millones t)", side = 2, line = 2.5)
legend("topleft", legend = "a)", bty = "n", cex = 1.5)

plot(baseCaL$Year, baseCaL$Mo, xlab = "", ylab = "", xaxt = "n", type = "n", lwd = 5, ylim = c(4, 21))
arrows(x0 = baseCaL$Year, y0 = baseCaL$Min, x1 = baseCaL$Year, y1 = baseCaL$Max, length=0.05, angle=0, code=3, lwd = 2)
points(x = baseCaL$Year, y = baseCaL$Mo, lwd = 2, pch = 19, cex = 1.5)
axis(side = 1, at = Years, labels = F)
axis(side = 1, at = seq(min(Years)+1, max(Years), 5), labels = seq(min(Years)+1, max(Years), 5), cex.axis = 1.25)
mtext(text = "Longitud total (cm)", side = 2, line = 2.5) 
legend("topleft", legend = "b)", bty = "n", cex = 1.5)

plot(baseCaL$Year, baseCaL$pJw, xlab = "", ylab = "", xaxt = "n", type = "b", lwd = 2, ylim = c(0, 100), pch = 19, cex = 1.5)
lines(2015:2022, rep(25.5, 8), lty = 2, col = "orangered")
axis(side = 1, at = Years, labels = F)
axis(side = 1, at = seq(min(Years)+1, max(Years), 5), labels = seq(min(Years)+1, max(Years), 5), cex.axis = 1.25)
mtext(text = "Juveniles (%W)", side = 2, line = 2.5) 
legend("topleft", legend = "c)", bty = "n", cex = 1.5)

plot(baseAc2$Year, baseAc2$maxB/1e6, xlab = "", ylab = "", xaxt = "n", type = "h", lwd = 5, ylim = c(0, 3))
#plot(baseAc2$Year, baseAc2$meanB/1e6, xlab = "", ylab = "", xaxt = "n", type = "h", lwd = 5, ylim = c(0, 3))
axis(side = 1, at = Years, labels = F)
axis(side = 1, at = seq(min(Years)+1, max(Years), 5), labels = seq(min(Years)+1, max(Years), 5), cex.axis = 1.25)
mtext(text = "Biomasa acústica \n (millones t)", side = 2, line = 2.5) 
legend("topleft", legend = "d)", bty = "n", cex = 1.5)

plot(baseU$Year, baseU$uBeP, xlab = "", ylab = "", xaxt = "n", type = "b", lwd = 2, ylim = c(0, 0.04), pch = 19, cex = 1.5)
#lines(baseU$Year, baseU$uBeP, xlab = "", ylab = "", xaxt = "n", type = "b", lwd = 2, pch = 19, col = "orangered", cex = 1.5)
axis(side = 1, at = Years, labels = F)
axis(side = 1, at = seq(min(Years)+1, max(Years), 5), labels = seq(min(Years)+1, max(Years), 5), cex.axis = 1.25)
mtext(text = "CPUE", side = 2, line = 2.5)
legend("topleft", legend = "e)", bty = "n", cex = 1.5)
# legend("bottomright", legend = c("PBP", "BeP"), col = c(1,"orangered"), pch = c(19,19), lty = c(1,1), bty = "n")

dev.off()



baseOut <- data.frame(Year = Years, Catch = baseCatch$Catch,
                      Mode = baseCaL$Mo, minL = baseCaL$Min, maxL = baseCaL$Max,
                      pJn = baseCaL$pJn, pJw = baseCaL$pJw,
                      Ac = baseAc2$maxB,
                      CPUE = baseU$uBeP)

write.table(x = baseOut, file = "indAnchSur.csv", sep = ",", row.names = F, col.names = T)
