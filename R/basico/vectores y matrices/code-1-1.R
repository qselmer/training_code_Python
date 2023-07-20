# Crear vectores
vector_numerico <- c(1, 2, 3, 4, 5)
vector_caracteres <- c("rojo", "verde", "azul")

# Acceder a elementos de un vector
primer_elemento <- vector_numerico[1]
segundo_elemento <- vector_caracteres[2]

# Operaciones con vectores
suma_vectores <- vector_numerico + 10
multiplicacion_vectores <- vector_numerico * 2

# Crear matrices
matriz <- matrix(1:12, nrow = 3, ncol = 4)
# También se puede crear una matriz mediante la función "cbind" o "rbind" para unir vectores

# Acceder a elementos de una matriz
elemento_1_2 <- matriz[1, 2]  # Fila 1, Columna 2
fila_2 <- matriz[2, ]  # Obtener la segunda fila completa

# Operaciones con matrices
transpuesta_matriz <- t(matriz)  # Transpuesta de la matriz
suma_filas <- rowSums(matriz)  # Suma de elementos por filas
promedio_columnas <- colMeans(matriz)  # Promedio de elementos por columnas

# Operaciones entre matrices y vectores
vector_suma_filas <- rowSums(matriz)  # Suma de elementos por filas en una matriz
matriz_multiplicada <- matriz * 2  # Multiplicar cada elemento de la matriz por 2

# Calcular el producto matricial
matriz_1 <- matrix(1:6, nrow = 2, ncol = 3)
matriz_2 <- matrix(7:12, nrow = 3, ncol = 2)
producto_matricial <- matriz_1 %*% matriz_2

# Imprimir resultados
print("Vectores:")
print(vector_numerico)
print(vector_caracteres)
print(primer_elemento)
print(segundo_elemento)
print(suma_vectores)
print(multiplicacion_vectores)

print("Matrices:")
print(matriz)
print(elemento_1_2)
print(fila_2)
print(transpuesta_matriz)
print(suma_filas)
print(promedio_columnas)
print(vector_suma_filas)
print(matriz_multiplicada)

print("Producto matricial:")
print(producto_matricial)
