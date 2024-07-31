# -*- coding: utf-8 -*-
"""
Created on Wed Jul 31 03:57:36 2024

@author: Usuario
"""

import numpy as np
import pandas as pd
from siuba import *
from plotnine import *
import os

#### Establecer nuestra carpeta de trabajo, que es donde
#### se encuentran nuestros archivos
os.chdir("C:\\Users\\Usuario\\Documents\\scidata\\24_vis_r_py")

#### Leer los archivos
sismos = pd.read_csv("sismos.csv",encoding='latin1')
div = pd.read_csv("Mexico_division_politica.csv",encoding='latin1')

#### Graficar únicamente Longitud vs Latitud
(
ggplot(data = sismos) +
  geom_point(mapping=aes(x="Longitud",y="Latitud")
             )
)

#### Graficar únicamente Longitud vs Latitud coloreando por placa
(
ggplot(data = sismos) +
  geom_point(mapping=aes(x="Longitud",y="Latitud",color="placas")
             )
)

#### Añadir una transparencia
(
ggplot(data = sismos) +
  geom_point(mapping=aes(x="Longitud",y="Latitud",color="placas"),
             alpha = 0.5
             )
)

#### Añadir facetas
(
ggplot(data = sismos) +
  geom_point(mapping=aes(x="Longitud",y="Latitud",color="placas"),
             alpha = 0.5
            ) +
  facet_wrap("zona")
)

#### Añadir entidades
(
ggplot(data = sismos) +
  geom_point(mapping=aes(x="Longitud",y="Latitud",color="placas"),
             alpha = 0.5
             ) +
  geom_polygon(data = div,
               mapping=aes(x="Longitud",y="Latitud",group="Grupo"),
               color = "black",
               fill=None
               ) +
  facet_wrap("zona")
)

