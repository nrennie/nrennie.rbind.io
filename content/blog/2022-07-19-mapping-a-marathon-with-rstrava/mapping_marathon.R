library(tidyverse)
library(ggmap)
library(osmdata)
library(rcartocolor)
library(sf)
library(rStrava)
library(gganimate)

# create the authentication token
stoken <- httr::config(token = strava_oauth(app_name,
                                            app_client_id,
                                            app_secret,
                                            app_scope="activity:read_all"))

# grab activities
my_acts <- get_activity_list(stoken) 
id = {id}
strava_data <- get_activity_streams(my_acts,
                                    stoken,
                                    id = id)

# save to csv (just in case)
write.csv(strava_data, "strava_data.csv", row.names = F)

# data wrangling
strava_data %>% 
  as_tibble() %>% 
  select(-id)

# convert tibble to sf object
strava_sf <- st_as_sf(strava_data,
                      coords = c("lng", "lat"),
                      crs = 4326,
                      remove = FALSE)

# Define geographic area
getbb("Lancaster, UK")
bb <- matrix(c(-2.9, -2.53, 53.95, 54.10), 
             ncol = 2, 
             nrow = 2,
             byrow = TRUE,
             dimnames = list(c("x", "y"), c("min", "max")))

# Get a background map
bg_map <- get_map(bb,
                  source = "stamen",
                  maptype = "toner-hybrid", 
                  color = "bw")
ggmap(bg_map)

# add geometry
g <- ggmap(bg_map) +
  geom_sf(data = strava_sf,
          inherit.aes = FALSE,
          aes(colour = altitude), 
          size = 1) 
g

# get hex colours
my_colors <- carto_pal(7, "SunsetDark")
my_colors

# styling 
g <- g + 
  scale_colour_carto_c(name = "Altitude (m)", palette = "SunsetDark") +
  labs(caption = "Lancaster - Forest of Bowland ") +
  theme_void() +
  theme(legend.position = c(0.85, 0.7), 
        legend.title = element_text(face = "bold", hjust = 0.5), 
        plot.caption = element_text(colour = "#dc3977", face = "bold", size = 16, 
                                    vjust = 10), 
        plot.margin = unit(c(0, 0, -0.75, 0), unit = "cm"))
g

# plot using geom_point()
g <- ggmap(bg_map) +
  geom_point(data = strava_data,
          inherit.aes = FALSE,
          aes(colour = altitude, 
              x = lng, 
              y = lat), 
          size = 1) + 
  scale_colour_carto_c(name = "Altitude (m)", palette = "SunsetDark") +
  labs(caption = "Lancaster - Forest of Bowland ") +
  theme_void() +
  theme(legend.position = c(0.85, 0.7), 
        axis.title = element_blank(), 
        legend.title = element_text(face = "bold", hjust = 0.5), 
        plot.caption = element_text(colour = "#dc3977", face = "bold", size = 16, 
                                    vjust = 10), 
        plot.margin = unit(c(0, 0, -0.75, 0), unit = "cm"))

# animate 
g = g + 
  transition_time(time = time) +
  shadow_mark()

# save animation
animate(g, renderer = gifski_renderer(), height = 372, width = 538, units = "px")
anim_save("mapping_marathon.gif")
