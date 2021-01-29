pacman::p_load(shiny, shinydashboard, dashboardthemes, shinythemes, shinyWidgets,
               tidyverse, rebus, scales, png, fresh, plotly)

# fuentes_Sys <- list.files("~/Library/Fonts/") %>%
#  str_remove_all(pattern = "." %R% capture(one_or_more(WRD)) %R% END)


mytheme <- create_theme(
    theme = "default",
    bs_vars_navbar(
        default_bg = "#751b7a",
        default_color = "#FFFFFF",
        default_link_color = "#FFFFFF",
        default_link_active_color = "#FFFFFF"
    ),
    bs_vars_color(
        gray_base = "#000000",
        brand_primary = "#751b7a",
        brand_success = "#4f4c4c",
        brand_info = "#758bd1",
        brand_warning = "#d1ab75",
        brand_danger = "#d175b8"
    ),
    bs_vars_state(
        success_text = "#FFF",
        success_bg = "#c9d175",
        success_border = "#c9d175",
        info_text = "#FFF",
        info_bg = "#3f2d54",
        info_border = "#3f2d54",
        danger_text = "#FFF",
        danger_bg = "#d175b8",
        danger_border = "#d175b8"
    ),
    bs_vars_wells(
        bg = "#FFF",
        border = "#3f2d54"
    ),
    output_file = "www/mytheme.css"
)


customLogo <- shinyDashboardLogoDIY(
    boldText = "R - Ladies"
    ,mainText = "Guadalajara"
    ,textSize = 20
    ,badgeText  = icon("chart-line")
    ,badgeTextColor = "white"
    ,badgeTextSize = 2
    ,badgeBackColor = "#751b7a"
    ,badgeBorderRadius = 3
)



