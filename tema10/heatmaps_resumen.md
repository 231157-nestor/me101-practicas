# Resumen de Construcción de Mapas de Calor (Tema 10)

## a) Herramienta más rápida de usar
La herramienta que me pareció más rápida de usar fue `pheatmap` en R. Con apenas dos o tres líneas de código fue posible generar el mapa de calor completo, configurando automáticamente una barra de escala adecuada y añadiendo los números dentro de las celdas sin tener que programar los ejes manualmente como hicimos con `imshow`. `sns.heatmap` en Python también es muy rápida, pero `pheatmap` incluye la ventaja del agrupamiento por defecto.

## b) Efecto del agrupamiento jerárquico (pheatmap)
Al usar `pheatmap` sin modificar sus parámetros por defecto, el orden de las variables sí cambió respecto al dataset original. El dendrograma agrupó las variables "nota" y "horas_estudio" colocándolas adyacentes, debido a su altísima correlación positiva (0.9927). Esto reveló visualmente la relación directa que existe entre ambas variables en el dataset, algo que tiene completo sentido lógico y que resalta de forma más intuitiva que al ver solo la tabla de números.