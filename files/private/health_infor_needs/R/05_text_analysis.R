################################################################################
#
#' Re-Evaluating Health Information Needs in Africa during COVID-19
#' 
###############################################################################
#
# TEXT ANALYSIS AND VISUALISATION
#
###############################################################################


###############################################################################
#
# VISUALISATION OF RECOMMENDED COVID-19 REMEDIES IN NIGERIA  
#
###############################################################################


#The following code plots a scatterplot to visualise the top 20 remedies advanced
#by Nigerians on Twitter
#The results are stored in a ggplot object "cureNG_plot"
cureNG_plot <- cureNG_upt %>%
  count(RRemedies, sort = TRUE) %>% 
  slice(1:17) %>%
  ggplot(aes(n, fct_reorder(RRemedies, n))) +
  geom_point(color = "navyblue", size = 3) +
  geom_segment(aes(xend = 0, yend = RRemedies), color = "navyblue") +
  geom_text(aes(x= n, y = RRemedies, label = n), 
            color = c(rep("grey1", 5),
                      rep("grey50", 10),
                      rep("grey", 2)),
            fontface = "bold",
            vjust = 0.3, hjust = -0.9,
            size = 2.5) +
  labs (x = "Number of Tweets", y = "", title = "Top 20 Recommended COVID-19 Remedies by Nigerians on Twitter") +
  theme_minimal() +
  theme(legend.position = "none",
        plot.title = element_text(lineheight = unit(0.4, "pt"), size = 12, face = "bold", hjust = 0.5),
        plot.subtitle = element_text(size = 10),
        axis.title.x = element_text(face = "bold"),
        panel.grid = element_line(colour = NULL),
        panel.grid.major.y = element_line(colour = "#D2D2D2",linetype = "dashed", size = 0.3),
        panel.grid.major.x = element_line(colour = "#D2D2D2", linetype = "dashed", size = 0.3),
        panel.grid.minor = element_blank(),
        plot.margin = margin(0.3, 0.3, 0.3, -0.1,"cm")) +
  scale_x_continuous(labels = scales::comma)+
  coord_cartesian(xlim = c(0, 650), ylim = )

#View this plot
cureNG_plot

#Save the plot
ggsave(cureNG_plot, 
       filename ="nigerian_top_20_covid_remedies_tweet.png", 
       dpi = 350, 
       height= 7, 
       width= 7,
       bg = "white",
       path = "Output/Plots")

#############################################################################
#WORD CLOUD
#Similar to the code above, the following code creates a word cloud for the top 30 remedies recommended

cureNG_wordcloud <- cureNG_upt %>%
  count(RRemedies, sort = TRUE) %>% 
  slice(1:17) %>%
  wordcloud2(size = 0.405,
             ellipticity = 0.9,
             fontFamily = "Segoe UI",
             shape = 'circle',
             fontWeight = "bold",
             backgroundColor = "white",
             color = rep(c('#214C6F', 'skyblue', 'red', 'blue')))

#Visualise the wordcloud
cureNG_wordcloud 

#Save wordcloud
saveWidget(cureNG_wordcloud,
           "Output/Wordcloud/nigeria_wordcloud.html", 
           selfcontained = FALSE)




###############################################################################
#
# VISUALISATION OF RECOMMENDED COVID-19 REMEDIES IN GHANA  
#
###############################################################################


#The following code plots a scatterplot to visualise the top 20 remedies
#advanced by Ghanians on Twitter
#The results are stored in a ggplot object "cureGH_plot"

cureGH_plot <- cureGH_upt %>%
  count(RRemedies, sort = TRUE) %>% 
  slice(1:30) %>%
  ggplot(aes(n, fct_reorder(RRemedies, n))) +
  geom_point(color = "navyblue", size = 3) +
  geom_segment(aes(xend = 0, yend = RRemedies), color = "navyblue") +
  geom_text(aes(x= n, y = RRemedies, label = n), 
            color = c(rep("grey1", 10),
                      rep("grey50", 10),
                      rep("grey", 10)),
            fontface = "bold",
            vjust = 0.3, hjust = -0.9,
            size = 2.5) +
  labs (x = "Number of Tweets", y = "", title = "Top 30 Recommended COVID-19 Remedies by Ghanians on Twitter") +
  theme_minimal() +
  theme(legend.position = "none",
        plot.title = element_text(lineheight = unit(0.4, "pt"), size = 12, face = "bold", hjust = 0.5),
        plot.subtitle = element_text(size = 10),
        axis.title.x = element_text(face = "bold"),
        panel.grid = element_line(colour = NULL),
        panel.grid.major.y = element_line(colour = "#D2D2D2",linetype = "dashed", size = 0.3),
        panel.grid.major.x = element_line(colour = "#D2D2D2", linetype = "dashed", size = 0.3),
        panel.grid.minor = element_blank(),
        plot.margin = margin(0.3, 0.3, 0.3, -0.1,"cm")) +
  scale_x_continuous(labels = scales::comma)+
  coord_cartesian(xlim = c(0, 650), ylim = )

