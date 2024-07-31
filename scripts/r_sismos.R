library(tidyverse)

#### Establecer nuestra carpeta de trabajo, que es donde
#### se encuentran nuestros archivos
setwd("C:\\Users\\Usuario\\Documents\\scidata\\24_vis_r_py")

#### Leer los archivos
sismos = read.csv("sismos.csv",fileEncoding = 'latin1')
div = read.csv("Mexico_division_politica.csv",fileEncoding = 'latin1')

#### Graficar únicamente Longitud vs Latitud
ggplot(data = sismos) +
  geom_point(mapping=aes(x=Longitud,y=Latitud)
             )

#### Graficar únicamente Longitud vs Latitud coloreando por placa
ggplot(data = sismos) +
  geom_point(mapping=aes(x=Longitud,y=Latitud,color=placas)
             )

#### Añadir una transparencia
ggplot(data = sismos) +
  geom_point(mapping=aes(x=Longitud,y=Latitud,color=placas),
             alpha = 0.5
             )

#### Cambiar el sistema coordenado
ggplot(data = sismos) +
  geom_point(mapping=aes(x=Longitud,y=Latitud,color=placas),
             alpha = 0.5
             ) +
  coord_map()

#### Añadir facetas
ggplot(data = sismos) +
  geom_point(mapping=aes(x=Longitud,y=Latitud,color=placas),
             alpha = 0.5
            )
   +
  coord_map() +
  facet_wrap(~zona)

#### Añadir entidades
ggplot(data = sismos) +
  geom_point(mapping=aes(x=Longitud,y=Latitud,color=placas),
             alpha = 0.5
             ) +
  geom_polygon(data = div,
               mapping=aes(x=Longitud,y=Latitud,group=Grupo),
               color = "black",
               fill=NA
               ) +
  coord_map() +
  facet_wrap(~zona)
