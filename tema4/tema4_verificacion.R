library(tidyverse)
library(readr)
# 1. Leer el CSV
df <- read_csv("proyecto ME101_ProgramacionEstadistica/estudiantes.xls")

# 2. Exploración: estructura y conteo de NA por columna
glimpse(df)
colSums(is.na(df))

# 3. Flujo de limpieza con pipe
promedio_asist <- mean(df$asistencia_pct, na.rm = TRUE)

df_limpio <- df %>%
  drop_na(nota) %>%
  replace_na(list(asistencia_pct = promedio_asist))

# Verificar que no queden NA
colSums(is.na(df_limpio))

# 4. Promedio de nota agrupado por curso
promedio_por_curso <- df_limpio %>%
  group_by(curso) %>%
  summarise(nota_promedio = mean(nota))

print(promedio_por_curso)

# 5. Exportar CSV limpio
write_csv(df_limpio, "estudiantes_limpio_R.csv")

