
library(ggplot2)
library(maps)
library(dplyr)


author_locs <- data.frame(
  author = c(
    "Schnelle et al.",
    "Møller et al.",
    "Hipfner et al.",
    "Lorentsen et al.",
    "Bårdsen et al. (2018)",
    "Bårdsen et al. (2023)"
  ),
  lat = c(53.8956, 56.2639, 53.9333, 67.5, 69.8167, 69.8195),
  lon = c(8.9803, 9.5018, -56.5333, 12.0, 18.2500, 19.4500)
)


world_map <- map_data("world")


countries_to_label <- data.frame(
  country = c("Canada", "Norway", "Germany", "Denmark"),
  lon = c(-69, 10, 10, 9),  
  lat = c(55, 65, 51, 57.6)    
)


ggplot() +
  # Base map
  geom_polygon(data = world_map, aes(x = long, y = lat, group = group),
               fill = "gray", color = "white") +
  
  # Study sites
  geom_point(data = author_locs, aes(x = lon, y = lat),
             color = "#0072B2", size = 3.5, alpha = 0.9) +
  
  # Country name labels
  geom_text(data = countries_to_label, aes(x = lon, y = lat, label = country),
            size = 3, color = "black", fontface = "italic", alpha = 0.7) +
  
  # Map bounds
  coord_quickmap(xlim = c(-80, 40), ylim = c(45, 80), expand = FALSE) +
  
  # Axis labels and styling
  labs(
    title = "Map of the study sites surrounding the North Atlantic",
    x = "Longitude", y = "Latitude"
  ) +
  theme_minimal(base_size = 12) +
  theme(
    panel.grid = element_blank(),
    axis.text = element_text(size = 10),
    axis.ticks = element_line(),
    axis.title = element_text(size = 12),
    plot.title = element_text(size = 14, face = "bold", hjust = 0.5),
    panel.background = element_rect(fill = "aliceblue")
  )





citation('gt')
