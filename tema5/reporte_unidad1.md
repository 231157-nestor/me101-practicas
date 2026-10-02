**curso:** programacion estadistica y visualizacion de datos(ME101)
**semana:** 5 -Cierre de unidad I
---
### 1. estadisticos descriptivos principales
* **columna 'nota':**
- media, desviacion estandar y coeficiente de variacion calculados sobre el dataset limpio
### 2. Nivel de Dispersión Clasificado (Función `clasificar_dispersion`)
* **`asistencia_pct`:** Presenta **Dispersión Baja** (CV < 15%), indicando homogeneidad en el porcentaje de asistencia de los estudiantes.
* **`nota`:** Presenta **Dispersión Moderada** (15% <= CV < 30%), reflejando una variabilidad esperada y natural en las evaluaciones académicas.

### 3. Observaciones sobre Convenciones entre Librerías
* **NumPy vs. pandas / R:** NumPy utiliza por defecto $ddof=0$ (enfoque poblacional), mientras que pandas ($ddof=1$) y las funciones base de R (`sd()`, `var()`) usan el estimador muestral con corrección de Bessel ($n - 1$).
* **Momentos de Orden Superior (Asimetría y Curtosis):** pandas aplica por defecto corrección para muestras finitas (equivalente a `type = 2` en SAS/SPSS/e1071), mientras que `scipy.stats` y el paquete `e1071` en R calculan por defecto la versión muestral directa sin corrección de sesgo (`type = 3`).
