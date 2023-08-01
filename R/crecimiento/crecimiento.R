getwd()
dir()
dir.create("inputs"); dir.create("outputs")

tallas <- seq(10, by = 2, length.out = 10)

tl <- NULL
for(y in 1:10){
# y = 1
y1 <- rnorm(n = 1000, mean = tallas[y], sd = runif(1, min = 0.5, max = 1))
y1 <- as.vector(table(cut(y1, breaks = seq(5,30, 0.5))))
tl <- rbind(tl, y1)
print(tallas[y])
}

seq(5,30, 0.5)
dimnames(tl) <- list(2001:2010, seq(5,29.5, 0.5))

windows()
par(mfrow = c(10, 1), mar = c(0,0,0,0))
for(y in 1:10){
plot(seq(5,29.5, 0.5), tl[y, ], type = "l", lwd = 2)
}

df <- as.data.frame.matrix(tl)
class(df); class(tl)

write.table(x = df, file = "inputs/data_cohorte.csv", sep = ",", row.names = T)
data <- read.csv(file = "inputs/data_cohorte.csv")

i <- 1
while (i <= 10) {
  if (i == 5) {
    cat("Número especial: ", i, "\n")
  } else {
    print(i)
  }
  i <- i + 1
}


