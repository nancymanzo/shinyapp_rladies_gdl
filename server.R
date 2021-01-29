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

df_mapa_base<-read.csv("df_mapa.csv") 
#    select(state_name, value)%>% 
#     mutate(
#         state_name = (state_name),
#         state_name = case_when(
#             state_name=="Aguascalientes" ~ "Aguascalientes",
#             state_name=="Baja California" ~ "Baja California",
#             state_name=="Baja California Sur" ~ "Baja California Sur",
#             state_name=="Campeche" ~ "Campeche",
#             state_name=="Coahuila de Zaragoza" ~ "Coahuila",
#             state_name=="Colima" ~ "Colima",
#             state_name=="Chiapas" ~ "Chiapas",
#             state_name=="Chihuahua" ~ "Chihuahua",
#             state_name=="Ciudad de México" ~ "Ciudad de México",
#             state_name=="Durango" ~ "Durango",
#             state_name=="Guanajuato" ~ "Guanajuato",
#             state_name=="Guerrero" ~ "Guerrero",
#             state_name=="Hidalgo" ~ "Hidalgo",
#             state_name=="Jalisco" ~ "Jalisco",
#             state_name=="México" ~ "México",
#             state_name=="Michoacán de Ocampo" ~ "Michoacán",
#             state_name=="Morelos" ~ "Morelos",
#             state_name=="Nayarit" ~ "Nayarit",
#             state_name=="Nuevo León" ~ "Nuevo León",
#             state_name=="Oaxaca" ~ "Oaxaca",
#             state_name=="Puebla" ~ "Puebla",
#             state_name=="Querétaro" ~ "Querétaro",
#             state_name=="Quintana Roo" ~ "Quintana Roo",
#             state_name=="San Luis Potosí" ~ "San Luis Potosí",
#             state_name=="Sinaloa" ~ "Sinaloa",
#             state_name=="Sonora" ~ "Sonora",
#             state_name=="Tabasco" ~ "Tabasco",
#             state_name=="Tamaulipas" ~ "Tamaulipas",
#             state_name=="Tlaxcala" ~ "Tlaxcala",
#             state_name=="Veracruz de Ignacio de la Llave" ~ "Veracruz",
#             state_name=="Yucatán" ~ "Yucatán",
#             state_name=="Zacatecas" ~ "Zacatecas"))

 
maphex <- function(){
    
    maphex<-mxhexbin_choropleth(df_mapa, num_colors = 1) +  
        labs(title="Feminicidios por cada 100 mil habitantes por entidad en México, 2020", 
             caption="Elaborado por R-Ladies GDL con base al SESNSP, 2020 (ENE-SEP) y Proyecciones de la población de CONAPO.",
             fill="Tasa") +
        scale_fill_gradient(
            low = "plum", 
            high = "magenta4",
            guide = "colourbar")+theme_elegant()+
        theme(text=element_text(family="helvetica",
                                face="plain",
                                size=23,
                                hjust = 0.5,
                                vjust = 0.5),
              legend.text = element_text(size=10, colour = "grey12"),
              legend.title = element_text(color = "grey7", size = 13),
              plot.title = element_text(hjust=0.5, size=15, face="plain", colour="grey6"),
              plot.caption = element_text(hjust=-1, size=12, face="plain"),
              plot.margin = margin(1, 1, 1, 1, "cm"))
    maphex<- ggplotly(maphex, tooltip="value") %>% layout(height = 800, width = 800)
 
    
    mapahexagonal <- plotly::ggplotly(maphex, tooltip = c("value"))}





df_mapa_base %>% 
    mutate(Entidad=state_name,
           `Tasa por cada 100 mil habitantes`=round(value, digits=3)) %>% 
    select(Entidad, `Tasa por cada 100 mil habitantes`) %>% 
    datatable(filter="top", options = list(
        pageLength = 16)) -> df_mapa_base2



server <- function(input, output, session) {
    mapahexagonal <- maphex()
    output$mapa_hex <- renderPlotly({
        plotly::ggplotly(mapahexagonal, tooltip="value", dynamicTicks = TRUE)
    })
    
    output$dfmapa = DT::renderDataTable({
        df_mapa_base2})
}


