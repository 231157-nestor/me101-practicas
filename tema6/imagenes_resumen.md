{\rtf1}
# Resumen de Evidencias - Tema 6: Imágenes como Datos
**Estudiante:** Nestor Quispe Condori  
**Curso:** Programación Estadística y Visualización de Datos (ME101)  
**Semana:** 6 — Unidad II  

---

## 1. Dimensiones (Shape) de las Imágenes Sintéticas
* **Imagen en Escala de Grises (NumPy):**
  * Dimensiones: `(5, 5)` (matriz 2D de 5 filas por 5 columnas).
  * Tipo de dato: `uint8`.
  * Rango de intensidad: Degradado horizontal de 0 (negro) a 255 (blanco).
* **Imagen a Color (RGB):**
  * Dimensiones: `(4, 4, 3)` (array 3D de 4 filas, 4 columnas y 3 canales de color).
  * Tipo de dato: `uint8`.

---

## 2. Colores Seleccionados y Luminosidad Calculada
Para la imagen RGB se configuraron dos mitades verticales [4×4]:
* **Mitad Izquierda (Columnas 0 a 1):** Azul puro `[0, 0, 255]`.
  * Promedio simple: `(0 + 0 + 255) / 3 = 85.00`.
  * Luminosidad ponderada (ITU-R BT.601): `0.299(0) + 0.587(0) + 0.114(255) = 29.07` (entero: `29`).
* **Mitad Derecha (Columnas 2 a 3):** Verde puro `[0, 255, 0]`.
  * Promedio simple: `(0 + 255 + 0) / 3 = 85.00`.
  * Luminosidad ponderada (ITU-R BT.601): `0.299(0) + 0.587(255) + 0.114(0) = 149.69` (entero: `150`).

Los cálculos numéricos de luminosidad ponderada coincidieron plenamente entre Python y R.

---

## 3. Umbral de Binarización
* **Umbral asignado:** `umbral = 90`.
* **Justificación:** Se seleccionó un umbral de 90 debido a que se encuentra centrado entre la intensidad de luminancia de la mitad azul (29) y la mitad verde (150). Esto permite que la condición vectorizada `(gris_luminosidad >= 90)` clasifique de manera robusta la región azul como 0 (negro) y la región verde como 255 (blanco), evitando la ambigüedad que presentaba el promedio simple al asignarles el mismo valor.
EOF