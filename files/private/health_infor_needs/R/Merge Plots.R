##############################################################################
#
#' Re-Evaluating Health Information Needs in Africa during COVID-19
#' 
##############################################################################
#
# PLOT MERGER
#
##############################################################################
##


# Load the pictures you want to merge
img1 <- readPNG("C:/Users/Michael Ehinmowo/OneDrive/Pictures/SICSS-CU-2022_Text_Analysis_Group/Output/Plots/New/ghanian_top_30_covid_remedies_tweet.png")
img2 <- readPNG("C:/Users/Michael Ehinmowo/OneDrive/Pictures/SICSS-CU-2022_Text_Analysis_Group/Output/Plots/New/kenyan_top_30_covid_remedies_tweet.png")
img3 <- readPNG("C:/Users/Michael Ehinmowo/OneDrive/Pictures/SICSS-CU-2022_Text_Analysis_Group/Output/Plots/New/nigerian_top_30_covid_remedies_tweet.png")
img4 <- readPNG("C:/Users/Michael Ehinmowo/OneDrive/Pictures/SICSS-CU-2022_Text_Analysis_Group/Output/Plots/New/South_African_top_30_covid_remedies_tweet.png")

# Convert images to grobs
grob1 <- rasterGrob(img1)
grob2 <- rasterGrob(img2)
grob3 <- rasterGrob(img3)
grob4 <- rasterGrob(img4)

# arrange the grob side by side
grid.arrange(grob1, grob2, grob3, grob4, ncol = 2)

# assign the merged images to a new object

Top30 <- grid.arrange(grob1, grob2, grob3, grob4, ncol = 2)

# Save the combined picture to a file
ggsave(Top30, 
       filename ="combined top30.png", 
       dpi = 350,
       bg = "white",
       path = "Output/Plots")

(combined_pic, "C:/Users/Michael Ehinmowo/OneDrive/Pictures/SICSS-CU-2022_Text_Analysis_Group/Output/Plots/New")


#### Put the google trend plots in grid

# first for South Africa

SA.Gplot1 <- readPNG("C:/Users/Michael Ehinmowo/OneDrive/Pictures/SICSS-CU-2022_Text_Analysis_Group/Output/Plots/GoogleTrends/South Africa/1South Africa gtrend plot1.png")
SA.Gplot2 <- readPNG("C:/Users/Michael Ehinmowo/OneDrive/Pictures/SICSS-CU-2022_Text_Analysis_Group/Output/Plots/GoogleTrends/South Africa/2South Africa gtrend plot2.png")
SA.Gplot3 <- readPNG("C:/Users/Michael Ehinmowo/OneDrive/Pictures/SICSS-CU-2022_Text_Analysis_Group/Output/Plots/GoogleTrends/South Africa/South Africa gtrend plot3.png")

# convert pictures to grobs

sa.grob1 <- rasterGrob(SA.Gplot1)
sa.grob2 <- rasterGrob(SA.Gplot2)
sa.grob3 <- rasterGrob(SA.Gplot3)

# arrange grobs in three columns of one row

saplots <- grid.arrange(sa.grob1, sa.grob2, sa.grob3, ncol = 3)

ggsave(saplots, 
       filename ="South African Google plots.png", 
       dpi = 350,
       bg = "white",
       path = "Output/Plots")

# Then merge for Ghana

GH.Gplot1 <- readPNG("C:/Users/Michael Ehinmowo/OneDrive/Pictures/SICSS-CU-2022_Text_Analysis_Group/Output/Plots/GoogleTrends/GH/1Ghana gtrend plot1.png")
GH.Gplot2 <- readPNG("C:/Users/Michael Ehinmowo/OneDrive/Pictures/SICSS-CU-2022_Text_Analysis_Group/Output/Plots/GoogleTrends/GH/2Ghana gtrend plot2.png")

# convert plots to grobs

gh.grob1 <- rasterGrob(GH.Gplot1)
gh.grob2 <- rasterGrob(GH.Gplot2)

# assign the grid rearrangement to an object

gh.plots <- grid.arrange(gh.grob1, gh.grob2, ncol = 2)

ggsave(gh.plots,
       filename ="Ghana Google plots.png", 
       dpi = 350,
       bg = "white",
       path = "Output/Plots"
  
)

# Merge plots for Kenya

KY.Gplot1 <- readPNG("C:/Users/Michael Ehinmowo/OneDrive/Pictures/SICSS-CU-2022_Text_Analysis_Group/Output/Plots/GoogleTrends/Kenya/1Kenya gtrend plot1.png")
KY.Gplot2 <- readPNG("C:/Users/Michael Ehinmowo/OneDrive/Pictures/SICSS-CU-2022_Text_Analysis_Group/Output/Plots/GoogleTrends/Kenya/2Kenya gtrend plot2.png")

# convert plots to grobs

KY.grob1 <- rasterGrob(KY.Gplot1)
KY.grob2 <- rasterGrob(KY.Gplot2)

