##############################################################################
#
#' Re-Evaluating Health Information Needs in Africa during COVID-19
#' 
##############################################################################
#
# GOOGLE TRENDS
#
##############################################################################

#Trends of Searches of specific COVID-19 Remedies on Google in selected Sub-Saharan African countries between 31st December 2019 (When the first COVID case was reported in Wuhan, China)to 31st December 2021.  

###############################################################################
#Nigeria
#

###############################################################################


load("Data/coTreat_trends.RData")




g_plot_func <- function(data){
  
    plot1 <- NULL
    for (i in unique(data$group)) {
    plot1 <- data %>% 
            filter (group == i) %>% 
            mutate (Remedies = stringr::str_to_sentence(Remedies)) %>% 
            ggplot() +
            geom_step(aes(y = interest_over_time.hits, 
                          x = interest_over_time.date,
                          color = Remedies, 
                          linetype = Remedies)) + 
            ggplot2::annotate("rect", xmin = as.POSIXct("2020-03-01", tz= "GMT"),
                     xmax = as.POSIXct("2020-06-30", tz= "GMT"),
                     ymin=0,ymax=100,
                     fill = "#de8c45", alpha = 0.2) +
      
            ggplot2::annotate("rect", xmin = as.POSIXct("2021-11-01", tz= "GMT"),
                              xmax = as.POSIXct("2022-01-31", tz= "GMT"),
                              ymin=0,ymax=100,
                              fill = "#cf29a0", alpha = 0.15) +
      
            scale_y_continuous(limits = c(0,110),
                               breaks = seq(0,100, 10),
                               expand = c(0, 0)) +
            scale_x_datetime(expand = c(0, 0)) +
            theme_minimal(base_family = "barlow",
                          base_size = 40) + 
            labs (x = "Date", y = "Search Interests") +
            theme(legend.position = c(.25, .75),
                  legend.key.height = unit(5.0, "pt"),
                  panel.grid = element_line(linewidth = unit(0.25, "pt"),
                                            linetype = "dashed"),
                  legend.text = element_text(family = "special",
                                             size = 20),
                  legend.title = element_text(family = "special",
                                             size = 25),
                  legend.spacing.y = unit(0.1, 'cm'))
    
    assign(paste0("plot_", i), plot1)
      
    }
    
    plots <- list()
    plots[[1]] <- plot_Orth
    plots[[2]] <- plot_Tradi
    return(grid.arrange(plot_Orth, plot_Tradi, nrow = 2))
  
}

# ft_KE <- g_plot_func(data = trendsKE)
# ft_NG <- g_plot_func(data = trendsNG)
# ft_ZA <- g_plot_func(data = trendsZA)


ggarrange(g_plot_func(data = trendsKE),
          g_plot_func(data = trendsNG),
          g_plot_func(data = trendsZA),
          ncol = 3, hjust = -1,
          labels = c("Kenya", "Nigeria", "South Africa"),
          font.label = list(size = 35, family = "barlow",
                            face = "plain"))

ggsave("Output/tweets_interests.jpg",
       width = 20, height = 11,
       dpi = 200)

###############################################################################