#View this plot
cureGH_plot

#Save the plot
ggsave(cureGH_plot, 
       filename ="ghanian_top_30_covid_remedies_tweet.png", 
       dpi = 350, 
       height= 7, 
       width= 7,
       bg = "white",
       path = "Output/Plots")

#############################################################################
#WORD CLOUD
#Similar to the code above, the following code creates a word cloud for the top 30 remedies recommended

cureGH_wordcloud <- cureGH_upt %>%
  count(RRemedies, sort = TRUE) %>% 
  slice(1:30) %>%
  wordcloud2(size = 0.405,
             ellipticity = 0.9,
             fontFamily = "Segoe UI",
             shape = 'circle',
             fontWeight = "bold",
             backgroundColor = "white",
             color = rep(c('#214C6F', 'skyblue', 'red', 'blue')))

#Visualise the wordcloud
cureGH_wordcloud 

#Save wordcloud
saveWidget(cureGH_wordcloud,
           "Output/Wordcloud/ghana_wordcloud.html", 
           selfcontained = FALSE)



###############################################################################
#
# VISUALISATION OF RECOMMENDED COVID-19 REMEDIES IN SOUTH AFRICA  
#
###############################################################################


#The following code plots a scatterplot to visualise the top 30 remedies #advanced by South Africans on Twitter
#The results are stored in a ggplot object "cureZA_plot"
cureZA_plot <- cureZA_upt %>%
  count(RRemedies, sort = TRUE) %>% 
  slice(1:30) %>%
  ggplot(aes(n, fct_reorder(RRemedies, n))) +
  geom_point(color = "navyblue", size = 3) +
  geom_segment(aes(xend = 0, yend = RRemedies), color = "navyblue") +
  geom_text(aes(x= n, y = RRemedies, label = n), 
            color = c(rep("grey1", 10),
                      rep("grey50", 10),
                      rep("grey", 10)),
            fontface = "bold",
            vjust = 0.3, hjust = -0.9,
            size = 2.5) +
  labs (x = "Number of Tweets", y = "", title = "Top 30 Recommended COVID-19 Remedies by South Africans on Twitter") +
  theme_minimal() +
  theme(legend.position = "none",
        plot.title = element_text(lineheight = unit(0.4, "pt"), size = 12, face = "bold", hjust = 0.5),
        plot.subtitle = element_text(size = 10),
        axis.title.x = element_text(face = "bold"),
        panel.grid = element_line(colour = NULL),
        panel.grid.major.y = element_line(colour = "#D2D2D2",linetype = "dashed", size = 0.3),
        panel.grid.major.x = element_line(colour = "#D2D2D2", linetype = "dashed", size = 0.3),
        panel.grid.minor = element_blank(),
        plot.margin = margin(0.3, 0.3, 0.3, -0.1,"cm")) +
  scale_x_continuous(labels = scales::comma)+
  coord_cartesian(xlim = c(0, 650), ylim = )

#View this plot
cureZA_plot

#Save the plot
ggsave(cureZA_plot, 
       filename ="south_african_top_30_covid_remedies_tweet.png", 
       dpi = 350, 
       height= 7, 
       width= 7,
       bg = "white",
       path = "Output/Plots")

#############################################################################
#WORD CLOUD
#Similar to the code above, the following code creates a word cloud for the top 30 remedies recommended

cureZA_wordcloud <- cureZA_upt %>%
  count(RRemedies, sort = TRUE) %>% 
  slice(1:30) %>%
  wordcloud2(size = 0.405,
             ellipticity = 0.9,
             fontFamily = "Segoe UI",
             shape = 'circle',
             fontWeight = "bold",
             backgroundColor = "white",
             color = rep(c('#214C6F', 'skyblue', 'red', 'blue')))

#Visualise the wordcloud
cureZA_wordcloud 

#Save wordcloud
saveWidget(cureZA_wordcloud,
           "Output/Wordcloud/south_african_wordcloud.html", 
           selfcontained = FALSE)



###############################################################################
#
# VISUALISATION OF RECOMMENDED COVID-19 REMEDIES IN KENYA  
#
###############################################################################


#The following code plots a scatterplot to visualise the top 30 remedies advanced
#by Kenyans on Twitter
#The results are stored in a ggplot object "cureKE_plot"
cureKE_plot <- cureKE_upt %>%
  count(RRemedies, sort = TRUE) %>% 
  slice(1:30) %>%
  ggplot(aes(n, fct_reorder(RRemedies, n))) +
  geom_point(color = "navyblue", size = 3) +
  geom_segment(aes(xend = 0, yend = RRemedies), color = "navyblue") +
  geom_text(aes(x= n, y = RRemedies, label = n), 
            color = c(rep("grey1", 10),
                      rep("grey50", 10),
                      rep("grey", 10)),
            fontface = "bold",
            vjust = 0.3, hjust = -0.9,
            size = 2.5) +
  labs (x = "Number of Tweets", y = "", title = "Top 30 Recommended COVID-19 Remedies by Kenyans on Twitter") +
  theme_minimal() +
  theme(legend.position = "none",
        plot.title = element_text(lineheight = unit(0.4, "pt"), size = 12, face = "bold", hjust = 0.5),
        plot.subtitle = element_text(size = 10),
        axis.title.x = element_text(face = "bold"),
        panel.grid = element_line(colour = NULL),
        panel.grid.major.y = element_line(colour = "#D2D2D2",linetype = "dashed", size = 0.3),
        panel.grid.major.x = element_line(colour = "#D2D2D2", linetype = "dashed", size = 0.3),
        panel.grid.minor = element_blank(),
        plot.margin = margin(0.3, 0.3, 0.3, -0.1,"cm")) +
  scale_x_continuous(labels = scales::comma)+
  coord_cartesian(xlim = c(0, 650), ylim = )

