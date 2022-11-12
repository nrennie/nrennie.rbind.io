library(tidyverse)
library(lubridate)
library(PrettyCols)
library(fda)
library(usefunc) #remotes::install_github("nrennie/usefunc")
library(funcnetout) #remotes::install_github("nrennie/funcnetout")

# read in data
pollution <- readr::read_csv("content/blog/2022-11-16-using-functional-analysis-to-model-air-pollution-data-in-r/air_pollution.csv",
                             skip = 3)

# data wrangling
air_data <- pollution %>% 
  rename("Date" = "...1",
         "Time" = "...2") %>% 
  select(-starts_with("...")) %>% 
  slice(-1) %>% 
  slice(1:(n() - 1)) %>% 
  mutate(across(c(Aberdeen:`York Fishergate`), ~case_when(.x == "No data" ~ NA_character_, TRUE ~ as.character(.x)))) %>% 
  mutate(across(c(Aberdeen:`York Fishergate`), as.numeric)) %>% 
  mutate(DateTime = ymd_hms(paste(Date, Time)), .after = 2) %>% 
  mutate(Date = ymd(Date), 
         Time = lubridate::hms(Time))

# select a single station
Aberdeen_WR <- air_data %>% 
  select(c(Date, Time, DateTime, `Aberdeen Wellington Road`)) %>% 
  rename(`NO2` = `Aberdeen Wellington Road`)

# long term plot 
g <- ggplot(data = Aberdeen_WR,
       mapping = aes(x = DateTime, y = NO2)) +
  geom_line(linewidth = 0.1,
            colour = alpha(prettycols("Purples")[2], 0.5)) +
  labs(x = "", 
       y = "Hourly Nitrogen Dioxide Levels") +
  theme_minimal() +
  theme(axis.text.y = element_text(margin = margin(l = 5)),
        plot.margin = unit(c(0.2, 0.5, 0.2, 0.2), unit ="cm"))
g
plotly::ggplotly(g)

# Check if any days are missing data
missing <- Aberdeen_WR %>% 
  group_by(Date) %>% 
  summarise(num_missing = sum(is.na(NO2))) %>% 
  filter(num_missing > 0) %>% 
  arrange(desc(num_missing)) 

# which ones are missing >= 10 hours of data
too_many_missing <- missing %>% 
  filter(num_missing >= 10)

# remove missing data
Aberdeen_WR <- Aberdeen_WR %>% 
  filter(Date %notin% too_many_missing$Date)

# mean imputation for the others
avg_hour <- Aberdeen_WR %>% 
  group_by(Time) %>% 
  summarise(avg = mean(NO2, na.rm = TRUE))

Aberdeen_WR <- Aberdeen_WR %>% 
  left_join(avg_hour, by = "Time") %>% 
  mutate(NO2 = case_when(is.na(NO2) ~ avg,
                           TRUE ~ NO2)) %>% 
  select(-avg)

# daily plot
ggplot(data = Aberdeen_WR,
       mapping = aes(x = hour(Time), y = NO2)) +
  geom_line(mapping = aes(group = Date),
            linewidth = 0.1,
            colour = alpha(prettycols("Purples")[4], 0.2)) +
  geom_smooth(colour = prettycols("Purples")[1],
              linewidth = 2) +
  labs(x = "", 
       y = "Hourly Nitrogen Dioxide Levels") +
  scale_x_continuous(name = "Time of day",
                     limits = c(1, 24),
                     breaks = seq(2, 24, by = 2),
                     labels = c("02:00", "04:00", "06:00",
                                "08:00", "10:00", "12:00",
                                "14:00", "16:00", "18:00",
                                "20:00", "22:00", "00:00")) +
  theme_minimal() +
  theme(axis.text.y = element_text(margin = margin(l = 5)),
        axis.text.x = element_text(margin = margin(t = 5)),
        plot.margin = unit(c(0.2, 0.5, 0.2, 0.2), unit ="cm"),
        panel.grid.minor = element_blank())

# day of week average
Aberdeen_WR %>% 
  mutate(hr = hour(Time),
         wday = wday(Date, label = TRUE)) %>% 
  group_by(wday, hr) %>% 
  summarise(avg = mean(NO2)) %>% 
  ggplot(mapping = aes(x = hr, y = avg)) +
  geom_line(mapping = aes(colour = wday),
            linewidth = 0.1) +
  labs(x = "", 
       y = "Hourly Nitrogen Dioxide Levels") +
  scale_x_continuous(name = "Time of day",
                     limits = c(1, 24),
                     breaks = seq(2, 24, by = 2),
                     labels = c("02:00", "04:00", "06:00",
                                "08:00", "10:00", "12:00",
                                "14:00", "16:00", "18:00",
                                "20:00", "22:00", "00:00")) +
  scale_colour_brewer(palette = "Dark2") +
  guides(colour = guide_legend(nrow = 1)) +
  theme_minimal() +
  theme(axis.text.y = element_text(margin = margin(l = 5)),
        axis.text.x = element_text(margin = margin(t = 5)),
        plot.margin = unit(c(0.2, 0.5, 0.2, 0.2), unit ="cm"),
        panel.grid.minor = element_blank(),
        legend.title = element_blank(),
        legend.position = "top")

