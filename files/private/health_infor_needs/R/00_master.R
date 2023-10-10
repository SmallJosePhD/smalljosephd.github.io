################################################################################
#
#' Re-Evaluating Health Information Needs in Africa during COVID-19
#' 
#  ########################################################
#
# MASTER SCRIPT
#
################################################################################

# This is a master script that calls other scripts one-by-one
# to replicate the figure discussed in the paper. 


## Step 1: Package Installation -------------------------
source ("R/01_packages_install.R")

## Step 2: Fetch Data (Tweets) from Twitter --------
source ("R/02_data_fetch.R")

## Step 3: Data Cleaning/Wrangling --------
source ("R/03_wrangling.R")

## Step 4: Google Trends --------
source ("R/04_google_trends.R")

## Step 5: Text Analysis and visualisation of the clean(ed) data (Tweets)  --------
source ("R/05_text_analysis.R")

=======

################################################################################
#
#' Re-Evaluating Health Information Needs in Africa during COVID-19
#' 
###############################################################################
#
# MASTER SCRIPT
#
###############################################################################

# This is a master script that calls other scripts one-by-one
# to replicate the figure discussed in the paper. 


## Step 1: Package Installation -------------------------
source ("R/01_packages_install.R")

## Step 2: Fetch Data (Tweets) from Twitter --------
source ("R/02_data_fetch.R")

## Step 3: Data Cleaning/Wrangling --------
source ("R/03_wrangling.R")

## Step 4: Google Trends --------
source ("R/04_google_trends.R")

## Step 5: Text Analysis and visualisation of the clean(ed) data (Tweets)  --------
source ("R/05_text_analysis.R")

>>>>>>> ee098c0b0097acfdf72f6273e7ea7b6ccaaef865
