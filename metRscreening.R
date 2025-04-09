install.packages("devtools")
devtools::install_github("EIvimeyCook/metRscreen")
library(metRscreen)

metRscreen(screen.file = "~/Documents/MetaAnalysis/Fourthscreening.csv", reject.vec = c("no control", "wrong study system"))


citation('metRscreen')

