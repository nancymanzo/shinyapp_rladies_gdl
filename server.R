library(shiny)
library(ggplot2)
library(data.table)
library(ggplot2)
library("mxmaps")
library(lubridate)
library(haven)
library(readxl)
library(dplyr)
library(tidyr)
library(ggplot2)
library(plotly)
library(DT)
library(scales)
library(ggthemes)
library(extrafont) 
library(waffle)

df_mapa <- read.csv("df_mapa.csv")

maphex <- function(){
   
    maphex<-mxhexbin_choropleth(df_mapa, num_colors = 1) +  
        labs(title="Feminicidios por cada 100 mil habitantes por entidad, 2020", 
             fill="Tasa")+
    scale_fill_gradient(
            low = "plum", 
            high = "magenta4",
            guide = "colourbar")+theme_minimal()+
        theme(text=element_text(family="helvetica",
                                face="plain",
                                size=2,
                                hjust = 0.5,
                                vjust = 0.5),
              axis.title.x = element_blank(),
              axis.title.y = element_blank(),
              legend.text = element_text(size=12, colour = "grey12"),
              legend.title = element_text(color = "grey7", size = 15),
              plot.title = element_text(family="helvetica",hjust=0.5, size=15, colour="dimgrey"))
    maphex<- ggplotly(maphex, tooltip="value") %>% layout(height = 800, width = 900)
    mapahexagonal <- plotly::ggplotly(maphex, tooltip = c("value"))}


df_mapa %>% 
    mutate(Entidad=state_name,
           `Tasa por cada 100 mil habitantes`=as.character(round(value, digits=3))) %>% 
    select(Entidad, `Tasa por cada 100 mil habitantes`) %>% 
    datatable(filter="top", options = list(
        pageLength = 16)) -> df_mapa_bas
#
#
#
#

delitos_historico<- read.csv("Municipal-Delitos-2015-2020_dic2020.csv")

delitos_historico <- delitos_historico %>%
    mutate(Anio=factor(Anio,
                         levels=c("2015", "2016", "2017","2018", "2019", "2020")))



base<-delitos_historico %>% 
    filter(Entidad=="Jalisco",
           Tipo.de.delito=="Feminicidio") %>% 
    group_by(Anio) %>% 
    summarise(ene=sum(Enero),
              feb=sum(Febrero),
              mar=sum(Marzo),
              abr=sum(Abril),
              may=sum(Mayo),
              jun=sum(Junio),
              jul=sum(Julio),
              ago=sum(Agosto),
              sep=sum(Septiembre),
              oct=sum(Octubre),
              nov=sum(Noviembre),
              dic=sum(Diciembre),
              Total=sum(ene+feb+mar+abr+ 
                                may+jun+jul+ago+
                                sep+oct+nov+dic)) 


 graphcol<- ggplot(base, aes(x=Anio, y=Total))+
    geom_col(position = "dodge", width=.5, fill="magenta4") +
    scale_y_continuous(labels=comma, limits = c(0, 70))+
    theme(legend.position="bottom")+
    labs(fill = "",
         x= "",
         y= "",
         title = "Total de feminicidios registrados en Jalisco, 2015-2020",
         caption = "Elaboración propia con base al Secretariado Ejecutivo del Sistema Nacional de Seguridad Pública, SESNSP") +
    theme_minimal(base_size=25)+
    theme(text=element_text(family="",
                            face="plain",
                            size=23,
                            hjust = 0.5,
                            vjust = 0.5),
          plot.title = element_text(hjust = 0.5, size=20, face="bold"),
          plot.caption = element_text(hjust = 0, face="plain", size=16, colour="gray20"))

 
 ggplotly(graphcol, tooltip="Total") ->grafico_columna

 
server <- function(input, output, session) 

{
    
    mapahexagonal <- maphex()
    output$mapa_hex <- renderPlotly({
        plotly::ggplotly(mapahexagonal, tooltip="value", dynamicTicks = TRUE)
    })
     
    output$dfmapa = DT::renderDataTable({
        df_mapa_bas})
    
    output$columna<-renderPlotly({
        plotly::ggplotly(grafico_columna, tooltip="Total", dynamicTicks = TRUE)
    })
}