#View this plot
cureKE_plot

#Save the plot
ggsave(cureKE_plot, 
       filename ="kenyan_top_30_covid_remedies_tweet.png", 
       dpi = 350, 
       height= 7, 
       width= 7,
       bg = "white",
       path = "Output/Plots")

#############################################################################
#WORD CLOUD
#Similar to the code above, the following code creates a word cloud for the top 30 remedies recommended

cureKE_wordcloud <- cureKE_upt %>%
  count(RRemedies, sort = TRUE) %>% 
  slice(1:30) %>%
  wordcloud2(size = 0.405,
             ellipticity = 0.9,
             fontFamily = "Segoe UI",
             shape = 'circle',
             fontWeight = "bold",
             backgroundColor = "white",
             color = rep(c('#214C6F', 'skyblue', 'red', 'blue')))

#Visualise the wordcloud
cureKE_wordcloud 

#Save wordcloud
saveWidget(cureKE_wordcloud,
           "Output/Wordcloud/kenyan_wordcloud.html", 
           selfcontained = FALSE)
=======
################################################################################
#
#' Re-Evaluating Health Information Needs in Africa during COVID-19
#' 
###############################################################################
#
# TEXT ANALYSIS AND VISUALISATION
#
###############################################################################


###############################################################################
#
# VISUALISATION OF RECOMMENDED COVID-19 REMEDIES IN NIGERIA  
#
###############################################################################


#The following code plots a scatterplot to visualise the top 20 remedies advanced
#by Nigerians on Twitter
#The results are stored in a ggplot object "cureNG_plot"
cureNG_plot <- cureNG_upt %>%
  count(RRemedies, sort = TRUE) %>% 
  slice(1:17) %>%
  ggplot(aes(n, fct_reorder(RRemedies, n))) +
  geom_point(color = "navyblue", size = 3) +
  geom_segment(aes(xend = 0, yend = RRemedies), color = "navyblue") +
  geom_text(aes(x= n, y = RRemedies, label = n), 
            color = c(rep("grey1", 5),
                      rep("grey50", 10),
                      rep("grey", 2)),
            fontface = "bold",
            vjust = 0.3, hjust = -0.9,
            size = 2.5) +
  labs (x = "Number of Tweets", y = "", title = "Top 20 Recommended COVID-19 Remedies \n by Nigerians on Twitter") +
  theme_minimal() +
  theme(legend.position = "none",
        plot.title = element_text(lineheight = unit(1.2, "pt"), size = 12, face = "bold", hjust = 0.5),
        plot.subtitle = element_text(size = 10),
        axis.title.x = element_text(face = "bold"),
        panel.grid = element_line(colour = NULL),
        panel.grid.major.y = element_line(colour = "#D2D2D2",linetype = "dashed", size = 0.3),
        panel.grid.major.x = element_line(colour = "#D2D2D2", linetype = "dashed", size = 0.3),
        panel.grid.minor = element_blank(),
        plot.margin = margin(0.3, 0.3, 0.3, -0.1,"cm")) +
  scale_x_continuous(labels = scales::comma)+
  coord_cartesian(xlim = c(0, 650), ylim = )

#View this plot
cureNG_plot

#Save the plot
ggsave(cureNG_plot, 
       filename ="nigerian_top_20_covid_remedies_tweet.png", 
       dpi = 350, 
       bg = "white",
       path = "Output/Plots")

#############################################################################
#WORD CLOUD
#Similar to the code above, the following code creates a word cloud for the top 30 remedies recommended

cureNG_wordcloud <- cureNG_upt %>%
  count(RRemedies, sort = TRUE) %>% 
  slice(1:17) %>%
  wordcloud2(size = 0.38,
             ellipticity = 0.9,
             fontFamily = "Segoe UI",
             shape = 'circle',
             fontWeight = "bold",
             backgroundColor = "white",
             color = rep(c('#214C6F', 'skyblue', 'red', 'blue')))

#Visualise the wordcloud
cureNG_wordcloud 

#Save wordcloud output as HTML
saveWidget(cureNG_wordcloud,
           "Output/Wordcloud/nigeria_wordcloud.html", 
           selfcontained = FALSE)

