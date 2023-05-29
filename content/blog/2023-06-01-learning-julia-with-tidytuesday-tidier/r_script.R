library(readr)
library(dplyr)
library(ggplot2)
production <- read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2023/2023-04-11/egg-production.csv')
plot_data <- production |>
  filter(prod_process == "cage-free (organic)") |>
  mutate(n = n_eggs/1000000)
ggplot(plot_data, aes(x = observed_month, y = n)) +
  geom_line() +
  labs(x = "", y = "Cage-free organic eggs produced (millions)")
