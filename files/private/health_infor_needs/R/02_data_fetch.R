################################################################################
#
#' Re-Evaluating Health Information Needs in Africa during COVID-19
#' 
###############################################################################
#
# DATA FETCHING FROM TWITTER API USING ACADEMIC RESEARCH ACCESS
#
###############################################################################



#' Here I'm creating a sub-directory in Data to hold the downloaded JSON files.
#' If the folder already exists, all files in the folder should be deleted for a fresh pull.

for (countries in c("ZA", "NG", "KE", "GH")) {
  
  if (file.exists(paste0("Data/", countries))){
    
    unlink(paste0("Data/", countries), recursive=TRUE)
    
    } else {
      break
    }
  
  }

#' We should create a R-script and assign the bearer token to `bearer_token`
#' this makes it for anyone to re-run our codes without having to restart R.
#' That is: bearer_token = 'AbAbAbAbAbAbAbAbAbAbAbAbAbAb' saved as `bearer.R`


## Alternatively, you could download from: https://developer.twitter.com/apitools/downloader
# tweetquery = '-is:retweet ((treat corona) OR (cure corona) OR (treat covid) OR (cure covid) OR (cure covid-19) OR (treat covid-19) OR (treat coronavirus) OR (cure coronavirus) OR (treating (corona OR covid OR covid-19 OR coronavirus)) OR (\"remedy for corona\") OR (\"remedy for coronavirus\") OR (\"remedy for covid\") OR (\"remedy for covid-19\"))'

# tweetquery = '-is:retweet ((treat corona) OR (cure corona) OR (treat covid) OR (cure covid) OR (cure covid-19) OR (treat covid-19) OR (treat coronavirus) OR (cure coronavirus) OR (treating (corona OR covid OR covid-19 OR coronavirus)) OR (remedy (corona OR covid OR covid-19 OR coronavirus)))'

# tweetquery = '-is:retweet ((treat (corona OR covid OR covid-19 OR coronavirus)) OR (treatment (corona OR covid OR covid-19 OR coronavirus)) OR (remedy (corona OR covid OR covid-19 OR coronavirus)) OR (cure (corona OR covid OR covid-19 OR coronavirus)) OR (treating (corona OR covid OR covid-19 OR coronavirus)))'

#-is:retweet place_country:NG lang:en ((treat (corona OR covid OR covid19 OR coronavirus)) OR (treatment (corona OR covid OR covid19 OR coronavirus)) OR (remedy (corona OR covid OR covid19 OR coronavirus)) OR (cure (corona OR covid OR covid19 OR coronavirus)) OR (treating (corona OR covid OR covid19 OR coronavirus)))

query = "-is:retweet ((treat (corona OR covid OR covid19 OR coronavirus)) OR (treatment (corona OR covid OR covid19 OR coronavirus)) OR (remedy (corona OR covid OR covid19 OR coronavirus)) OR (cure (corona OR covid OR covid19 OR coronavirus)) OR (treating (corona OR covid OR covid19 OR coronavirus)))"


get_cureTweets <- function(country = "NG"){
  get_all_tweets(query = paste0("place_country:",
                                country, " ", query), 
                 start_tweets = "2019-12-31T00:00:00Z", 
                 end_tweets = "2021-12-31T00:00:00Z", 
                 bearer_token = bearer_token,
                 # country = country,
                 bind_tweets = FALSE,
                 file = 'coTreat.RData',
                 data_path = paste0('Data/', country, "/"),
                 n = Inf)
}

cureTweetsNG <- get_cureTweets (country = "NG")
tidy_cureNG <- bind_tweets(data_path = "Data/NG",
                           output_format = "tidy")

cureTweetsKE <- get_cureTweets (country = "KE")
tidy_cureKE <- bind_tweets(data_path = "Data/KE",
                           output_format = "tidy")          

cureTweetsGH <- get_cureTweets (country = "GH")
tidy_cureGH <- bind_tweets(data_path = "Data/GH",
                           output_format = "tidy")          

cureTweetsZA <- get_cureTweets (country = "ZA")
tidy_cureZA <- bind_tweets(data_path = "Data/ZA",
                           output_format = "tidy") 


tidy_cure <- rbind(tidy_cureNG %>% mutate (geo_locat = "Nigeria"),
                   tidy_cureZA %>% mutate (geo_locat = "South Africa"),
                   tidy_cureKE %>% mutate (geo_locat = "Kenya"),
                   tidy_cureGH %>% mutate (geo_locat = "Ghana"))

saveRDS(tidy_cure, "Data/coTreat_tweets.rds")


save.image("Ghana.RData")