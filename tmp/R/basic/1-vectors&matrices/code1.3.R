# Operaciones con matrices y álgebra lineal
matriz_A <- matrix(c(1, 2, 3, 4), nrow = 2)  # Crear una matriz 2x2
matriz_B <- matrix(c(5, 6, 7, 8), nrow = 2)  # Crear otra matriz 2x2

# Multiplicación de matrices
matriz_producto <- matriz_A %*% matriz_B

# Cálculo de la norma de una matriz
norma_matriz_A <- norm(matriz_A, type = "F")  # Norma de Frobenius

# Extraer la diagonal de una matriz
diagonal_A <- diag(matriz_A)

# Descomposición de valores singulares (SVD)
svd_result <- svd(matriz_A)
U <- svd_result$u  # Matriz U
D <- diag(svd_result$d)  # Matriz D (diagonal)
V <- svd_result$v  # Matriz V

# Resolver un sistema de ecuaciones lineales usando la descomposición SVD
b <- c(9, 10)
x <- V %*% solve(D) %*% t(U) %*% b

# Matriz inversa mediante la descomposición SVD
matriz_inversa_svd <- V %*% solve(D) %*% t(U)

# Resolver un sistema de ecuaciones lineales usando la función solve()
solucion_sistema <- solve(matriz_A, b)

# Calcular el determinante de una matriz
determinante_A <- det(matriz_A)

# Operaciones con vectores y matrices usando el paquete 'Matrix'
library(Matrix)

# Crear una matriz dispersa (sparse matrix)
matriz_dispersa <- Matrix(data = c(1, 0, 0, 0, 5), nrow = 2, ncol = 3)

# Convertir una matriz dispersa en una matriz densa
matriz_densa <- as.matrix(matriz_dispersa)

# Multiplicación de matrices dispersas
matriz_dispersa_producto <- matriz_dispersa %*% t(matriz_dispersa)

# Resolver un sistema de ecuaciones lineales con matriz dispersa
b_disperso <- c(9, 10)
solucion_sistema_disperso <- solve(matriz_dispersa, b_disperso)

# Operaciones con vectores usando el paquete 'dplyr'
library(dplyr)

# Crear un tibble (data frame mejorado)
datos <- tibble(id = 1:10, valor = runif(10))

# Filtrar y seleccionar elementos usando dplyr
datos_filtrados <- datos %>%
  filter(valor > 0.5) %>%
  select(id, valor)

# Sumarizar y agrupar datos usando dplyr
datos_resumen <- datos %>%
  group_by(id %% 2) %>%
  summarise(promedio = mean(valor))

# Unir datos usando dplyr
datos_otro <- tibble(id = 6:15, valor = runif(10))
datos_completos <- bind_rows(datos, datos_otro)

