library(gtrendsR)
library(tidyverse)

keywds1 = gtrends(
  keyword = c("Hydrochloroquine", "Herbs", "Agbo", "Chloroquine", "Bitter Leaf"),
  geo = "NG",
  time = "2016-07-01 2022-10-03",
  gprop = c("web", "news", "images", "froogle", "youtube"),
  category = 0,
  hl = "en-US",
  compared_breakdown = TRUE,
  low_search_volume = FALSE,
  cookie_url = "http://trends.google.com/Cookies/NID",
  tz = 0,
  onlyInterest = TRUE
)

plot(keywds1)




keywds2 = gtrends(
  keyword = c("Dexamethasone", "Ivermectin", "Lopinavir", "Remdesivir", "Artemisia"),
  geo = "NG",
  time = "2016-07-01 2022-10-03",
  gprop = c("web", "news", "images", "froogle", "youtube"),
  category = 0,
  hl = "en-US",
  compared_breakdown = TRUE,
  low_search_volume = FALSE,
  cookie_url = "http://trends.google.com/Cookies/NID",
  tz = 0,
  onlyInterest = TRUE
)

plot(keywds2)



keywds3 = gtrends(
  keyword = c("ginger", "bleach", "garlic", "weed", "madagascar organic syrup"),
  geo = "NG",
  time = "2016-07-01 2022-10-03",
  gprop = c("web", "news", "images", "froogle", "youtube"),
  category = 0,
  hl = "en-US",
  compared_breakdown = TRUE,
  low_search_volume = FALSE,
  cookie_url = "http://trends.google.com/Cookies/NID",
  tz = 0,
  onlyInterest = TRUE
)

plot(keywds3)


keywds4 = gtrends(
  keyword = c("Alomo Bitter", "Ashanti Bitter", "Bitter Kola", "Neem leaf", "Jedi Jedi"),
  geo = "NG",
  time = "2016-07-01 2022-10-03",
  gprop = c("web", "news", "images", "froogle", "youtube"),
  category = 0,
  hl = "en-US",
  compared_breakdown = TRUE,
  low_search_volume = FALSE,
  cookie_url = "http://trends.google.com/Cookies/NID",
  tz = 0,
  onlyInterest = TRUE
)

plot(keywds4)
