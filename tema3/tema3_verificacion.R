library(tidyverse)

# ejercicio 11

notas <- c(11, 14, 20, 8, 16, 13)

# Completa: muestra el primer y el ultimo elemento
primero <- notas[1]
ultimo <- notas[6]

print(primero)
print(ultimo)

#ejercicio 12

promedio <- mean(notas)
maximo <- max(notas)
cantidad_aprobados <- sum(notas >= 10.5)

print(paste("Promedio:", promedio))
print(paste("Máximo:", maximo))
print(paste("Aprobados:", cantidad_aprobados))

#ejercicio 13

datos <- tibble(
  nombre = c("Ana", "Luis", "Carlos", "María", "Jorge"),
  nota = c(15, 9, 18, 12, 8),
  asistencia_pct = c(85, 90, 65, 75, 50)
)

# Completa: filtra con las dos condiciones combinadas
estudiantes_filtrados <- filter(datos, nota >= 10.5 & asistencia_pct >= 70)

print(estudiantes_filtrados)

