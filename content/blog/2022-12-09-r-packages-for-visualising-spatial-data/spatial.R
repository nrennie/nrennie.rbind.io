
# Read in data ------------------------------------------------------------

greggs <- readr::read_csv("greggs.csv") 
uk <- sf::st_read("UK/CTRY_DEC_2021_UK_BUC.shp") 

# Convert Greggs to sf ----------------------------------------------------

library(sf)
library(dplyr)
greggs_sf <- greggs %>% 
  select(address.longitude, address.latitude) %>% 
  rename(lon = address.longitude, 
         lat = address.latitude) %>% 
  st_as_sf(coords = c("lon", "lat")) %>% 
  st_set_crs(4326) %>% 
  st_transform(crs = 27700)

# Base R ------------------------------------------------------------------

png("base.png", width = 4, height = 4, units = "in", res = 300)
par(bg = "#00558e")
plot(st_geometry(uk), col = "#fab824", border = "#fab824")
plot(st_geometry(greggs_sf), pch = 19, col = "#00558e", cex = 0.2, add = TRUE)
dev.off() 

# ggplot2 -----------------------------------------------------------------

library(ggplot2)
ggplot() +
  geom_sf(data = uk,
          linewidth = 0.5,
          colour = "#fab824",
          fill = "#fab824") +
  geom_sf(data = greggs_sf,
          size = 0.3,
          colour = "#00558e") +
  theme_void()
ggsave("ggplot2.png", height = 4, width = 4, bg = "#00558e")

# tmap --------------------------------------------------------------------

library(tmap)
png("tmap.png", width = 4, height = 4, units = "in", res = 300) 
tm_shape(uk) +
  tm_fill(col = "#fab824") +
  tm_borders(col = "#fab824") +
  tm_shape(greggs_sf) +
  tm_dots(col = "#00558e") +
  tm_layout(frame = FALSE, bg.color = "#00558e")
dev.off() 

# leaflet -----------------------------------------------------------------

library(leaflet)
library(mapview)
new_uk <- uk_sf %>%  sf::st_transform(crs = 4326)
new_greggs <- greggs_sf %>%  sf::st_transform(crs = 4326)
m <- leaflet() %>%
  addTiles() %>% 
  addPolygons(data = new_uk,
              stroke = FALSE,
              fillOpacity = 1,
              fillColor = "#fab824") %>% 
  addCircleMarkers(data = new_greggs,
                   radius = 0.5,
                   fillOpacity = 1,
                   stroke = FALSE,
                   fillColor = "#00558e")
m
mapshot(m, file = "leaflet.png")

# Elevation data ----------------------------------------------------------

library(elevatr)
elev_data <- get_elev_raster(
  locations = data.frame(x = c(-1.760, -1.335), y = c(54.898, 55.067)),
  z = 10,
  prj = "EPSG:4326",
  clip = "locations")


# Base R ------------------------------------------------------------------

png("base_elevation.png", width = 4, height = 3, units = "in", res = 300) 
par(mar = c(1, 1, 3, 1), bty = 'n')
plot(elev_data, axes = FALSE, horizontal = TRUE)
title(main = "NEWCASTLE",
      adj = 0.5,
      cex.main = 1.8,
      font.main = 2,
      col.main = "black")
dev.off() 

# tanaka ------------------------------------------------------------------

library(tanaka)
library(terra)
elev_raster <- rast(elev_data)
png("tanaka.png", width = 4, height = 3, units = "in", res = 300) 
par(mar = c(1, 1, 3, 1))
tanaka(elev_raster, legend.pos = "n")
title(main = "NEWCASTLE",
      adj = 0.5,
      cex.main = 1.8,
      font.main = 2,
      col.main = "black")

# rayshader / rayrender ---------------------------------------------------

library(rayshader)
elev_mat <- raster_to_matrix(elev_data)
elev_mat %>%
  sphere_shade() %>%
  plot_3d(elev_mat, zscale = 10, fov = 0, theta = 0, phi = 60,
          windowsize = c(600, 450),
          zoom = 0.7,
          background = "lightgrey")
render_snapshot(filename = "rayshader.png",
                clear = FALSE,
                title_text = "NEWCASTLE",
                title_size = 50,
                title_color = "white",
                title_font = "serif")
