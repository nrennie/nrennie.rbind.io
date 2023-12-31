library(purrr)
library(dplyr)
library(ggstream)
library(ggplot2)

set.seed(20231231)

df <- map_dfr(1:30, ~{
  x <- 1:sample(1:70, 1)
  tibble(x = x + sample(1:150, 1)) %>% 
    mutate(y = sample(1:10, length(x), replace = T),
           k = .x %>% as.character())
})

col_palette <- grDevices::colorRampPalette(c("white", "#1965b8"))(30)
col_palette <- sample(col_palette)

ggplot(df, aes(x, y, fill = k)) +
  geom_stream(color = "#1965b8", sorting = "onset",
              extra_span = .15, true_range = "none",
              linewidth = 0.1) +
  scale_fill_manual(values = col_palette) +
  theme_void() +
  theme(legend.position = "none")

ggsave("featuredR.svg", units = "px", width = 700, height = 500)
