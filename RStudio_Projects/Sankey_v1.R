library(dplyr)
library(networkD3)
library(lubridate)
library(tidyr)


nodes <- data.frame(
  name = c(
    "Inventario",
    "[Cocina]",
    "[Electrodomésticos]",
    "[Cuidado Personal]",
    "[Detergentes]",
    "[Herramientas]",
    "Estancado",
    "Apropiado",
    "Insuficiente",
    "Detenido",
    "Demanda",
    "Irrelevante"
  )
)

nodes$grupo <- c(
  "Inventario",
  rep("Líneas", 5),
  nodes$name[7:12]
)


inventarios_categoria <- round(runif(5,100,10000),0)

enlaces_nivel3 <- data.frame(
  fuente = rep(0,5),
  objetivo = c(1:5),
  valor = inventarios_categoria,
  grupo_enlace = rep("Gris_Neutro",5)
)


rand_invent <- function(){
  random <- runif(6,0,1000)
  random/sum(random)
}


enlaces_nivel4 <- data.frame(
  fuente = rep(c(1:5),rep(6,5)),
  objetivo = rep(c(6:11),5),
  valor = round(rep(inventarios_categoria,rep(6,5))*rep(rand_invent(),5),0),
  grupo_enlace = c("Estancado", "Apropiado", "Insuficiente", 
                   "Detenido", "Demanda", "Irrelevante")
)


links <- bind_rows(enlaces_nivel3, enlaces_nivel4)


escala_colores <- JS('
d3.scaleOrdinal()
  .domain([
    "Inventario", 
    "Líneas", 
    "Gris_Neutro",
    "Apropiado", 
    "Insuficiente", 
    "Estancado", 
    "Demanda", 
    "Detenido", 
    "Irrelevante"
  ])
  .range([
    "#A6A6A6", // Color del nodo Inventario
    "#36454F", // Color de los nodos de Líneas
    "#A9A9A9", // Color para conexiones del Nivel 1 (Gris muy claro)
    "#2ECC71", // Apropiado -> Verde
    "#F1C40F", // Insuficiente -> Amarillo
    "#E74C3C", // Estancado -> Rojo
    "#9B59B6", // SIN Inventario CON Venta -> Morado
    "#E67E22", // CON Inventario SIN Venta -> Naranja
    "#524f4f"  // SIN Inventario SIN Venta -> Negro puro para resaltar
  ])
')



sankeyNetwork(
  Links = links,
  Nodes = nodes,
  Source = "fuente", 
  Target = "objetivo", 
  Value = "valor",   
  NodeID = "name",   
  NodeGroup = "grupo",         
  LinkGroup = "grupo_enlace",  
  fontSize = 11,
  nodeWidth = 30,
  colourScale = escala_colores, 
  sinksRight = TRUE            
)

