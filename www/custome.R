pacman::p_load(shiny, shinydashboard, dashboardthemes, shinyWidgets, tidyverse, rebus, scales, png)

fuentes_Sys <- list.files("~/Library/Fonts/") %>% 
  str_remove_all(pattern = "." %R% capture(one_or_more(WRD)) %R% END)


customTheme <- shinyDashboardThemeDIY(
  
  ### General
  appFontFamily = "Nutmeg-Book",
  appFontColor = "#000000",
  primaryFontColor = "#000000",
  infoFontColor = "#000000",
  successFontColor = "#000000",
  warningFontColor = "#000000",
  dangerFontColor = "#000000",
  bodyBackColor = "##ffffff",
  
  ### Encabezado
  logoBackColor = "#751b7a",
  
  headerButtonBackColor = "#751b7a",
  headerButtonIconColor = "#ffffff",
  headerButtonBackColorHover = "#751b7a",
  headerButtonIconColorHover = "#751b7a",
  
  headerBackColor =  "#751b7a",
  headerBoxShadowColor = "#aaaaaa",
  headerBoxShadowSize = "2px 2px 2px"
  
  ### sidebar
  ,sidebarBackColor = cssGradientThreeColors(
    direction = "down"
    ,colorStart = "#751b7a"
    ,colorMiddle = "#751b7a"
    ,colorEnd = "#751b7a"
    ,colorStartPos = 0
    ,colorMiddlePos = 50
    ,colorEndPos = 100
  )
  ,sidebarPadding = 0
  
  ,sidebarMenuBackColor = "transparent"
  ,sidebarMenuPadding = 0
  ,sidebarMenuBorderRadius = 0
  
  ,sidebarShadowRadius = "3px 3px 3px"
  ,sidebarShadowColor = "#aaaaaa"
  
  ,sidebarUserTextColor = "#751b7a"
  
  ,sidebarSearchBackColor = "#7a5b87"
  ,sidebarSearchIconColor = "#999999"
  ,sidebarSearchBorderColor = "#7a5b87"
  
  ,sidebarTabTextColor = "rgb(255,255,255)"
  ,sidebarTabTextSize = 13
  ,sidebarTabBorderStyle = "none none solid none"
  ,sidebarTabBorderColor = "#751b7a"
  ,sidebarTabBorderWidth = 1
  
  ,sidebarTabBackColorSelected = cssGradientThreeColors(
    direction = "right"
    ,colorStart = "#7b3e80"
    ,colorMiddle = "#964c9c"
    ,colorEnd = "#a555ab"
    ,colorStartPos = 0
    ,colorMiddlePos = 30
    ,colorEndPos = 100
  )
  ,sidebarTabTextColorSelected = "#000000"
  ,sidebarTabRadiusSelected = "0px 20px 20px 0px"
  
  #Barra lateral-touch
  ,sidebarTabBackColorHover = cssGradientThreeColors(
    direction = "right"
    ,colorStart = "rgb(187, 132, 191, 0.2)"
    ,colorMiddle = "rgb(152, 96, 156, 0.2)"
    ,colorEnd = "rgb(165, 85, 171, 0.2)"
    ,colorStartPos = 0
    ,colorMiddlePos = 30
    ,colorEndPos = 100
  )
  ,sidebarTabTextColorHover = "#7b3e80"
  ,sidebarTabBorderStyleHover = "none none solid none"
  ,sidebarTabBorderColorHover = "#a555ab"
  ,sidebarTabBorderWidthHover = 1
  ,sidebarTabRadiusHover = "0px 20px 20px 0px"
  
  ### boxes
  ,boxBackColor = "#fffff"
  ,boxBorderRadius = 5
  ,boxShadowSize = "0px 1px 1px"
  ,boxShadowColor = "#7b3e80"
  ,boxTitleSize = 16
  ,boxDefaultColor = "#a555ab"
  ,boxPrimaryColor = "rgba(44,222,235,1)"
  ,boxInfoColor = "#a555ab"
  ,boxSuccessColor = "rgba(0,255,213,1)"
  ,boxWarningColor = "#c072c4"
  ,boxDangerColor = "rgb(255,88,55)"
  
  ,tabBoxTabColor = "#7b3e80"
  ,tabBoxTabTextSize = 14
  ,tabBoxTabTextColor = "#000000"
  ,tabBoxTabTextColorSelected = "#000000"
  ,tabBoxBackColor = "rgb(255,255,255)"
  ,tabBoxHighlightColor = "#7b3e80"
  ,tabBoxBorderRadius = 5
  
  ### inputs
  ,buttonBackColor = "#7b3e80"
  ,buttonTextColor = "#000000"
  ,buttonBorderColor = "rgb(200,200,200)"
  ,buttonBorderRadius = 5
  
  ,buttonBackColorHover = "rgb(235,235,235)"
  ,buttonTextColorHover = "rgb(100,100,100)"
  ,buttonBorderColorHover = "rgb(200,200,200)"
  
  ,textboxBackColor = "rgb(255,255,255)"
  ,textboxBorderColor = "rgb(200,200,200)"
  ,textboxBorderRadius = 5
  ,textboxBackColorSelect = "rgb(245,245,245)"
  ,textboxBorderColorSelect = "rgb(200,200,200)"
  
  ### tables
  ,tableBackColor = "#7b3e80"
  ,tableBorderColor = "#7b3e80"
  ,tableBorderTopSize = 1
  ,tableBorderRowSize = 1
  
)
customLogo <- shinyDashboardLogoDIY(
  boldText = "R - Ladies"
  ,mainText = "Guadalajara"
  ,textSize = 16
  ,badgeText  = icon("chart-line")
  ,badgeTextColor = "white"
  ,badgeTextSize = 2
  ,badgeBackColor = "#91298d"
  ,badgeBorderRadius = 3
)


