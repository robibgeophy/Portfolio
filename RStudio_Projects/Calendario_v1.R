library(calendR)

max_ventaDiaria <- 20 
colores<- colorRampPalette(c("grey80","springgreen3"))
secuencia<- colores(max_ventaDiaria+1) #se suma 1 para considerar el cero

valoresAnio <- round(runif(365,0,max_ventaDiaria),digits=0)


imp.dates<- as.character(valoresAnio)  

calendR(special.days = imp.dates,special.col = secuencia)

