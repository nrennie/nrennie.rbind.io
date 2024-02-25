library(ggplot2)
library(mgcv)
library(patchwork)
covid <- readr::read_csv(
  "https://raw.githubusercontent.com/nrennie/f4sg-gams/main/data/covid.csv"
)

gbr_data <- covid |> 
  filter(iso_alpha_3 == "GBR") 


gam_1 <- gam(confirmed ~ s(date_obs, k = 10, sp = 0.001), data = gbr_data)
gam_2 <- gam(confirmed ~ s(date_obs, k = 40, sp = 0.001), data = gbr_data)
gam_3 <- gam(confirmed ~ s(date_obs, k = 10, sp = 0.01), data = gbr_data)
gam_4 <- gam(confirmed ~ s(date_obs, k = 40, sp = 0.01), data = gbr_data)

a <- ggplot(gbr_data) +
  geom_line(aes(date_obs, confirmed), colour = "grey") +
  annotate("line", x = gbr_data$date_obs, gam_1$fitted.values, colour = "blue") +
  labs(x = "Day of observation", y = "Confirmed cases", title = "k = 10, sp = 0.001") +
  theme_bw() +
  theme(plot.title = element_text(hjust = 0.5),
        plot.title.position = "plot")

b <- ggplot(gbr_data) +
  geom_line(aes(date_obs, confirmed), colour = "grey") +
  annotate("line", x = gbr_data$date_obs, gam_2$fitted.values, colour = "blue") +
  labs(x = "Day of observation", y = "Confirmed cases", title = "k = 40, sp = 0.001") +
  theme_bw() +
  theme(plot.title = element_text(hjust = 0.5),
        plot.title.position = "plot")

c <- ggplot(gbr_data) +
  geom_line(aes(date_obs, confirmed), colour = "grey") +
  annotate("line", x = gbr_data$date_obs, gam_3$fitted.values, colour = "blue") +
  labs(x = "Day of observation", y = "Confirmed cases", title = "k = 10, sp = 0.01") +
  theme_bw() +
  theme(plot.title = element_text(hjust = 0.5),
        plot.title.position = "plot")

d <- ggplot(gbr_data) +
  geom_line(aes(date_obs, confirmed), colour = "grey") +
  annotate("line", x = gbr_data$date_obs, gam_4$fitted.values, colour = "blue") +
  labs(x = "Day of observation", y = "Confirmed cases", title = "k = 40, sp = 0.01") +
  theme_bw() +
  theme(plot.title = element_text(hjust = 0.5),
        plot.title.position = "plot")

a + b + c + d



# Confidence intervals ----------------------------------------------------

library(gratia)
ci <- confint(gam_1, parm = "s(date_obs)", type = "confidence")


# Forecasting -------------------------------------------------------------

gam_2 <- gam(confirmed ~ s(date_obs) + s(tests, k = 3), data = gbr_data)

new_data <- data.frame(date_obs = 370, tests = 400000)
predict(gam_2, newdata = new_data)

new_data <- data.frame(date_obs = 370, tests = NA)
predict(gam_2, type = "terms", newdata = new_data)