#Convert the HTML to image (the quality is poor)
webshot(url = "Output/Wordcloud/nigeria_wordcloud.html",
        delay = 15,
        cliprect = "viewport",
        file = "Output/Wordcloud/nigeria__wordcloud.png")


################################################################################
#SELECTED REMEDIES
################################################################################

cureNG_rem_plot <- cureNG_rem %>%
  mutate(Remedies = case_when(str_detect(Remedies, "Herbal|Herbs|Local|Agbo|Traditional|Herb|Jedi|Utaba|Trados|Gargaja|Eyin|Dongonyaro|Dongoyaro|Dogoyaro|Agunmun") ~ "Herbs",
                              str_detect(Remedies, "Madagascar organic syrup") ~ "Madagascar Organic Syrup",
                              Remedies == "Artemisia (ewe egbin/tazargade/mkpatat/baaba)" ~ "Artemisia",
                              str_detect(Remedies, "Garlic|Onion|Onions") ~ "Garlic and onions",
                              str_detect(Remedies, "Bleach|Hypo") ~ "Bleach",
                              Remedies == "Bitter leaf/ewúro (vernonia amygdalina)" ~ "Bitter leaf",
                              str_detect(Remedies, "Fruit|Fruits|Carrot|Pineapple|Cashew|Mango|Pawpaw|Orange") ~ "Fruits",
                              str_detect(Remedies,"Vit|Vitamin|Vita|Vitamins") ~ "Vitamin C",
                              str_detect(Remedies, "Azithromax|Azithromycin|Zithromax|Azythromicin") ~ "Azithromycin",
                              str_detect(Remedies, "Remdecivir|Remdesiviri|Remdesvir") ~ "Remdesivir",
                              str_detect(Remedies, "Retonovir|Ritonavir") ~ "Ritonavir",
                              str_detect(Remedies, "Chlorine") ~ "Hydrochlorine",
                              TRUE ~ Remedies))%>%
  count(Remedies, sort = TRUE)%>%
  slice(1:30)%>%
  ggplot(aes(n, fct_reorder(Remedies, n))) +
  geom_point(color = "navyblue", size = 1.5) +
  geom_segment(aes(xend = 0, yend = Remedies), color = "navyblue") +
  geom_text(aes(x= n, y = Remedies, label = n), 
            color = c(rep("grey1", 10),
                      rep("grey50", 10),
                      rep("grey", 10)),
            fontface = "bold",
            vjust = 0.3, hjust = -0.9,
            size = 2.5) +
  labs (x = "Number of Tweets", y = "", title = "Top 30 Recommended COVID-19 Remedies \n by Nigerians on Twitter") +
  theme_minimal() +
  theme(legend.position = "none",
        plot.title = element_text(lineheight = unit(1.2, "pt"), size = 12, face = "bold", hjust = 0.5),
        plot.subtitle = element_text(size = 10),
        axis.title.x = element_text(face = "bold"),
        panel.grid = element_line(colour = NULL),
        panel.grid.major.y = element_line(colour = "#D2D2D2",linetype = "dashed", size = 0.3),
        panel.grid.major.x = element_line(colour = "#D2D2D2", linetype = "dashed", size = 0.3),
        panel.grid.minor = element_blank(),
        plot.margin = margin(0.3, 0.3, 0.3, -0.1,"cm")) +
  scale_x_continuous(labels = scales::comma)+
  coord_cartesian(xlim = c(0, 650), ylim = )

#View this plot
cureNG_rem_plot

#Save the plot
ggsave(cureNG_rem_plot, 
       filename ="nigerian_top_30_covid_remedies_tweet.png", 
       dpi = 350, 
       bg = "white",
       path = "Output/Plots/New")



###############################################################################
#
# VISUALISATION OF RECOMMENDED COVID-19 REMEDIES IN GHANA  
#
###############################################################################


#The following code plots a scatterplot to visualise the top 20 remedies
#advanced by Ghanians on Twitter
#The results are stored in a ggplot object "cureGH_plot"

