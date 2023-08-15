rm(list=ls())
# -------------------------------------------------------------------------
r=0.65 #Cual es la relación en K y R
K=2400 #Cual de los dos parámetros depende del ambiente/ y cual de la especie 
# porque empieza desde 0, has poblaciones que empiezan desde otro numero ?
# -------------------------------------------------------------------------
n =100
p = 1
# -------------------------------------------------------------------------
# -------------------------------------------------------------------------
Knorm <- runif(n = 5, min = 1200, max = 2400)
Knorm <- Knorm[order(Knorm)]

Captura=300
Cbiom <- CG <- CBmsy.K <- ccaptura <-  NULL
for(k in seq_along(Knorm)){
  
  Biom=rep(0,1,n)
  G=rep(0,1,n)
  cap <- rep(0, 1, n)
  
  cap[1] = Captura
  Biom[1]=Knorm[k]  
  G[1]=r*Biom[1]*(1-Biom[1]/Knorm[k])
  Bmsy.K <- Knorm[k]*(1/(1+p))^(1/p)
  
  for (t in 2:n)
  {
    yy <- Biom[t-1] + G[t-1]
    if(yy <= Captura) cap[t] = yy else cap[t]= Captura
    Biom[t]=Biom[t-1] + G[t-1] - cap[t]
    if(Biom[t] < 0){Biom[t] = 0}
    G[t]=r*Biom[t]*(1-Biom[t]/Knorm[k])
    
  }
  
  Cbiom <- cbind(Cbiom, Biom)
  CG <- cbind(CG, G)
  CBmsy.K <- c(CBmsy.K, Bmsy.K)
  ccaptura <- cbind(ccaptura, cap)
  print(k)
}


# plot-------------------------------------------------------------------------
# RESOLVER
###
# -------------------------------------------------------------------------
dev.copy(png, filename = "1408-1.png",
         width = 1500, height = 2500, res = 300)
dev.off()

# -------------------------------------------------------------------------
rm(list=ls())
# -------------------------------------------------------------------------
r=0.65 
K=2400 
# -------------------------------------------------------------------------
n =20
p = 1
# -------------------------------------------------------------------------
Knorm <- rnorm(n = 1000, mean = K, sd = 200)
Knorm.D <- dnorm(Knorm, mean = K, sd = 200)
# dens <- density(Knorm)
# plot(dens)
par(mfrow = c(1, 1), mar = c(0,0,0,0), oma = c(3,3,3,2))
plot(1,1, type="n",xlab="Biomasa",ylab="Producción",col="gray30", 
     xlim = c(0,max(Knorm)), ylim = c(0, 650))

for(u in 1:length(Knorm)){
  B=seq(0,Knorm[u],n)
  Grow=r*B*(1-B/Knorm[u])  
  lines(B,Grow,type="l", lwd =2, col = adjustcolor("red", alpha.f = 0.01))
  
}

par(new = T)
plot(Knorm[order(Knorm)], Knorm.D[order(Knorm)], col = "blue", xlim = c(0,max(Knorm)), type = "l",
      yaxt = "n",  ylim = c(0, 1e-2), lwd = 3, xlab = "", ylab = "")

dev.copy(png, filename = "1408-2.png",
         width = 1500, height = 1000, res = 300)
dev.off()