# Convert to matrix
Aberdeen_matrix <- Aberdeen_WR %>% 
  mutate(hr = hour(Time)) %>% 
  select(-c(Time, DateTime)) %>% 
  pivot_wider(names_from = hr,
              values_from = NO2) %>% 
  column_to_rownames(var = "Date") %>% 
  as.matrix()

# create factors
m <- months(as.Date(rownames(Aberdeen_matrix)), abbreviate = TRUE)
d <- weekdays(as.Date(rownames(Aberdeen_matrix)), abbreviate = TRUE)
d <- case_when(d %in% c("Mon", "Tue", "Wed", "Thu", "Fri") ~ "Weekday",
               TRUE ~ d)
yrs <- as.character(year(as.Date(rownames(Aberdeen_matrix))))

# apply function regression model
Aberdeen_func <- fd(t(Aberdeen_matrix))
func_fit <- fRegress(Aberdeen_func ~ d + m + yrs)
fitted_curves <- t(as.matrix(func_fit$yhatfdobj$coefs))
colnames(fitted_curves) <- 1:24
rownames(fitted_curves) <- c()
Aberdeen_residuals <- Aberdeen_matrix - fitted_curves

# convert to tibble
Aberdeen_residuals_tbl <- Aberdeen_residuals %>% 
  as.data.frame() %>% 
  rownames_to_column() %>% 
  as_tibble() %>% 
  rename("Date" = "rowname") %>% 
  pivot_longer(cols = `1`:`24`, names_to = "hr", values_to = "NO2") %>% 
  mutate(hr = as.numeric(hr))

# plot residuals
ggplot(data = Aberdeen_residuals_tbl,
       mapping = aes(x = hr, y = NO2)) +
  geom_line(mapping = aes(group = Date),
            linewidth = 0.1,
            colour = alpha(prettycols("Purples")[4], 0.2)) +
  geom_smooth(colour = prettycols("Purples")[1],
              linewidth = 2) +
  labs(x = "", 
       y = "Residual Hourly Nitrogen Dioxide Levels") +
  scale_x_continuous(name = "Time of day",
                     limits = c(1, 24),
                     breaks = seq(2, 24, by = 2),
                     labels = c("02:00", "04:00", "06:00",
                                "08:00", "10:00", "12:00",
                                "14:00", "16:00", "18:00",
                                "20:00", "22:00", "00:00")) +
  theme_minimal() +
  theme(axis.text.y = element_text(margin = margin(l = 5)),
        axis.text.x = element_text(margin = margin(t = 5)),
        plot.margin = unit(c(0.2, 0.5, 0.2, 0.2), unit ="cm"),
        panel.grid.minor = element_blank())

# calculate depths
depths <- func_depth(data = Aberdeen_residuals, times = 1:24)

# calculate threshold
threshold <- func_depth_threshold(data = Aberdeen_residuals, times = 1:24)

# depths to tibble
colnames(depths) <- "depths"
plot_depths <- depths %>% 
  as.data.frame() %>% 
  rownames_to_column() %>% 
  as_tibble() %>% 
  rename("Date" = "rowname") %>% 
  mutate(Date = as.Date(Date)) 

# plot depths
ggplot(plot_depths) +
  geom_segment(aes(x = Date,
                   xend = Date, 
                   y = 0, 
                   yend = depths),
               colour = alpha(prettycols("Purples")[2], 0.5),
               linewidth = 0.5) +
  geom_point(aes(x = Date, 
                 y = depths),
             colour = prettycols("Purples")[2]) +
  geom_hline(yintercept = threshold,
             colour = prettycols("Purples")[2]) +
  labs(x = "", 
       y = "Function Depth") +
  theme_minimal() +
  theme(axis.text.y = element_text(margin = margin(l = 5)),
        axis.text.x = element_text(margin = margin(t = 5)),
        plot.margin = unit(c(0.2, 0.5, 0.2, 0.2), unit ="cm"),
        panel.grid.minor = element_blank(),
        legend.title = element_blank(),
        legend.position = "top")

# find the outliers
outliers <- plot_depths %>% 
  mutate(outlier = depths < threshold) %>% 
  filter(outlier) 

outliers
table(weekdays(outliers$Date))
knitr::kable(table(month(outliers$Date, label = TRUE)))

