
library(dplyr)
library(readr)


nao_data <- read_csv("nao_data_named_months.csv")

#Convert month names to ordered factor (optional for clarity)
nao_data$Month <- factor(nao_data$Month, levels = c(
  "Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul",
  "Aug", "Sep", "Oct", "Nov", "Dec"
))

#Define study years for each species
study_years <- list(
  "Arctic Tern" = 1973:1991,
  "Black-legged Kittiwake" = 1981:1998,
  "Great Cormorant" = c(1983, 1984, 2013, 2014),
  "Common Eider" = 1985:2015,
  "Lesser Black-backed Gull" = 2005:2019,
  "Gull-billed Tern" = 2012:2022
)

#Function to calculate average May–July NAO per species
get_nao_mean <- function(years) {
  nao_data %>%
    filter(Year %in% years, Month %in% c("May", "Jun", "Jul")) %>%
    summarise(mean_nao = mean(NAO, na.rm = TRUE)) %>%
    pull(mean_nao)
}

# Calculate means and assign names
nao_means <- sapply(study_years, get_nao_mean)

#Prepare meta-analysis data
data12 <- data.frame(
  species = c(
    'Arctic Terns', 'Black-legged Kittiwakes',
    'Great Cormorants', 'Common eiders',
    'Lesser Black-Backed gull', 'Gull-billed terns'
  ),
  regressionvalue = c(-0.011, -0.0182, -0.0499, 0.051, -0.047, 0.06152),
  standarderror = c(0.001, 0.0145, 0.0354, 0.0054, 0.03, 0.02303)
)

#Add NAO column to data
data12$NAO <- round(nao_means, 3)


print(data12)
