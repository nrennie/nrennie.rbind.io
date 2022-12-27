library(tidyverse)
library(showtext)
library(tidytext)
library(ggtext)

# add fonts
font_add_google(name = "Ubuntu", family = "ubuntu")
showtext_auto()

# get data
tuesdata <- tidytuesdayR::tt_load(2022, week = 17)
hidden_gems <- tuesdata$hidden_gems

# data for sentiment analysis
data(stop_words)
afinn_df <- get_sentiments("afinn")

# average sentiment of review by date
text_df <- hidden_gems %>%
  select(date, review) %>%
  unnest_tokens(word, review) %>%
  anti_join(stop_words, by = "word")

sent_df <- text_df %>%
  inner_join(afinn_df, by = "word") %>%
  group_by(date) %>%
  summarise(max_sent = max(value, na.rm = T),
            min_sent = min(value, na.rm = T)) %>%
  drop_na() 

eq_points <- sent_df %>% 
  mutate(eq = (max_sent == min_sent)) %>% 
  filter(eq)

# subtitle
st <- 'Sentiment analysis of Kaggle Hidden Gems reviews using {tidytext} reveals an overall positive sentiment. <span style="color: #5BB381;">Maximum</span><br><span style="color: #5BB381;">sentiments</span> for each week are always positive, but <span style="color: #4A154B;">minimum sentiments</span> are not always negative! The sentiment value lies<br>between -5 and 5, with -5 meaning very <span style="color: #4A154B;">negative sentiment</span> and 5 being very <span style="color: #5BB381;">positive sentiment</span>. Weeks with <span style="color: #D9027D;">equal maximum</span><br><span style="color: #D9027D;">and minimum review sentiments</span> often result from there only being a single review.'

# plot
ggplot() +
  annotate(geom = "rect",
           xmin = min(sent_df$date) - 10,
           xmax = max(sent_df$date) + 10,
           ymin = 0, ymax = 5,
           fill = "#5BB381",
           alpha = 0.4) +
  annotate(geom = "rect",
           xmin = min(sent_df$date) - 10,
           xmax = max(sent_df$date) + 10,
           ymin = -5, ymax = 0,
           fill = "#4A154B",
           alpha = 0.4) +
  geom_segment(data = sent_df, 
               mapping = aes(x = date, xend = date, y = min_sent, yend = max_sent)) +
  geom_point(data = pivot_longer(sent_df,
                                 cols = c(max_sent, min_sent)),
             mapping = aes(x = date,
                           y = value,
                           colour = name,
                           group = date),
             size = 2) +
  geom_point(data = eq_points,
             mapping = aes(x = date, 
                           y = max_sent), 
             colour = "#D9027D",
             size = 2) +
  scale_colour_manual(values = c("#5BB381", "#4A154B")) +
  scale_y_continuous(limits = c(-5, 5.5),
                     breaks = c(-5, -2.5, 0, 2.5, 5)) +
  labs(x = "",
       y = "Average sentiment of review",
       title = "Kaggle Hidden Gems",
       subtitle = st,
       caption = "N. Rennie | Data: Kaggle") +
  theme(plot.margin = margin(10,10,10,20),
        legend.position = "none",
        panel.grid = element_blank(),
        panel.background = element_rect(fill = "#FAFAFA", colour = "#FAFAFA"),
        plot.background = element_rect(fill = "#FAFAFA", colour = "#FAFAFA"),
        plot.title = element_text(family = "ubuntu", hjust = 0, size = 22, color = "black",
                                  margin = margin(t = 10, r = 0, b = 10, l = 0)),
        plot.subtitle = element_markdown(family = "ubuntu", hjust = 0,
                                     size = 12, color = "black",
                                     margin = margin(t = 10, b = 10)),
        plot.caption = element_text(family = "ubuntu", hjust = 0, size = 10, color = "black"),
        axis.text = element_text(family = "ubuntu", hjust = 0.5, size = 10, color = "black"),
        axis.title = element_text(family = "ubuntu", hjust = 0.5, size = 10, color = "black"),
        plot.title.position = "plot",
        plot.caption.position = "plot",
        axis.ticks.y = element_blank())