cureGH_plot <- cureGH_upt %>%
  mutate(RRemedies = case_when(str_detect(RRemedies, "Sex|Sexiness|Semen") ~ "Sex/Sperm",
                              str_detect(RRemedies, 'Weed|Marijuana') ~ "Weed/Marijuana",
                              str_detect(RRemedies, "Waakye|Fufu|Banku") ~ "Food (Waakye/fufu/banku)",
                              str_detect(RRemedies, "Akpeteshie|Alcohol|Achohol|Akpeteshi") ~ "Alcohol (Akpeteshie)",
                              str_detect(RRemedies, "Adonko|Adutwumwaa") ~ "Adonko & Adutwumwaa bitters",
                              str_detect(RRemedies, "Apio|Mouthwash|Dettol") ~ "Others (Dettol/Mouthwash/Apio)",
                              str_detect(RRemedies, "Fruit|Lemon|Ginger|Sobolo") ~ "Fruit (Inc. Lemon, Ginger & Sobolo)",
                              str_detect(RRemedies, "Garlic|Onions") ~ "Onions & Garlic",
                              TRUE ~ RRemedies))%>%
  count(RRemedies, sort = TRUE)%>%
  slice(1:30) %>%
  ggplot(aes(n, fct_reorder(RRemedies, n))) +
  geom_point(color = "navyblue", size = 2) +
  geom_segment(aes(xend = 0, yend = RRemedies), color = "navyblue") +
  geom_text(aes(x= n, y = RRemedies, label = n), 
            color = c(rep("grey1", 10),
                      rep("grey50", 10),
                      rep("grey", 10)),
            fontface = "bold",
            vjust = 0.3, hjust = -0.9,
            size = 2.5) +
  labs (x = "Number of Tweets", y = "", title = "Top 30 Recommended COVID-19 Remedies \n by Ghanians on Twitter") +
  theme_minimal() +
  theme(legend.position = "none",
        plot.title = element_text(lineheight = unit(0.9, "pt"), size = 12, face = "bold", hjust = 0.5),
        plot.subtitle = element_text(size = 10),
        axis.title.x = element_text(face = "bold"),
        panel.grid = element_line(colour = NULL),
        panel.grid.major.y = element_line(colour = "#D2D2D2",linetype = "dashed", size = 0.3),
        panel.grid.major.x = element_line(colour = "#D2D2D2", linetype = "dashed", size = 0.3),
        panel.grid.minor = element_blank(),
        plot.margin = margin(0.3, 0.3, 0.3, -0.1,"cm")) +
  scale_x_continuous(labels = scales::comma)+
  coord_cartesian(xlim = c(0, 650), ylim = )

#View this plot
cureGH_plot

#Save the plot
ggsave(cureGH_plot, 
       filename ="ghanian_top_30_covid_remedies_tweet.png", 
       dpi = 350,
       bg = "white",
       path = "Output/Plots")

#############################################################################
#WORD CLOUD
#Similar to the code above, the following code creates a word cloud for the top 30 remedies recommended

cureGH_wordcloud <- cureGH_upt %>%
  mutate(RRemedies = case_when(RRemedies == "Madagascar COVID Organic (CVO)" ~ "CVO",
         TRUE ~ RRemedies))%>%
  count(RRemedies, sort = TRUE) %>% 
  slice(1:30)%>% 
  wordcloud2(size = 0.505,
             ellipticity = 0.1,
             fontFamily = "Segoe UI",
             shape = 'circle',
             fontWeight = "bold",
             backgroundColor = "white",
             color = rep(c('#214C6F', 'skyblue', 'red', 'blue')))

#Visualise the wordcloud
cureGH_wordcloud 

#Save wordcloud
saveWidget(cureGH_wordcloud,
           "Output/Wordcloud/ghana_wordcloud.html", 
           selfcontained = FALSE)


################################################################################
#SELECTED REMEDIES
################################################################################

cureGH_rem_plot <- cureGH_rem %>%
  mutate(RRemedies = case_when(str_detect(RRemedies, "Garlic|Onions") ~ "Garlic and Onions",
                              str_detect(RRemedies, "Azithromycin|Zithromax") ~ "Azithromycin",
                              str_detect(RRemedies, "Adonko bitters|Adutwumwaa bitters") ~ "Adonko and Adutwumwaa bitters",
                              str_detect(RRemedies, "Herbal Medicine") ~ "Herbs",
                              TRUE ~ RRemedies))%>%
  count(RRemedies, sort = TRUE)%>%
  slice(1:30)%>%
  ggplot(aes(n, fct_reorder(RRemedies, n))) +
  geom_point(color = "navyblue", size = 1.5) +
  geom_segment(aes(xend = 0, yend = RRemedies), color = "navyblue") +
  geom_text(aes(x= n, y = RRemedies, label = n), 
            color = c(rep("grey1", 7),
                      rep("grey50", 10),
                      rep("grey", 5)),
            fontface = "bold",
            vjust = 0.3, hjust = -0.9,
            size = 2.5) +
  labs (x = "Number of Tweets", y = "", title = "Top 30 Recommended COVID-19 Remedies \n by Ghanians on Twitter") +
  theme_minimal() +
  theme(legend.position = "none",
        plot.title = element_text(lineheight = unit(1.2, "pt"), size = 12, face = "bold", hjust = 0.5),
        plot.subtitle = element_text(size = 10),
        axis.title.x = element_text(face = "bold"),
        panel.grid = element_line(colour = NULL),
        panel.grid.major.y = element_line(colour = "#D2D2D2",linetype = "dashed", size = 0.3),
        panel.grid.major.x = element_line(colour = "#D2D2D2", linetype = "dashed", size = 0.3),
        panel.grid.minor = element_blank(),
        plot.margin = margin(0.3, 0.3, 0.3, -0.1,"cm")) +
  scale_x_continuous(labels = scales::comma)+
  coord_cartesian(xlim = c(0, 650), ylim = )

#View this plot
cureGH_rem_plot

#Save the plot
ggsave(cureGH_rem_plot, 
       filename ="ghanian_top_30_covid_remedies_tweet.png", 
       dpi = 350, 
       bg = "white",
       path = "Output/Plots/New")




