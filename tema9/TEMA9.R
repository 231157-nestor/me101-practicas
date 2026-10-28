#-------------------hora 1------------------------------

library(dplyr)
library(readr)
# 1. Carga de datos multivariados fijando la columna 'estacion' como nombres de fila
df <- read.csv("C:/Users/jkani/me101-practicas/tema9/datos_ambiental_evaluacion_tema9.csv", 
               row.names = 1, 
               stringsAsFactors = FALSE)

num_cols <- c('pm10_ugm3', 'no2_ppb', 'ruido_db')

# 2. Imputación de valores faltantes con la mediana
df_clean <- df[, num_cols]
for (col in num_cols) {
  df_clean[is.na(df_clean[, col]), col] <- median(df_clean[, col], na.rm = TRUE)
}

# 3. Estandarización Z-Score nativa con scale()
df_z <- as.data.frame(scale(df_clean))

# 4. Escalamiento Min-Max personalizado [0, 1]
min_max_scale <- function(x) { (x - min(x)) / (max(x) - min(x)) }
df_minmax <- as.data.frame(lapply(df_clean, min_max_scale))
rownames(df_minmax) <- rownames(df_clean)

cat("--- Matriz Estandarizada Z-Score en R ---\n")
print(df_z)

#---------------------hora 2-----------------------------------------------

library(pheatmap)
library(RColorBrewer)

# Definición de paleta divergente personalizada centrada en azul-blanco-rojo
palette_div <- colorRampPalette(c("navy", "white", "firebrick3"))(100)

pheatmap(as.matrix(df_z),
         color = palette_div,
         cluster_rows = FALSE,      # Sin clustering en esta hora[cite: 1]
         cluster_cols = FALSE,
         display_numbers = TRUE,    # Mostrar valores en celdas[cite: 1]
         number_format = "%.2f",
         fontsize_number = 9,
         border_color = "gray80",
         main = "Mapa de Calor de Indicadores Ambientales (Z-Score)")

#-----------------hora 3-----------------------------------

# Pheatmap con Clustering Jerárquico Automático (Distancia Euclidiana y Método Ward.D2)
pheatmap(as.matrix(df_z),
         clustering_distance_rows = "euclidean",
         clustering_distance_cols = "euclidean",
         clustering_method = "ward.D2",
         color = colorRampPalette(c("purple", "black", "yellow"))(100),
         display_numbers = TRUE,
         number_format = "%.1f",
         border_color = "gray80",
         main = "Heatmap Ambiental con Clustering Jerárquico en R (Ward.D2)")
```[cite: 1]

#-------------------hora 4------------------------

# 1. Crear DataFrame de anotacion para las filas
annotation_df <- data.frame(Zona = factor(df$tipo_zona))
rownames(annotation_df) <- rownames(df)

# 2. Colores corregidos para R (hexadecimal o nombres validos)
ann_colors <- list(
  Zona = c(Urbana = "#DC143C", Valle = "forestgreen", Altoandina = "royalblue")
)

# 3. Generacion del mapa de calor
pheatmap(as.matrix(df_z),
         annotation_row = annotation_df,
         annotation_colors = ann_colors,
         color = colorRampPalette(c("blue", "white", "red"))(100),
         border_color = "gray80",
         cellwidth = 30,
         cellheight = 20,
         treeheight_row = 30,
         treeheight_col = 25,
         fontsize = 9,
         main = "Heatmap Ambiental con Anotaciones de Filas en R")

#----------------------hora 5-------------------------------------------


library(pheatmap)

corr_matrix <- cor(df_clean)
paleta_corr <- colorRampPalette(c("darkblue", "white", "darkred"))(100)

dev.new() 

pheatmap(corr_matrix,
         display_numbers = TRUE,
         number_format = "%.3f",
         color = paleta_corr,
         breaks = seq(-1, 1, length.out = 101),
         border_color = "white",
         main = "Matriz de Correlacion Ambiental de Pearson")

#-----------Parte B: Conversión Sintáctica Bidireccional-----------------


# 'vlag' corresponde a una paleta divergente azul-blanco-roja balanceada en 0
paleta_vlag <- colorRampPalette(c("#4063A4", "#F5F5F5", "#C13B42"))(100)

pheatmap(as.matrix(df_z),
         color = paleta_vlag,
         cluster_rows = FALSE,      # sns.heatmap no realiza agrupamiento
         cluster_cols = FALSE,
         display_numbers = TRUE,    # annot = True
         number_format = "%.2f",    # fmt = '.2f'
         border_color = "gray80")   # linewidths = 0.5

#-----------------PARTE C---------------------------------------

library(pheatmap)

# 1. Creacion del DataFrame
df <- data.frame(
  pm10_ugm3 = c(45.0, 28.0, 62.0, 35.0, NA),
  no2_ppb   = c(18.2, 12.5, 25.4, 15.0, 9.8),
  ruido_db  = c(72, 58, 81, 65, 52),
  row.names = c('Centro', 'San Jerónimo', 'Wanchaq', 'San Sebastián', 'Poroy')
)

# 2. Imputacion con la mediana
for (col in colnames(df)) {
  df[is.na(df[, col]), col] <- median(df[, col], na.rm = TRUE)
}

# 3. Estandarizacion Z-Score nativa
df_z <- as.data.frame(scale(df))

# 4. Mapa de calor divergente centrado en 0
paleta_div <- colorRampPalette(c("#3B4CC0", "#FFFFFF", "#B40426"))(100)

pheatmap(as.matrix(df_z),
         color = paleta_div,
         cluster_rows = FALSE,
         cluster_cols = FALSE,
         display_numbers = TRUE,
         number_format = "%.2f",
         border_color = "gray80",
         main = "Calidad Ambiental en Zonas de Monitoreo (Z-Score)")

#----------------PARTE D------------------------
library(pheatmap)

# Carga e imputacion
df <- read.csv("C:/Users/jkani/me101-practicas/tema9/datos_ambiental_evaluacion_tema9.csv", 
               row.names = 1, 
               stringsAsFactors = FALSE)
num_cols <- c('pm10_ugm3', 'no2_ppb', 'ruido_db')
df_clean <- df[, num_cols]

for (col in num_cols) {
  df_clean[is.na(df_clean[, col]), col] <- median(df_clean[, col], na.rm = TRUE)
}

df_z <- as.data.frame(scale(df_clean))
paleta_ward <- colorRampPalette(c("#3B4CC0", "#FFFFFF", "#B40426"))(100)

# Exportacion directa en formato PNG a 300 DPI (ward.D2 + distancia euclidiana)
pheatmap(as.matrix(df_z),
         clustering_distance_rows = "euclidean",
         clustering_distance_cols = "euclidean",
         clustering_method = "ward.D2",
         color = paleta_ward,
         display_numbers = TRUE,
         number_format = "%.2f",
         border_color = "gray80",
         main = "Clustering Jerárquico de Calidad Ambiental (Ward.D2 - R)",
         filename = "clustermap_ambiental_r_300dpi.png",
         width = 8,
         height = 7,
         res = 300)

