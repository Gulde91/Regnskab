
### Indlæser data ----
data <- read.table("~/Dropbox/R/Regnskab/data/dec_2017.csv",
                   sep=";", quote="\"", stringsAsFactors=FALSE)

library(dplyr)

### renser data ----
data <- data[-1, ]
data <- select(data, V1, V2, V3)
names(data) <- c('dato', 'tekst', 'beløb')

data$tekst <- gsub('\xf8', 'ø', data$tekst)
data$tekst <- gsub('\xd8', 'Ø', data$tekst)
data$tekst <- gsub('\xe6', 'æ', data$tekst)
data$tekst <- gsub('\xc5', 'å', data$tekst)
data$tekst <- tolower(data$tekst)

data$beløb <- gsub('\\.', '', data$beløb)
data$beløb <- gsub(',', '.', data$beløb)
data$beløb <- as.numeric(data$beløb)

data$dato <- as.Date(data$dato, format = '%d.%m.%Y') %>% lubridate::month(label = TRUE, abbr = FALSE)

# To do:
# Indlæs data for hele 2017
# gruppere data på måneder
# separat data til opsparing
# 

