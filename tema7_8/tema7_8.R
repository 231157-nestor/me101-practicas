library(imager)
# Cargar imagen y convertir a escala de grises
img <- load.image('images.png')
gray <- grayscale(img)

# Recortar usando indexación de matriz o imsub. 
# Python: gray[10:150, 20:200] -> Filas(Y) 11 a 150, Cols(X) 21 a 200 en R
crop <- imsub(gray, y %in% 11:150, x %in% 21:200)

