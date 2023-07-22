
# Load fonts --------------------------------------------------------------

sysfonts::font_add(family = "Font Awesome 6 Brands",
                   regular = "Font-Awesome-6-Brands-Regular-400.otf")
showtext::showtext_auto()

# Create text -------------------------------------------------------------

github_icon <- "&#xf09b"
github_username <- "nrennie"

social_caption <- glue::glue(
  "<span style='font-family:\"Font Awesome 6 Brands\";'>{github_icon};</span>
  <span style='color: #E30B5C'>{github_username}</span>"
  )

# Plot caption ------------------------------------------------------------

library(ggplot2)
ggplot() +
  labs(caption = social_caption)

# Format with ggtext ------------------------------------------------------

library(ggtext)
ggplot() +
  labs(caption = social_caption) +
  theme(plot.caption = element_textbox_simple())

# Featured image ----------------------------------------------------------

social_list <- glue::glue(
  "<span style='font-family:\"Font Awesome 6 Brands\";'>&#xf09b;</span>
   <span style='color: #E30B5C'>nrennie</span><br>
  <span style='font-family:\"Font Awesome 6 Brands\";'>&#xf08c;</span>
   <span style='color: #E30B5C'>nicola-rennie</span><br>
  <span style='font-family:\"Font Awesome 6 Brands\";'>&#xf4f6;</span>
   <span style='color: #E30B5C'>fosstodon.org/@nrennie</span>"
)

ggplot() +
  geom_richtext(mapping = aes(x = 0, y = 0, label = social_list),
                label.colour = "transparent",
                fill = "#fce6ee",
                hjust = 0,
                size = 12) +
  xlim(-0.025, 0.3) +
  ylim(-0.2, 0.2) +
  theme_void() +
  theme(plot.background = element_rect(fill = "#fce6ee"))
