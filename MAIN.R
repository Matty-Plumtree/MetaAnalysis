library(metafor)
library(rnaturalearth)

data <- data.frame(
  Year = c(2013, 2014, 1983, 1984),
  MeanClutch = c(3, 0.85, 3.2, 3.6),
  SE = c(0.149, 0.177, 0.054, 0.037) 
)

model1 <- rma(yi = MeanClutch, sei = SE, mods = ~Year, data = data)
model <- lm(MeanClutch ~ Year, data = data, weights = 1/SE^2)
summary(model)

print(model1)

year <- c(2003, 2004, 2005, 2006)
mean_clutch <- c(2, 1, 1.75, 2)
  
# Linear regression
model3 <- lm(mean_clutch ~ year)

# Summary of the model
summary(model3)

data12$temperature <- c(-0.354, -0.926, 0.576, 0.219, 0.757, 0.868)

data12 <- data.frame(
  species= c('Arctic Terns', 'Black-legged Kittiwakes', 'Great Cormorants', 'Common eiders', 'Lesser Black-Backed gull', 'Gull-billed terns', 'Gentoo Penguin'),
  regressionvalue = c(-0.011, -0.0182, -0.0499, 0.051, -0.047, 0.06152, 0.075),
  standarderror = c(0.001, 0.0145, 0.0354, 0.0054, 0.03, 0.02303, 0.2537)
)






# Run the meta-regression model
modelrma_mod <- rma.mv(
  yi = regressionvalue,
  V = standarderror^2,
  mods = ~ latitude + temperature + NAO,
  random = ~ 1 | species,
  data = data12
)
summary(modelrma_mod)

forest(modelrma_mod, 
       slab = data12$species,
       xlab = "Effect size (regression value)",
       mlab = "Overall effect",
       alim = c(-0.1, 0.1),
       cex = 0.9,
       col = "darkblue",
       addfit = TRUE)
abline(v = 0, lty = 2) 

funnel(modelrma_mod)

citation('rnaturalearth')