# put all grobs in a grid of two column and one row

ky.plots <- grid.arrange(KY.grob1, KY.grob2, ncol = 2)

ggsave(ky.plots,
       filename ="Kenyan GoogleTrend plots.png", 
       dpi = 350,
       bg = "white",
       path = "Output/Plots"
       
)


# Finally for Nigeria
ng.Gplot1 <- readPNG("C:/Users/Michael Ehinmowo/OneDrive/Pictures/SICSS-CU-2022_Text_Analysis_Group/Output/Plots/GoogleTrends/NG/1NG gtrend plot1.png")
ng.Gplot2 <- readPNG("C:/Users/Michael Ehinmowo/OneDrive/Pictures/SICSS-CU-2022_Text_Analysis_Group/Output/Plots/GoogleTrends/NG/2NG gtrend plot2.png")
ng.Gplot3 <- readPNG("C:/Users/Michael Ehinmowo/OneDrive/Pictures/SICSS-CU-2022_Text_Analysis_Group/Output/Plots/GoogleTrends/NG/3NG gtrend plot3.png")

# convert the plots to grob

ng.grob1 <- rasterGrob(ng.Gplot1)
ng.grob2 <- rasterGrob(ng.Gplot2)
ng.grob3 <- rasterGrob(ng.Gplot3)

# put grobs in a grid of 3 columns and 1 row

ng.plots <- grid.arrange(ng.grob1, ng.grob2, ng.grob3, ncol = 3)

# save plot


ggsave(ng.plots,
       filename ="Nigeria GoogleTrend plots.png", 
       dpi = 350,
       bg = "white",
       path = "Output/Plots"
       
)


# Load the pictures you want to merge
img1 <- readPNG("C:/Users/Michael Ehinmowo/OneDrive/Pictures/SICSS-CU-2022_Text_Analysis_Group/Output/Plots/Plots on Grid/NG_Keywords.png")
img2 <- readPNG("C:/Users/Michael Ehinmowo/OneDrive/Pictures/SICSS-CU-2022_Text_Analysis_Group/Output/Plots/Plots on Grid/GH_Keywords.png")
img3 <- readPNG("C:/Users/Michael Ehinmowo/OneDrive/Pictures/SICSS-CU-2022_Text_Analysis_Group/Output/Plots/Plots on Grid/KE_Keywords.png")
img4 <- readPNG("C:/Users/Michael Ehinmowo/OneDrive/Pictures/SICSS-CU-2022_Text_Analysis_Group/Output/Plots/Plots on Grid/_Keywords.png")

# Convert images to grobs
grob1 <- rasterGrob(img1)
grob2 <- rasterGrob(img2)
grob3 <- rasterGrob(img3)
grob4 <- rasterGrob(img4)

# arrange the grob side by side
grid.arrange(grob1, grob2, grob3, grob4, ncol = 2)

# assign the merged images to a new object

Top30 <- grid.arrange(grob1, grob2, grob3, grob4, ncol = 2)

# Save the combined picture to a file
ggsave(Top30, 
       filename ="combined top30.png", 
       dpi = 350,
       bg = "white",
       path = "Output/Plots")



#########################
#CODE TO MERGE THE BAR PLOTS OF THE REMEDIES
#########################

# Load the pictures you want to merge
rem_gh <- readPNG("C:/Users/user/Desktop/SICSS_Covenant/Updated Group Project/SICSS-CU-2022_Text_Analysis_Group/Output/Plots/Plots on Grid/GH_Keywords.png")
rem_ke <- readPNG("C:/Users/user/Desktop/SICSS_Covenant/Updated Group Project/SICSS-CU-2022_Text_Analysis_Group/Output/Plots/Plots on Grid/KE_Keywords.png")
rem_ng <- readPNG("C:/Users/user/Desktop/SICSS_Covenant/Updated Group Project/SICSS-CU-2022_Text_Analysis_Group/Output/Plots/Plots on Grid/NG_Keywords.png")
rem_sa <- readPNG("C:/Users/user/Desktop/SICSS_Covenant/Updated Group Project/SICSS-CU-2022_Text_Analysis_Group/Output/Plots/Plots on Grid/SA_Keywords.png")


# Convert images to grobs
gh.grob <- rasterGrob(rem_gh)
ke.grob <- rasterGrob(rem_ke)
ng.grob <- rasterGrob(rem_ng)
sa.grob <- rasterGrob(rem_sa)

# arrange the grob side by side
grid.arrange(gh.grob, ke.grob, ng.grob, sa.grob, ncol = 2)

# assign the merged images to a new object

Merged_Plots <- grid.arrange(gh.grob, ke.grob, ng.grob, sa.grob, ncol = 2)

# Save the combined picture to a file
ggsave(Merged_Plots, 
       filename ="Merged_Bar_Plot.png", 
       dpi = 350,
       width = 2256,
       height = 1327,
       units = "px",
       bg = "white",
       path = "Output/Plots")