###############################################################################
#
# VISUALISATION OF RECOMMENDED COVID-19 REMEDIES IN KENYA  
#
###############################################################################


#The following code plots a scatterplot to visualise the top 30 remedies advanced
#by Kenyans on Twitter
#The results are stored in a ggplot object "cureKE_plot"
cureKE_plot <- cureKE_upt %>%
  mutate(RRemedies = case_when(str_detect(RRemedies, "Ginger|Lemon|Limau|Bananas|Fruits|Lime|Sugarcane") ~ "Fruits",
                               str_detect(RRemedies, 'Disinfectants|Bleach|Detergents') ~ "Disinfectants & Detergents",
                               str_detect(RRemedies, "Antihistamine|Antihistamines|Cetirizine") ~ "Antihistamine",
                               str_detect(RRemedies, "Herbal|Turmeric|Veg|Wanjiru wa rurii|Aloe Vera|Mwarubaine|Garlic|Artemesia") ~ "Herbs (Inc. Tumeric, Aloe Vera & Veggies)",
                               str_detect(RRemedies, "Olive oil|Ocean water|Mint") ~ "Others (Mint, Olive oil, & Ocean water)",
                               str_detect(RRemedies, "Lachrymatory|Protease inhibitor") ~ "Lachrymatory & Protease inhibitor",
                               str_detect(RRemedies, "Theobromine|Methylxanthine|Theophylline") ~ "Theobromine, methylxanthine & theophylline", 
                               str_detect(RRemedies, "Alcohol|Methanol") ~ "Alcohol",
                               str_detect(RRemedies, "Lopinavir|Retonovir|Oseltamivir|Protease") ~ "HIV antiretrovals (Lopinavir/ ritonavir)",
                               str_detect(RRemedies, "Azithromycin|Erythromycin|Nitazoxanide") ~ "Antibiotics (azithromycin/erythromycin/nitazoxanide)",
                               str_detect(RRemedies, "Paracetamol|Vitamin C & D|Zinc") ~ "Vitamin C & D, Paracetamol, & Zinc",
                               TRUE ~ RRemedies))%>%
  count(RRemedies, sort = TRUE)%>%
  slice(1:40)%>%
  ggplot(aes(n, fct_reorder(RRemedies, n))) +
  geom_point(color = "navyblue", size = 2) +
  geom_segment(aes(xend = 0, yend = RRemedies), color = "navyblue") +
  geom_text(aes(x= n, y = RRemedies, label = n), 
            color = c(rep("grey1", 10),
                      rep("grey50", 14),
                      rep("grey", 10)),
            fontface = "bold",
            vjust = 0.3, hjust = -0.9,
            size = 2.5) +
  labs (x = "Number of Tweets", y = "", title = "Top 30 Recommended COVID-19 Remedies \n by Kenyans on Twitter") +
  theme_minimal() +
  theme(legend.position = "none",
        plot.title = element_text(lineheight = unit(0.9, "pt"), size = 12, face = "bold", hjust = 0.5),
        plot.subtitle = element_text(size = 10),
        axis.title.x = element_text(face = "bold"),
        panel.grid = element_line(colour = NULL),
        panel.grid.major.y = element_line(colour = "#D2D2D2",linetype = "dashed", size = 0.3),
        panel.grid.major.x = element_line(colour = "#D2D2D2", linetype = "dashed", size = 0.3),
        panel.grid.minor = element_blank(),
        plot.margin = margin(0.3, 0.3, 0.3, -0.1,"cm")) +
  scale_x_continuous(labels = scales::comma)+
  coord_cartesian(xlim = c(0, 650), ylim = )


#View this plot
cureKE_plot

#Save the plot
ggsave(cureKE_plot, 
       filename ="kenyan_top_30_covid_remedies_tweet.png", 
       dpi = 350,
       bg = "white",
       path = "Output/Plots")

#############################################################################
#WORD CLOUD
#Similar to the code above, the following code creates a word cloud for the top 40 remedies recommended

cureKE_wordcloud <- cureKE_upt %>%
  mutate(RRemedies = case_when(RRemedies == "Chloroquine/Hydrochloroquine" ~ "Chloroquine",
                               RRemedies == "Religiousity (God, Allah, & Worship)" ~ "Religiousity",
                               RRemedies == "Madagascar COVID Organic (CVO)" ~ "Madagascar CVO",
                               TRUE ~ RRemedies))%>%
  count(RRemedies, sort = TRUE) %>% 
  slice(1:50)%>% 
  wordcloud2(size = 0.405,
             ellipticity = 0.9,
             fontFamily = "Segoe UI",
             shape = 'circle',
             fontWeight = "bold",
             backgroundColor = "white",
             color = rep(c('#214C6F', 'skyblue', 'red', 'blue')))

#Visualise the wordcloud
cureKE_wordcloud 

#Save wordcloud
saveWidget(cureKE_wordcloud,
           "Output/Wordcloud/kenyan_wordcloud.html", 
           selfcontained = FALSE)


