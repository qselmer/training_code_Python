rm(list = ls()); gc(reset = T)
# -------------------------------------------------------------------------
# Crear vectores y matrices
vector_numerico <- 1:5
vector_caracteres <- c("red", "green", "blue")
matriz <- matrix(1:12, nrow = 3, ncol = 4)

# Acceder a elementos de un vector o matriz mediante índices lógicos
indices <- c(TRUE, FALSE, TRUE, FALSE, TRUE)
elementos_seleccionados <- vector_numerico[indices]

filas_seleccionadas <- matriz[c(FALSE, FALSE, TRUE), 
  c(TRUE, FALSE, FALSE, FALSE)]  

# Seleccionar filas 1 y 3

# Operaciones con vectores y matrices
suma_acumulada <- cumsum(vector_numerico)  # Suma acumulada
producto_acumulado <- cumprod(vector_numerico)  # Producto acumulado

# Usando la función "apply" para aplicar una función a filas o columnas de una matriz

suma_filas <- apply(matriz, 1, sum)  # Suma de elementos por filas
producto_columnas <- apply(matriz, 2, prod)  # Producto de elementos por columnas

# Ordenar un vector o una matriz
vector_ordenado <- sort(vector_numerico)  # Ordenar de menor a mayor
matriz_ordenada_filas <- matriz[order(matriz[, 1]), ]  # Ordenar filas por la primera columna
5:10

seq(from = 1, 
  to = 1, 
  by = ((to - from)/(length.out - 1)),
  length.out = NULL, along.with = NULL, ...)

vec <- seq(5, 10, length.out = 10)
r <- vec[2]-vec[1]
seq(5, 10, by = r)
seq(5, 10, by = 2)

runif()
# Filtrar elementos de un vector o una matriz
elementos_mayores_3 <- vector_numerico[vector_numerico > 3]
elementos_pares <- vector_numerico[vector_numerico %% 2 == 0]

# Operaciones avanzadas con matrices
matriz_identidad <- diag(3)  # Crear matriz identidad de 3x3
traza_matriz <- sum(diag(matriz))  # Calcular la traza de una matriz (suma de elementos en la diagonal principal)

# Calcular la inversa de una matriz
matriz_inversa <- solve(matriz)

# Resolver un sistema de ecuaciones lineales
coeficientes <- c(2, 3, 1)
resultados <- c(10, 15, 5)
solucion_sistema <- solve(matriz, resultados)

# Calcular autovalores y autovectores
autovalores <- eigen(matriz)$values
autovectores <- eigen(matriz)$vectors

# Operaciones con listas de matrices
lista_de_matrices <- list(matriz_1 = matriz, matriz_2 = matriz_inversa, matriz_3 = matriz_identidad)
suma_listas_matrices <- Reduce(`+`, lista_de_matrices)  # Sumar todas las matrices de la lista

# Uso de la notación de índices para reemplazar o modificar elementos
vector_numerico[3] <- 10  # Reemplazar el tercer elemento del vector
matriz[2, 3] <- 100  # Reemplazar un elemento específico de la matriz

# Concatenación de vectores y matrices
nuevo_vector <- c(vector_numerico, 6, 7, 8)  # Concatenar elementos a un vector
nueva_matriz <- rbind(matriz, 13:16)  # Concatenar filas a una matriz

# Eliminar elementos de un vector o matriz
nuevo_vector <- vector_numerico[-3]  # Eliminar el tercer elemento del vector
nueva_matriz <- matriz[-2, ]  # Eliminar la segunda fila de la matriz
