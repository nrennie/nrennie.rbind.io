using Tidier
using TidierPlots
using UrlDownload
using DataFrames
using AlgebraOfGraphics, CairoMakie

production = urldownload("https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2023/2023-04-11/egg-production.csv") |> DataFrame ;

plot_data = @chain production begin
@filter(prod_process == "cage-free (organic)")
@mutate(n = n_eggs/1000000)
end

xy = data(plot_data) * mapping(:observed_month, :n) * visual(Lines)
with_theme(theme_ggplot2()) do
draw(xy; axis=(xlabel="", ylabel="Cage-free organic eggs produced (millions)"))
end

@ggplot(plot_data, aes(x = observed_month, y = n)) + 
    @geom_point() +
    @labs(x = "", y = "Cage-free organic eggs produced (millions)")