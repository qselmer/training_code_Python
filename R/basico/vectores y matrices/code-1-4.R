# Operaciones avanzadas con vectores usando el paquete 'dplyr' y 'tidyr'
library(dplyr)
library(tidyr)

# Crear un tibble con datos estructurados
datos_complejos <- tibble(
  id = rep(1:5, each = 3),
  variable = c(rep("A", 5), rep("B", 5), rep("C", 5)),
  valor = rnorm(15)
)

# Calcular resúmenes estadísticos para cada combinación de 'id' y 'variable'
resumen_estadistico <- datos_complejos %>%
  group_by(id, variable) %>%
  summarise(
    promedio = mean(valor),
    desviacion_estandar = sd(valor),
    maximo = max(valor)
  )

# Convertir datos de formato largo a formato ancho (pivotar)
datos_ancho <- datos_complejos %>%
  pivot_wider(names_from = variable, values_from = valor)

# Realizar operaciones avanzadas con matrices dispersas usando el paquete 'slam'
library(slam)

# Crear una matriz dispersa a partir de un tibble con tres columnas (fila, columna, valor)
matriz_dispersa_tibble <- tibble(
  fila = c(1, 2, 1, 3),
  columna = c(2, 3, 4, 2),
  valor = c(1, 2, 3, 4)
)

matriz_dispersa_slam <- as.simple_triplet_matrix(matriz_dispersa_tibble, nrow = 3, ncol = 4)

# Calcular el producto punto entre filas de una matriz dispersa
producto_punto_filas_disperso <- tcrossprod_simple_triplet_matrix(matriz_dispersa_slam)

# Calcular la matriz de similitud entre filas usando coseno
matriz_similitud <- sim2(matriz_dispersa_slam, method = "cosine")

