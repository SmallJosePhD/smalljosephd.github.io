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

#Here we compare the most recommended remedies with Google searches

#From our analysis, the highly recommended remedies include hydrochloroquine, herbal, herbs, agbo, traditional, red oil, Madagascar organic syrup, Alcohol (ogogoro, orijin, Ashanti bitters and alomo bitters), Artemisia (ewe egbin/tazargade/mkpatat/baaba),fruit mix, bitter leaf/ewúro (vernonia amygdalina), weed (Igbo/cannabis/marijuana), Dexamethasone, Remdesivir, Zinc, herb, bleach, Ginger, bitter kola, Ivermectin, neem leaf, Lopinavir, Zithromax, lime, Ritonavir, Vitamin C, Azithromax, Azithromycin, Favipiravir, and Dongonyaro

#It is not possible to consider all remedies. Moreover, gtrends only allow us to include 5 keywords at a time
#So we Stick with the following: chloroquine, Zinc, bleach, vitamin c, herbal, agbo, Madagascar organic syrup (CVO), Remdesivir, Alcohol, Artemisia, weed, bitter leaf, Dexamethasone, HIV drugs, Aviga, Favipiravir, and Zithromax

#Specify the Google Trends query keywords, time span of the query, and the Google product for which the trend query if preformed
time = ("2018-01-31 2022-12-31")
channel = 'web'

#Now let's fix these remedies in a character vector 
##  Nigeria
    keywords1_NG = c('Chloroquine', "Azithromycin", 'Remdesivir', 'Zinc', 'Ivermectin')
    keywords2_NG = c('ginger', 'Herbs', 'Garlic', 'Madagascar covid', 'Bitter Leaf')

##  South Africa
    keywords1_ZA = c('Chloroquine', "Dexamethazone", 'Remdesivir', 'Artemesia', 'Ivermectin')
    keywords2_ZA = c('ginger', 'Herbs', 'Garlic', 'Madagascar organic', 'Beetroot')
    

##  Kenya
    keywords1_KE = c('Chloroquine', "ritonavir", 'Remdesivir', 'Molnupiravir', 'Ivermectin')
    keywords2_KE = c('ginger', 'Herbs', 'Garlic', 'Madagascar organic', 'ayurvedic')
    
    

#We create a universal function for the keywords here 
get_trends <- function(keyword, geo){
  gtrends(keyword = keyword,
          gprop = channel,
          geo = geo,
          hl = "en-US",
          time = time,
          onlyInterest = TRUE)%>%
    data.frame() %>% 
    rename(Remedies = interest_over_time.keyword)%>%
    mutate(interest_over_time.hits = if_else(interest_over_time.hits == "<1", 
                                             true = "0.5", 
                                             false = as.character(interest_over_time.hits)),
           interest_over_time.hits = as.numeric(interest_over_time.hits))
    
    
}


for (i in c("NG", "KE", "ZA")) {
  
  trends <- data.frame()
  for (j in 1:2) {

    tr <- get_trends(get(paste0("keywords", j, "_", i)), i) %>% 
              mutate(group = ifelse(j == 1, "Orth", "Tradi"))
    
    trends <- rbind(trends, tr)
  }
  
  assign(paste0("trends", i), trends)
}



rm(list = grep("^trends", ls(), value = TRUE, invert = TRUE))


save.image("Data/coTreat_trends.RData")







NGtrends_orth %>% 
  ggplot() +
  geom_line(aes(y = interest_over_time.hits, 
                x = interest_over_time.date,
                color = Remedies,
                linetype = Remedies)) + 
  theme_minimal()


#Save the plots
ggsave(NGtrends_plot1, 
       filename ="NG google trend1.png", 
       dpi = 350, 
       bg = "white",
       path = "Output/Plots/GoogleTrends/NG")
ggsave(NGtrends_plot2, 
       filename ="NG google trend2.png", 
       dpi = 350, 
       bg = "white",
       path = "Output/Plots/GoogleTrends/NG")
ggsave(NGtrends_plot3, 
       filename ="NG google trend3.png", 
       dpi = 350, 
       bg = "white",
       path = "Output/Plots/GoogleTrends/NG")
ggsave(NGtrends_plot4, 
       filename ="NG google trend4.png", 
       dpi = 350, 
       bg = "white",
       path = "Output/Plots/GoogleTrends/NG")


###############################################################################
