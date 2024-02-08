#<------------------------------->
# class 1.1: vectors&            #               
#<------------------------------->
#qselmer@gmail.com
rm(list = ls())

# -------------------------------------------------------------------------
vec <- 3:76
vec <- "REPLICA"
# concatenar (valor numerico, valor caracter, valor logico)
c(3:6, "re", FALSE) # si corres valores diferentes R lo corre como caracteres.

# Crear vectores con nombres 
vector_numerico <- c(n1 = 1, n2 = 2, n3 = 3, 4, 5)

hasName(vector_numerico, "n1")
class(vector_numerico)

vector_caracteres <- c("red", "green", "blue")
# vector_caracteres <- "rojo"+ "verde"+ "azul"
class(vector_caracteres)

vector_log <- c(TRUE, FALSE, FALSE)
class(vector_log)

vector_fac <- c(1:3)
class(vector_fac)
vector_fac <- c(as.factor(1:3))
class(vector_fac)


rm(list = ls())
nombre <- "init"
x <- 1:10
y = 1:10
assign(nombre,4:5)
assign("valor3", 40:80)
# un punto antes de cualquier variable es para ocultar en R.
.valor2 <- 67
# se usa la función print para llamar al valor oculto 
print(.valor2)
# R no permite asignar variables que empiece con números o guión. 
1e4r <- 50
# Sí puedo asignar variables con números con la función assing.
assign("1e4r", 50)

# types
ls()
# attr(x,"dim") <- c(2, 5)
mode(x)
class(x)
typeof(x)
get("x") # te arroja el valor de las variables
x
get("match")
var1 <-var2 <- x
exists( "y") # para corroborar si existe la variable en mi envioronment.

vector_numerico <- 1:50
# Acceder a elementos de un vector /// seleccionar un elemento del vector. 
primer_elemento <- vector_numerico[1]
varios_elemento <- vector_numerico[3:15]
segundo_elemento <- vector_caracteres[2]

vector_let <- letters
vocales <- c("a", "e", "i", "o", "u")
vocales[2]
vocales[c(T,F,T,F,T)]
vocales[c(F,T,F,F,F)]

# Operaciones con vectores
suma_vectores <- vector_numerico + 10
multiplicacion_vectores <- vector_numerico * 2

# Crear matrices
matriz <- matrix(data = 1:12, nrow = 3, ncol = 4, byrow = T)
image(matriz)

# También se puede crear una matriz mediante la función "cbind" o "rbind" para unir vectores

# Acceder a elementos de una matriz
elemento_1_2 <- matriz[1, 2]  # Fila 1, Columna 2
fila_2 <- matriz[2, ]  # Obtener la segunda fila completa
columna <- matriz[,4]

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
get("%*%")
get("+")

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

# -------------------------------------------------------------------------

years <- 2001: 2005
edad <- 1:8
cedad <- paste0("age", edad)

vec2001 <- rnorm(100, mean = 2, sd = 2)
vec2001 <- table(cut(vec2001, breaks = 1:8, include.lowest = T))
vec2001 <- as.vector(vec2001)

vec2002 <- rnorm(100, mean = 3, sd = 2)

# -------------------------------------------------------------------------

vec2003 <- rnorm(100, mean = 4, sd = 2)
vec2004 <- rnorm(100, mean = 5, sd = 2)
vec2005 <- rnorm(100, mean = 6, sd = 2)

vec <- c(vec2001, vec2002, vec2003, vec2004, vec2005)

data <- matrix(data = vec ,nrow = length(years), ncol = length(edad), byrow = T)
print(data)
colnames(data) <- cedad
rownames(data) <- years
data <- round(data, 0)
# fix(data)
image(data)

par(mfrow = c(5, 1), mar = c(0,0,0,0), oma = c(2,2,2,2))
plot(x = edad, y = data[1,], type = "l", lwd = 2, col = "red")
plot(x = edad, y = data[2,], type = "l", lwd = 2, col = "red")
plot(x = edad, y = data[3,], type = "l", lwd = 2, col = "red")
plot(x = edad, y = data[4,], type = "l", lwd = 2, col = "red")
plot(x = edad, y = data[5,], type = "l", lwd = 2, col = "red")

