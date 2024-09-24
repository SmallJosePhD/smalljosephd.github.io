library(tidyverse)
library(readxl)


#Import
data <- read_xlsx("C:/Users/USER/Desktop/EXD-MANU/MINT_WDI data.xlsx",
                  na =" ")
                  
Selected <- data
  names(Selected) <- c('Country', 'Series', seq(1960, 2021,1))

Selected <- Selected%>%
  filter(`Series` %in% c("Manufacturing, value added (% of GDP)", "Manufacturing, value added (annual % growth)", "Manufacturing, value added (current US$)","Debt service on external debt, public and publicly guaranteed (PPG) (TDS, current US$)", "Debt service on external debt, total (TDS, current US$)","External debt stocks (% of GNI)", "External debt stocks, total (DOD, current US$)", "Foreign direct investment, net inflows (% of GDP)", "Foreign direct investment, net inflows (BoP, current US$)","Inflation, consumer prices (annual %)", "Inflation, GDP deflator (annual %)","Official exchange rate (LCU per US$, period average)","Monetary Sector credit to private sector (% GDP)","Access to electricity (% of population)", "Agriculture, forestry, and fishing, value added (% of GDP)", "Agriculture, forestry, and fishing, value added (current US$)","Agriculture, forestry, and fishing, value added (annual % growth)","Lending interest rate (%)","Population ages 15-64 (% of total population)","Population growth (annual %)"))                  

Selected_Wide <- Selected %>% 
  pivot_wider(names_from = Series,
              values_from = Country)


#Save data in excel
writexl::write_xlsx(Selected, "C:/Users/USER/Desktop/EXD-MANU/selected indicators.xlsx")

