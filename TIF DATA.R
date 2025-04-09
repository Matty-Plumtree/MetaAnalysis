library(raster)


tavg_stack <- stack(list.files("~/Documents/MetaAnalysis/tif/", pattern = "tavg.*tif$", full.names = TRUE))

#coordinates
coords <- data.frame(
  lon = c(18.0, 18.0, 12.0, 18.3, 9.5, 8.98),
  lat = c(77.0, 78.5, 67.5, 69.8, 56.2, 53.9)
)

#Extract temperature values for each month
temps <- extract(tavg_stack, coords)

#Calculate annual mean temperature
annual_mean_temp <- rowMeans(temps) / 10  

print(annual_mean_temp)
