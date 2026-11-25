# Resumen Geoespacial — Tema 12 (Unidad III)
## a) Lugares elegidos y por qué
Elegí cuatro puntos reales de referencia en San Jerónimo, Cusco: **Casa (Calle Romeritos 820)**, **Colegio Fe y Alegria**, **Plaza de Armas de San Jeronimo** y **Mercado Vinocanchon**. Los seleccioné porque corresponden a mi entorno cotidiano y a puntos conocidos del distrito, lo que permite verificar de forma práctica sus coordenadas en grados decimales (latitud y longitud negativas en los hemisferios sur y oeste).

## b) Par más cercano y más lejano con sus distancias
A partir del cálculo con la fórmula de Haversine sobre las combinaciones de los lugares elegidos:
- **Par más cercano:** `Casa (Calle Romeritos 820)` y `Colegio Fe y Alegria`, con una distancia aproximada de **0.1630 km**.
- **Par más lejano:** `Casa (Calle Romeritos 820)` y `Mercado Vinocanchon`, con una distancia aproximada de **0.7294 km**.

## c) Respuesta sobre CRS y códigos EPSG
Si comparto únicamente los números de las coordenadas sin indicar el Sistema de Referencia de Coordenadas (CRS), quien reciba los datos no sabrá si esos valores representan grados sobre un elipsoide (como en **EPSG:4326**) o metros en un sistema proyectado como **UTM**. Por la trampa del CRS, dos capas con sistemas distintos pueden tener valores numéricos similares o no alinearse al superponerse, ubicando los puntos en lugares equivocados o desplazados. Indicar el código **EPSG** evita ambigüedades y permite reproyectar las capas al mismo CRS antes de combinarlas.
EOF