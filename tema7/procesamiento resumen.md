# Resumen de Procesamiento de Imágenes - Tema 7

**a) Descripción de la imagen sintética:**
Dibujé una imagen de 120x120 con un fondo morado (100, 50, 150). Sobre él, tracé dos figuras: un cuadrado de color cian (0, 255, 255) y un círculo de color rosa (255, 0, 128).

**b) Comparación de escala de grises (Pillow vs scikit-image):**
Al analizar el píxel de fondo en las coordenadas [5, 5], la función `.convert('L')` de Pillow arrojó un valor entero (debido al uso de la fórmula BT.601 y tipo uint8), mientras que `color.rgb2gray()` de scikit-image dio un valor ligeramente distinto tras multiplicarlo por 255 (debido al uso de la fórmula BT.709 y tipo float64).

**c) Umbralización de Otsu:**
El umbral de Otsu calculado automáticamente por scikit-image permitió binarizar la imagen. (Nota: aquí debes anotar los números exactos que te arrojó el print de tu cuaderno para el umbral y la proporción de píxeles 'True').