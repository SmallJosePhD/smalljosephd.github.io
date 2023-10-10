################################################################################
#
#' Re-Evaluating Health Information Needs in Africa during COVID-19
#' 
###############################################################################
#
# PACKAGES INSTALLATION
#
################################################################################

# these are the required packages
pkgs <- c("academictwitteR",
          "tidyverse",
          "tidytext",
          "showtext",
          "stopwords", 
          "wordcloud",
          "wordcloud2",
          "gtrendsR",
          "htmlwidgets",
          "tm",
          "widyr",
          "furrr",
          "irlba",
          "ggplot2",
          "kableExtra",
          "webshot",
          "gridExtra",
          "grid",
          "png",
          "gdata"
)

# replaced w pacman, basically the same
if (!require("pacman", character.only = TRUE)){
  install.packages("pacman", dep = TRUE)
  if (!require("pacman", character.only = TRUE))
    stop("Package not found")
}

# library(pacman)
# if(!sum(!p_isinstalled(pkgs))==0){
#   p_install(
#     package = pkgs[!p_isinstalled(pkgs)], 
#     character.only = TRUE
#   )
# }

p_load(pkgs, character.only = TRUE)
rm(pkgs)

