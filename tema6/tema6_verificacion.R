# Reconstruye el degradado con matrix()
fila <- seq(0, 255, length.out = 5)
gris <- matrix(rep(fila, each = 5), nrow = 5, ncol = 5, byrow = TRUE)

cat("Dimensiones (dim):", dim(gris), "\n")
cat("Promedio (mean):", mean(gris), "\n")

# Reconstruye la imagen RGB de dos mitades
rgb <- array(0, dim = c(4, 4, 3))
rgb[, 1:2, 1] <- 0   # R
rgb[, 1:2, 2] <- 255 # G
rgb[, 1:2, 3] <- 0   # B

rgb[, 3:4, 1] <- 0   # R
rgb[, 3:4, 2] <- 0   # G
rgb[, 3:4, 3] <- 255 # B

cat("Píxel [1,1] (Verde):", rgb[1, 1, ], "\n")
cat("Píxel [1,4] (Azul):", rgb[1, 4, ], "\n")

# Gris por luminosidad ponderada
gris_luminosidad <- 0.299 * rgb[, , 1] + 0.587 * rgb[, , 2] + 0.114 * rgb[, , 3]
cat("\nGris Luminosidad en R:\n")
print(gris_luminosidad)

