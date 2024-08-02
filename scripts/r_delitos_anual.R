library(tidyverse)

setwd("C:/Users/Usuario/Documents/scidata/24_vis_r_py/trabajos")

delitos = read.csv("incidencia_delictiva.csv",
                   fileEncoding = 'latin1')

names(delitos)

robo_calle = delitos[delitos$delito == "robo.o.asalto.en.la.calle.o.transporte.público",]

#### Gráfico de línea
ggplot(data=robo_calle,mapping=aes(x=Periodos,y=total)) +
  geom_line()

#### Gráfico de trayectoria
ggplot(data=robo_calle,mapping=aes(x=Periodos,y=total)) +
  geom_path()

#### Gráfico de pasos
ggplot(data=robo_calle,mapping=aes(x=Periodos,y=total)) +
  geom_step()

#### Gráfico de línea y pasos
ggplot(data=robo_calle,mapping=aes(x=Periodos,y=total)) +
  geom_line() +
  geom_step()

#### Gráfico de línea y pasos con colores
ggplot(data=robo_calle,mapping=aes(x=Periodos,y=total)) +
  geom_point(color="red") +
  geom_line(color="red") +
  geom_step(color="pink")

#### Gráfico de área
ggplot(data=robo_calle,mapping=aes(x=Periodos,y=total)) +
  geom_area()

#### Gráfico de área
(
  ggplot(data=robo_calle,mapping=aes(x=Periodos,y=total)) +
    geom_area(fill="blue",
              color="blue",
              lwd = 2,
              alpha=0.5)
)

#### Gráfico de línea con grosor, transparencia, tipo y color
ggplot(data=robo_calle,mapping=aes(x=Periodos,y=total)) +
  geom_line(size=1.5,
            alpha=0.5,
            linetype="dashed",
            color="midnightblue")

#### Gráfico de línea y paso donde cada geometría tiene sus
#### propios efectos visuales
ggplot(data=robo_calle,mapping=aes(x=Periodos,y=total)) +
  geom_point(size=1.8,
             color="midnightblue") +
  geom_line(size=1,
            color="midnightblue") +
  geom_step(alpha=0.5,
            linetype="dashed",
            color="midnightblue")

###################################
######### Múltiples líneas ########
###################################

#### Gráfico de línea
ggplot(data=delitos,mapping=aes(x=Periodos,y=total)) +
  geom_line() 

#### Gráfico de línea y puntos
ggplot(data=delitos,mapping=aes(x=Periodos,y=total)) +
  geom_line() +
  geom_point()

#### Gráfico de líneas múltiples agrupando
ggplot(data=delitos,mapping=aes(x=Periodos,
                                y=total,
                                group=delito)) +
  geom_line() 

#### Gráfico de líneas múltiples agrupando con colores
ggplot(data=delitos,mapping=aes(x=Periodos,
                                y=total,
                                group=delito,
                                color=delito)) +
  geom_line() 
  
#### Gráfico de líneas múltiples agrupando con colores
#### y tipo de línea dependiendo del tipo de delito
ggplot(data=delitos,mapping=aes(x=Periodos,
                                y=total,
                                group=delito,
                                color=delito,
                                linetype=tipo)) +
  geom_line()   
  
#### Gráfico de líneas múltiples agrupando con colores
#### dependiendo del tipo de delito
ggplot(data=delitos,mapping=aes(x=Periodos,
                                y=total,
                                group=delito,
                                color=tipo)) +
  geom_line()   

#### Añadir mejoras  
ggplot(data=delitos,mapping=aes(x=Periodos,
                                y=total,
                                group=delito,
                                color=tipo)) +
  geom_line() +
  scale_x_continuous(breaks = 2010:2022) +
  theme(legend.position = "top",
    axis.text.x = element_text(angle = 45, hjust = 1))

#### Añadir efecto de brillo  
ggplot(data=delitos,mapping=aes(x=Periodos,
                                y=total,
                                group=delito,
                                color=tipo)) +
  geom_line(size=1.5,alpha=0.2) +
  geom_line(size=0.5) +
  scale_x_continuous(breaks = 2010:2022) +
  theme(legend.position = "top",
        axis.text.x = element_text(angle = 45, hjust = 1))
  
#### Delitos_especiales
delitos_esp = read.csv("delitos_esp.csv")

ggplot(data=delitos_esp,mapping=aes(x=Periodos,
                                y=total,
                                group=delito,
                                color=delito)) +
  geom_line(size=2,alpha=0.5) +
  geom_line(size=0.5) +
  geom_point(size=2) +
  geom_step(alpha=0.5,
            linetype="dashed") +
  scale_x_continuous(breaks = 2010:2022) +
  theme(legend.position = "top",
        panel.background = element_rect("black"),
        panel.grid = element_line(color="grey20",linewidth=0.01),
        axis.text.x = element_text(angle = 45, hjust = 1))
