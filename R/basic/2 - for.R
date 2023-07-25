seq(0, 1, length.out = 11)
seq(stats::rnorm(20)) # effectively 'along'
seq(1, 9, by = 2)     # matches 'end'
seq(1, 9, by = pi)    # stays below 'end'
seq(1, 6, by = 3)
seq(1.575, 5.125, by = 0.05)
seq(17) # same as 1:17, or even better seq_len(17)
seq()

seq_along(c("red", "blue", "89"))

input <- data.frame(year = 1996:2022, 
           catch = c(runif(13, min = 0, max = 5000), runif(14, min = 0, max = 2000)), 
           cond = c(rep("calido", 13), rep("frios", 14)))

input$cond <- as.factor(input$cond)
class(input)
str(input)

plot(input$year, input$catch , ylab = "Capturas anuales Sp X",type =  "h")
plot(input$year, input$catch , ylab = "Capturas anuales Sp X",type =  "b", 
     col = input$cond, pch = 16)

input$selectividad <- c(rep(1, 13), rep(0, 14))
str(input)

input$selectividad <- as.factor(input$selectividad)
str(input)

dim(input)
input$cond <- as.factor(c(rep("calido", 7), rep("frios", 10), rep("neutra", 10)))
str(input)
summary(input)

boxplot(catch ~ selectividad + cond, data = input)

# -------------------------------------------------------------------------
observaciones <- list(data = input, investigador = "Gersson", hora = 1:27)

# -------------------------------------------------------------------------

# for if else while break stop 

input$clasi <- NA

for(i in 1: 27){
  tmp <- input[i, ]
  input$clasi[i] <-  ifelse(tmp$catch > 50, "buen año", "mal año")
  print(i)
}


mat <- matrix(data = runif(50, min = 10, max = 50), nrow = 5, ncol = 10)
dimnames(mat) <- list(2010:2014, seq(10, 19, length.out = 10))

marks <- 10:19

plot(marks, mat[1, ], type = "l", lwd = 3, col = "darkgreen")


