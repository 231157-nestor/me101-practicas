library(tidyverse)
library(e1071)

df <- read_csv("estudiantes_limpio_R.csv")

# 1. Medidas básicas
media <- mean(df$nota, na.rm = TRUE)
mediana <- median(df$nota, na.rm = TRUE)
desv_std <- sd(df$nota, na.rm = TRUE)        # Muestral (n - 1)
varianza <- var(df$nota, na.rm = TRUE)      # Muestral (n - 1)
q1 <- quantile(df$nota, probs = 0.25, na.rm = TRUE, names = FALSE)
q3 <- quantile(df$nota, probs = 0.75, na.rm = TRUE, names = FALSE)
iqr_val <- IQR(df$nota, na.rm = TRUE)

cat("Media:", media, "\n")
cat("Mediana:", mediana, "\n")
cat("sd (muestral):", desv_std, "\n")
cat("var (muestral):", varianza, "\n")
cat("Q1:", q1, "| Q3:", q3, "| IQR:", iqr_val, "\n\n")

# 2. Skewness y Kurtosis con e1071 (type = 3 por defecto)
skew_r <- skewness(df$nota, na.rm = TRUE)
kurt_r <- kurtosis(df$nota, na.rm = TRUE)

cat("Skewness (e1071, type=3):", skew_r, "\n")
cat("Kurtosis (e1071, type=3):", kurt_r, "\n\n")

# 3. Función resumen_estadistico
resumen_estadistico <- function(vector, decimales = 4) {
  v <- na.omit(vector)
  n <- length(v)
  m <- mean(v)
  med <- median(v)
  s <- sd(v)
  cv <- (s / m) * 100
  
  return(list(
    n = n,
    media = round(m, decimales),
    mediana = round(med, decimales),
    desv_std = round(s, decimales),
    cv_pct = round(cv, decimales)
  ))
}

print(resumen_estadistico(df$nota))

# 4. Clasificación de dispercion
clasificar_dispersion <- function(cv_pct) {
  if (cv_pct < 15) {
    return("Baja")
  } else if (cv_pct >= 15 && cv_pct < 30) {
    return("Moderada")
  } else {
    return("Alta")
  }
}

columnas <- c("nota", "asistencia_pct")
for (col in columnas) {
  res <- resumen_estadistico(df[[col]])
  nivel <- clasificar_dispersion(res$cv_pct)
  cat("Columna:", col, "\n")
  cat("  Media:", res$media, "| SD:", res$desv_std, "| CV:", res$cv_pct, "%\n")
  cat("  Dispersión clasificada:", nivel, "\n\n")
}