################################################################################
#SELECTED REMEDIES
################################################################################

cureKE_rem_plot <- cureKE_rem %>%
  mutate(RRemedies = case_when(str_detect(RRemedies, "Paracetamol|Paracetamols") ~ "Paracetamol",
                               str_detect(RRemedies, "Lime|Limau") ~ "Azithromycin",
                               str_detect(RRemedies, "Fruits|Sugarcane|Bananas") ~ "Fruits",
                               str_detect(RRemedies, "Mwarubaine") ~ "Neem tree",
                               str_detect(RRemedies, "Herbal|Wanjiru wa rurii|Veg") ~ "Herbs",
                               str_detect(RRemedies, "Prozac") ~ "Fluoxetine (Prozac)",
                               str_detect(RRemedies, "Lemons|Lemon") ~ "Lemon",
                               str_detect(RRemedies, "Favipiravir|Avigan") ~ "Favipiravir (Avigan)",
                               TRUE ~ RRemedies))%>%
  count(RRemedies, sort = TRUE)%>%
  slice(1:30)%>%
  ggplot(aes(n, fct_reorder(RRemedies, n))) +
  geom_point(color = "navyblue", size = 1.1) +
  geom_segment(aes(xend = 0, yend = RRemedies), color = "navyblue") +
  geom_text(aes(x= n, y = RRemedies, label = n), 
            color = c(rep("grey1", 10),
                      rep("grey50", 10),
                      rep("grey", 10)),
            fontface = "bold",
            vjust = 0.3, hjust = -0.9,
            size = 2.5) +
  labs (x = "Number of Tweets", y = "", title = "Top 30 Recommended COVID-19 Remedies \n by Kenyans on Twitter") +
  theme_minimal() +
  theme(legend.position = "none",
        plot.title = element_text(lineheight = unit(1.2, "pt"), size = 12, face = "bold", hjust = 0.5),
        plot.subtitle = element_text(size = 10),
        axis.title.x = element_text(face = "bold"),
        panel.grid = element_line(colour = NULL),
        panel.grid.major.y = element_line(colour = "#D2D2D2",linetype = "dashed", size = 0.3),
        panel.grid.major.x = element_line(colour = "#D2D2D2", linetype = "dashed", size = 0.3),
        panel.grid.minor = element_blank(),
        plot.margin = margin(0.3, 0.3, 0.3, -0.1,"cm")) +
  scale_x_continuous(labels = scales::comma)+
  coord_cartesian(xlim = c(0, 650), ylim = )

#View this plot
cureKE_rem_plot

#Save the plot
ggsave(cureKE_rem_plot, 
       filename ="kenyan_top_30_covid_remedies_tweet.png", 
       dpi = 350, 
       bg = "white",
       path = "Output/Plots/New")
###############################################################################
#




###############################################################################
#
# VISUALISATION OF RECOMMENDED COVID-19 REMEDIES IN SOUTH AFRICA  
#
###############################################################################

#The following code plots a scatterplot to visualise the top 30 remedies #advanced by South Africans on Twitter
#The results are stored in a ggplot object "cureZA_plot"
cureZA_plot <- cureZA_upt %>%
  mutate(RRemedies = case_when(str_detect(RRemedies, "Beetroot|Orange|Fruit") ~ "Fruits",
                               str_detect(RRemedies, "God|Prayer|Hadith") ~ "Religiousity",
                               str_detect(RRemedies,"Spicey Indian foods|Food|Bread") ~ "Food",
                               str_detect(RRemedies, "Dexamethasone|Azithromycin|Oseltamivir") ~ "Dexamethasone/Azithromycin/Oseltamivir",
                               str_detect(RRemedies, "Avigan|Remdesivir") ~ "Remdesivir/Favipiravir",
                               str_detect(RRemedies, "Convalescent plasma|Therapeutic") ~ "Therapeutic (inc. Convalescent plasma therapy)",
                               str_detect(RRemedies, "Nevirapine|Lopinavir and Ritonavir") ~ "Lopinavir/Ritonavir & Nevirapine",
                               str_detect(RRemedies, "Lemon|Ginger|Honey") ~ "Lemon, ginger & honey",
                               str_detect(RRemedies, "Lysol and Dettol|Bleach & disinfectants") ~ "Bleach & disinfectants (Lysol/Dettol)",
                               str_detect(RRemedies, "Moringa|Herbs and Herbal Solutions|Stameta|Quercetin|Turlington|Aloe vera gel") ~ "Herbs and Herbal Solutions",
                               str_detect(RRemedies, "Cough syrup|Multivitamin|Ibuprofen") ~ "Cough syrup/Multivitamin/Ibuprofen",
                               str_detect(RRemedies, "Sugars|Bicarbonate|Shampoo") ~ "Sugars/Bicarbonate/Shampoo",
                               str_detect(RRemedies, "Honeybush|Medlemon") ~
"Honeybush & Medlemon",
                               TRUE ~ RRemedies))%>%
  count(RRemedies, sort = TRUE)%>%
  slice(1:30) %>%
  ggplot(aes(n, fct_reorder(RRemedies, n))) +
  geom_point(color = "navyblue", size = 1.5) +
  geom_segment(aes(xend = 0, yend = RRemedies), color = "navyblue") +
  geom_text(aes(x= n, y = RRemedies, label = n), 
            color = c(rep("grey1", 10),
                      rep("grey50", 10),
                      rep("grey", 10)),
            fontface = "bold",
            vjust = 0.3, hjust = -2,
            size = 2.5) +
  labs (x = "Number of Tweets", y = "", title = "Top 30 Recommended COVID-19 Remedies \n by South Africans on Twitter") +
  theme_minimal() +
  theme(legend.position = "none",
      plot.title = element_text(lineheight = unit(0.9, "pt"), size = 12, face = "bold", hjust = 0.5),
      plot.subtitle = element_text(size = 10),
      axis.title.x = element_text(face = "bold"),
      panel.grid = element_line(colour = NULL),
      panel.grid.major.y = element_line(colour = "#D2D2D2",linetype = "dashed", size = 0.3),
      panel.grid.major.x = element_line(colour = "#D2D2D2", linetype = "dashed", size = 0.3),
      panel.grid.minor = element_blank(),
      plot.margin = margin(0.3, 0.3, 0.3, -0.1,"cm")) +
  scale_x_continuous(labels = scales::comma)+
  coord_cartesian(xlim = c(0, 650), ylim = )