ui<- navbarPage(
    title = customLogo,
    theme = "mytheme.css",
    footer = includeHTML("./html/footer.html"),
    
    tabPanel("Inicio", tabName = "inicio", icon = icon("home"),
             fluidPage(img(src="header2.jpg", align = "center", width = '1550px'),br()),
             h4(includeHTML("./html/home.html"))),
    
    
    navbarMenu("Proyecto",
               tabPanel("25N",
                        h1(align="center", "Día contra la erradicación de la violencia"),
                        h3("Sitio en construcción", align = "justify"),
                        sidebarPanel(
                            DT::dataTableOutput("dfmapa"), filter="top"),
                        mainPanel(
                            plotlyOutput("mapa_hex")
                        ),
                        h4("En 1999, la Asamblea General de la Organización de las Naciones Unidas (ONU) declaró el 𝟐5 de nviembre como un llamado
                           a gobiernos, organismos, órganos, fondos y programas del Sistema de las Naciones Unidas, es por eso que hoy 𝑹-𝑳𝒂𝒅𝒊𝒆𝒔
                           𝑮𝑫𝑳, se solidariza y se une visibilizando la violencia ejercida hacia las mujeres en en México, en los próximos #16DiasDeActivismo 
                           en la cual se presentarán visualizaciones en R.
                           
                           
                           
                           ", br()))
    ),
    
    
    #########################################################################
    
    tabPanel("Código de conducta", tabName = "codigo", icon = icon("calendar"),
             h4(includeHTML("./html/codigo_conducta.html")),
             br()),
    
    ########################################################################
    
    tabPanel("Contacto", tabName = "contacto", icon = icon("users"),
             h2(align="center","Redes sociales"),
             h4(includeHTML("./html/index.html")),
             br(),
             h4(includeHTML("./html/organizer.html")),
             br(),
             h5("Agradecemos la visita al sitio web, 
              puede consultar el código abierto en el",(a(target="_blank",href="https://github.com/r-ladiesGdl","repositorio de GitHub")),"de la Shiny elaborado en R.", align = "center",br()))
)










############################
# 
# pacman::p_load(shiny, shinydashboard, dashboardthemes, shinythemes, shinyWidgets,
#                tidyverse, rebus, scales, png, fresh, plotly)
# 
# # fuentes_Sys <- list.files("~/Library/Fonts/") %>%
# #  str_remove_all(pattern = "." %R% capture(one_or_more(WRD)) %R% END)
# 
# 
# mytheme <- create_theme(
#     theme = "default",
#     bs_vars_navbar(
#         default_bg = "#751b7a",
#         default_color = "#FFFFFF",
#         default_link_color = "#FFFFFF",
#         default_link_active_color = "#FFFFFF"
#     ),
#     bs_vars_color(
#         gray_base = "#000000",
#         brand_primary = "#751b7a",
#         brand_success = "#4f4c4c",
#         brand_info = "#758bd1",
#         brand_warning = "#d1ab75",
#         brand_danger = "#d175b8"
#     ),
#     bs_vars_state(
#         success_text = "#FFF",
#         success_bg = "#c9d175",
#         success_border = "#c9d175",
#         info_text = "#FFF",
#         info_bg = "#3f2d54",
#         info_border = "#3f2d54",
#         danger_text = "#FFF",
#         danger_bg = "#d175b8",
#         danger_border = "#d175b8"
#     ),
#     bs_vars_wells(
#         bg = "#FFF",
#         border = "#3f2d54"
#     ),
#     output_file = "www/mytheme.css"
# )
# 
# 
# customLogo <- shinyDashboardLogoDIY(
#     boldText = "R - Ladies"
#     ,mainText = "Guadalajara"
#     ,textSize = 20
#     ,badgeText  = icon("chart-line")
#     ,badgeTextColor = "white"
#     ,badgeTextSize = 2
#     ,badgeBackColor = "#751b7a"
#     ,badgeBorderRadius = 3
# )
# 
# 
# 
# ui<- navbarPage(
#     title = customLogo,
#     theme = "mytheme.css",
#     footer = includeHTML("./www/footer.html"),
#     
#     tabPanel("Inicio", tabName = "inicio", icon = icon("home"),
#              tabPanel("Inicio", tabName = "inicio", icon = icon("home"),
#                       fluidPage(img(src="header2.jpg", align = "center", width = '1600px'),br()),
#                       
#                       h4("R–Ladies Guadalajara es uno de los 197 capítulo que compone R – Ladies global, 
#                      el cual tiene la finalidad de integrar a diversos grupos minoritarios a el mundo de la programación. 
#                      La inauguración del capítulo local se realizo el 15 de agosto del 2020, en el evento virtual titulado: 
#                      “Primer encuentro anual R-Ladies México” en la cual se reunieron a las y los miembros de R–Ladies del 
#                      todo país para estrechar lazos, compartir experiencias y conocimientos.Es con el evento anual que R - 
#                      Ladies Guadalajara, se integra como el 9no capítulo de",(a(target="_blank",href="http://rladiesmx.netlify.app/","México.")), align = "justify",br()),
#                       
#                       h4(a(target="_blank",href="https://rladies.org/","R-Ladies"), "es una organización mundial cuya misión es promover la diversidad de género en la comunidad R.
#                         La comunidad R sufre de una subrepresentación de géneros minoritarios (incluidas, entre otras, mujeres 
#                         cis /trans, hombres trans, no binarios, queer) en todos los roles y áreas de participación, ya sea 
#                         como líderes,desarrolladores de paquetes, oradores, participantes de conferencias, educadores o 
#                         usuarixs.", align = "justify",br()),
#                       
#                       h4(includeHTML("./www/rladies_global.html")),
#                       br(),
#                       
#                       h4("Como iniciativa de diversidad, la misión de R-Ladies es lograr una representación proporcionada alentando,
#                      inspirando y empoderando a las personas de géneros actualmente subrepresentados en la comunidad R.
#                      El enfoque principal de R-Ladies, por lo tanto, es apoyar a los entusiastas del género R de las 
#                      minorías para que logren su potencial de programación, mediante la construcción de una red global
#                      colaborativa de líderes, mentores, estudiantes y desarrolladores de R para facilitar el progreso individual y 
#                      colectivo en todo el mundo.", align = "justify", br())
#                       
#                       
#              )),
#     
#     
#     
#     navbarMenu("Proyecto",
#                tabPanel("25N",
#                         h1(align="center", "Día contra la erradicación de la violencia"),
#                         h2(align="center", "Feminicidios en México"), br(),
#                         h3("De acuerdo a lo que nos ordeno Balu
#                            En 1999, la Asamblea General de la Organización de las Naciones Unidas (ONU) declaró el 𝟐5 de nviembre como un llamado
#                            a gobiernos, organismos, órganos, fondos y programas del Sistema de las Naciones Unidas, es por eso que hoy 𝑹-𝑳𝒂𝒅𝒊𝒆𝒔
#                            𝑮𝑫𝑳, se solidariza y se une visibilizando la violencia ejercida hacia las mujeres en en México, en los próximos #16DiasDeActivismo 
#                            en la cual se presentarán visualizaciones en R.", align = "justify"),
#                         sidebarPanel(
#                             DT::dataTableOutput("dfmapa"), filter="top"),
#                         mainPanel(
#                             plotlyOutput("bagheera")
#                         ),
#                         h4("En 1999, la Asamblea General de la Organización de las Naciones Unidas (ONU) declaró el 𝟐5 de nviembre como un llamado
#                            a gobiernos, organismos, órganos, fondos y programas del Sistema de las Naciones Unidas, es por eso que hoy 𝑹-𝑳𝒂𝒅𝒊𝒆𝒔
#                            𝑮𝑫𝑳, se solidariza y se une visibilizando la violencia ejercida hacia las mujeres en en México, en los próximos #16DiasDeActivismo 
#                            en la cual se presentarán visualizaciones en R.
#                            
#                            
#                            
#                            ", br()))
#     ),
#     
#     
#     #########################################################################
#     
#     tabPanel("Código de conducta", tabName = "codigo", icon = icon("calendar"),
#              h4(includeHTML("./www/codigo_conducta.html")),
#              br()),
#     
#     ########################################################################
#     
#     tabPanel("Contacto", tabName = "contacto", icon = icon("users"),
#              h2(align="center","Redes sociales"),
#              h4(includeHTML("./www/index.html")),
#              br(),
#              h4(includeHTML("./www/organizer.html")),
#              br(),
#              h5("Agradecemos la visita al sitio web, 
#               puede consultar el código abierto en el",(a(target="_blank",href="https://github.com/r-ladiesGdl","repositorio de GitHub")),"de la Shiny elaborado en R.", align = "center",br()))
# )
# 
# 
