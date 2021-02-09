library(shiny)
library(shinydashboard)
library(dashboardthemes)
library(shinythemes)
library(shinyWidgets)
library(tidyverse)
library(rebus)
library(scales)
library(png)
library(fresh)
library(ggplot2)
library(data.table)
library(ggplot2)
library(mxmaps)
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


customLogo <- shinyDashboardLogoDIY(
    boldText = "R-Ladies"
    ,mainText = "Guadalajara"
    ,textSize = 20
    ,badgeText  = icon("chart-line")
    ,badgeTextColor = "white"
    ,badgeTextSize = 2
    ,badgeBackColor = "#751b7a"
    ,badgeBorderRadius = 3
)

   

ui<-navbarPage(
    title ="R-Ladies GDL",
    theme = "mytheme.css", 
    footer = includeHTML("./html/footer.html"),
    
    tabPanel("Inicio", tabName = "inicio", icon = icon("home"),
             fluidPage(includeHTML("./html/image.html"),
                       h4(includeHTML("./html/home.html")))),
    
    navbarMenu("Proyecto",
               tabPanel("25N",
                        h1(align="center", "25 Noviembre. Día contra la erradicación de la violencia"),
                        h4("En 1999, la Asamblea General de la Organización de las Naciones Unidas (ONU) declaró el 
                           25 de noviembre como", strong("Día internacional de la eliminación de la violencia contra la mujer"), "como 
                           un llamado a gobiernos, organismos, órganos, fondos y programas del Sistema de las Naciones Unidas.", 
                           strong("R-Ladies Guadalajara"), "se une a este llamado y se solidariza visibilizando la violencia ejercida hacia 
                           las mujeres en en México a través de gráficos elaborados en R."
                           , align = "justify"),
                        hr(),
                        sidebarLayout(
                            sidebarPanel(
                                DT::dataTableOutput("dfmapa"), filter="top"),
                            mainPanel(
                            plotlyOutput("mapa_hex"), 
                        hr()
                        )
                        ),
                        h4(""),
                        h4(""),
                        hr(),
                        plotlyOutput("columna")
    )), 

    
    #########################################################################
    
    tabPanel("Código de conducta", tabName = "codigo", icon = icon("calendar"),
             h4(includeHTML("./html/codigo_conducta.html")),
             br()),
    
    ########################################################################
    
    tabPanel("Contacto", tabName = "contacto", icon = icon("users"),
             h2(align="center","Redes sociales"),
             h4(includeHTML("./html/index.html")),
             br(),
             h4(includeHTML("./www/rladiesmx.html")),
             br(),
             h4(includeHTML("./www/organizer.html")),
             br(),
             h5("Agradecemos la visita al sitio web, 
              puede consultar el código abierto en el",(a(target="_blank",href="https://github.com/r-ladiesGdl","repositorio de GitHub")),"de la Shiny elaborado en R.", align = "center",br()))
)