#View this plot
cureZA_plot

#Save the plot
ggsave(cureZA_plot, 
       filename ="south_african_top_30_covid_remedies_tweet.png", 
       dpi = 350, 
       bg = "white",
       path = "Output/Plots")

#############################################################################
#WORD CLOUD
#Similar to the code above, the following code creates a word cloud for the top 30 remedies recommended

cureZA_wordcloud <- cureZA_upt %>%
  count(RRemedies, sort = TRUE) %>% 
  slice(1:50) %>%
  wordcloud2(size = 0.405,
             ellipticity = 0.9,
             fontFamily = "Segoe UI",
             shape = 'circle',
             fontWeight = "bold",
             backgroundColor = "white",
             color = rep(c('#214C6F', 'skyblue', 'red', 'blue')))

#Visualise the wordcloud
cureZA_wordcloud 

#Save wordcloud
saveWidget(cureZA_wordcloud,
           "Output/Wordcloud/south_african_wordcloud.html", 
           selfcontained = FALSE)



################################################################################
#SELECTED REMEDIES
################################################################################

cureZA_rem_plot <- cureZA_rem %>%
  mutate(RRemedies = case_when(str_detect(RRemedies, "Lemon|Medlemon") ~ "Paracetamol",
                               str_detect(RRemedies, "Fruit|Orange") ~ "Fruits",
                               str_detect(RRemedies, "Artemisia (Mugworts/Umhlonyane)") ~ "Artemisia (Mugworts/Umhlonyane)",
                               str_detect(RRemedies, "Vitamin D & C") ~ "Vitamin C & D",
                               TRUE ~ RRemedies))%>%
  count(RRemedies, sort = TRUE)%>%
  slice(1:30)%>%
  ggplot(aes(n, fct_reorder(RRemedies, n))) +
  geom_point(color = "navyblue", size = 1.1) +
  geom_segment(aes(xend = 0, yend = RRemedies), color = "navyblue") +
  geom_text(aes(x= n, y = RRemedies, label = n), 
            color = c(rep("grey1", 10),
                      rep("grey50", 10),
                      rep("grey", 10)),
            fontface = "bold",
            vjust = 0.3, hjust = -0.9,
            size = 2.5) +
  labs (x = "Number of Tweets", y = "", title = "Top 30 Recommended COVID-19 Remedies \n by South Africans on Twitter") +
  theme_minimal() +
  theme(legend.position = "none",
        plot.title = element_text(lineheight = unit(1.2, "pt"), size = 12, face = "bold", hjust = 0.5),
        plot.subtitle = element_text(size = 10),
        axis.title.x = element_text(face = "bold"),
        panel.grid = element_line(colour = NULL),
        panel.grid.major.y = element_line(colour = "#D2D2D2",linetype = "dashed", size = 0.3),
        panel.grid.major.x = element_line(colour = "#D2D2D2", linetype = "dashed", size = 0.3),
        panel.grid.minor = element_blank(),
        plot.margin = margin(0.3, 0.3, 0.3, -0.1,"cm")) +
  scale_x_continuous(labels = scales::comma)+
  coord_cartesian(xlim = c(0, 650), ylim = )

#View this plot
cureZA_rem_plot

#Save the plot
ggsave(cureZA_rem_plot, 
       filename ="South_African_top_30_covid_remedies_tweet.png", 
       dpi = 350, 
       bg = "white",
       path = "Output/Plots/New")
###############################################################################
#
>>>>>>> ee098c0b0097acfdf72f6273e7ea7b6ccaaef865
