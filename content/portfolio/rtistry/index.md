---
title: "Rtistry"
subtitle: ""
excerpt: "Generative art is the practice of creating artwork using code. When the programming language of choice is R, it's often termed *Rtistry* or *aRt*."
date: 2023-04-26
weight: 6
author: "Nicola Rennie"
draft: false
categories:
  - Rtistry
layout: single
image: featured.jpeg
links:
- icon: github
  icon_pack: fab
  name: code
  url: https://github.com/nrennie/aRt
---

Generative art is the practice of creating artwork using code. When the programming language of choice is R, it's often termed *Rtistry* or *aRt*. The generative artwork below can be reproduced using my {aRt} package on [GitHub](https://github.com/nrennie/aRt), which you can install in R using: 

```r
remotes::install_github("nrennie/aRt")
library(aRt)
```

{{< three-images
"https://raw.githubusercontent.com/nrennie/nrennie.rbind.io/main/content/portfolio/rtistry/Images/abacus1.jpeg"
"https://raw.githubusercontent.com/nrennie/nrennie.rbind.io/main/content/portfolio/rtistry/Images/abacus2.jpeg"
"https://raw.githubusercontent.com/nrennie/nrennie.rbind.io/main/content/portfolio/rtistry/Images/abacus3.jpeg" >}}

{{< detail-tag "Code" >}}
```r
abacus(nx = 30, ny = 100, max_size = 2, main_col = "black", bg_col = "white", s = 123)
abacus(nx = 20, ny = 10, max_size = 4, main_col = "white", bg_col = "black", s = 12)
abacus(nx = 100, ny = 100, max_size = 3, main_col = "#008080", bg_col = "white", s = 123)
```
{{< /detail-tag >}}

{{< three-images
"https://raw.githubusercontent.com/nrennie/nrennie.rbind.io/main/content/portfolio/rtistry/Images/attraction1.jpeg"
"https://raw.githubusercontent.com/nrennie/nrennie.rbind.io/main/content/portfolio/rtistry/Images/attraction2.jpeg"
"https://raw.githubusercontent.com/nrennie/nrennie.rbind.io/main/content/portfolio/rtistry/Images/attraction3.jpeg" >}}

{{< detail-tag "Code" >}}
```r
attraction(n = 50000, a = -3, b = 1, c = 0.5, d = -1, main_col = "black", bg_col = "white")
attraction(n = 50000, a = -6, b = 1, c = 0.5, d = -2, main_col = "black", bg_col = "white")
attraction(n = 50000, a = -3, b = -2, c = 1, d = -1, main_col = rcartocolor::carto_pal(n  =  7, "SunsetDark"), bg_col = "white")
```
{{< /detail-tag >}}

{{< three-images
"https://raw.githubusercontent.com/nrennie/nrennie.rbind.io/main/content/portfolio/rtistry/Images/black_hole1.jpeg"
"https://raw.githubusercontent.com/nrennie/nrennie.rbind.io/main/content/portfolio/rtistry/Images/black_hole2.jpeg"
"https://raw.githubusercontent.com/nrennie/nrennie.rbind.io/main/content/portfolio/rtistry/Images/black_hole3.jpeg" >}}

{{< detail-tag "Code" >}}
```r
black_hole(r_max = c(50, 150, 250, 350), n = 10000, lim = 300, main_cols = rcartocolor::carto_pal(n = 7, name = "SunsetDark"), bg_col = "black", size = 0.01, a = 0.5, s = 1234)
black_hole(r_max = 100, n = 50000, lim = 300, main_cols = rev(rcartocolor::carto_pal(n = 7, name = "Teal")), bg_col = "white", size = 0.05, a = 0.3, s = 1234)
black_hole(r_max = c(50, 150, 250), n = 20000, lim = 500, main_cols = rcartocolor::carto_pal(n = 7, name = "SunsetDark"), bg_col = "black", size = 0.01, a = 0.75, s = 1234)
```
{{< /detail-tag >}}

{{< three-images
"https://raw.githubusercontent.com/nrennie/nrennie.rbind.io/main/content/portfolio/rtistry/Images/blending1.jpeg"
"https://raw.githubusercontent.com/nrennie/nrennie.rbind.io/main/content/portfolio/rtistry/Images/blending2.jpeg"
"https://raw.githubusercontent.com/nrennie/nrennie.rbind.io/main/content/portfolio/rtistry/Images/blending3.jpeg" >}}

{{< detail-tag "Code" >}}
```r
blending(n = 100, down = "white", up = "black", s = 1234)
blending(n = 500, down = "white", up = "black", s = 1234)
blending(n = 100, down = "#ba1141", up = "#003366", s = 1234)
```
{{< /detail-tag >}}

{{< three-images
"https://raw.githubusercontent.com/nrennie/nrennie.rbind.io/main/content/portfolio/rtistry/Images/boxes_n100_p1.jpeg"
"https://raw.githubusercontent.com/nrennie/nrennie.rbind.io/main/content/portfolio/rtistry/Images/boxes_n20_p1.jpeg"
"https://raw.githubusercontent.com/nrennie/nrennie.rbind.io/main/content/portfolio/rtistry/Images/boxes_n100_p5.jpeg" >}}

{{< detail-tag "Code" >}}
```r
boxes(n = 100, perc = 0.1, col_palette = rcartocolor::carto_pal(n = 7, "DarkMint"), bg_col = "black", s = 1234)
boxes(n = 20, perc = 0.1, col_palette = rcartocolor::carto_pal(n = 7, "DarkMint"), bg_col = "black", s = 1234)
boxes(n = 100, perc = 0.5, col_palette = rcartocolor::carto_pal(n = 7, "Magenta"), bg_col = "black", s = 1234)
```
{{< /detail-tag >}}

{{< three-images
"https://raw.githubusercontent.com/nrennie/nrennie.rbind.io/main/content/portfolio/rtistry/Images/bricks1.jpeg"
"https://raw.githubusercontent.com/nrennie/nrennie.rbind.io/main/content/portfolio/rtistry/Images/bricks2.jpeg"
"https://raw.githubusercontent.com/nrennie/nrennie.rbind.io/main/content/portfolio/rtistry/Images/bricks3.jpeg" >}}

{{< detail-tag "Code" >}}
```r
bricks(n_y = 20, colours = c("#9B1D20", "#3D2B3D", "#CBEFB6", "#635D5C"), bg_col = "gray97")
bricks(n_y = 200, colours = c("#9B1D20", "#3D2B3D", "#CBEFB6", "#635D5C"), bg_col = "gray97")
bricks(n_y = 20, colours = rcartocolor::carto_pal(7, "Burg"), bg_col = "gray97")
```
{{< /detail-tag >}}

{{< three-images
"https://raw.githubusercontent.com/nrennie/nrennie.rbind.io/main/content/portfolio/rtistry/Images/bubbles1.jpeg"
"https://raw.githubusercontent.com/nrennie/nrennie.rbind.io/main/content/portfolio/rtistry/Images/bubbles2.jpeg"
"https://raw.githubusercontent.com/nrennie/nrennie.rbind.io/main/content/portfolio/rtistry/Images/bubbles3.jpeg" >}}

{{< detail-tag "Code" >}}
```r
bubbles(num_circles = 20, main_col = "black", col_palette = rcartocolor::carto_pal(n = 12, "Bold"), bg_col = "white", s = 1234)
bubbles(num_circles = 20, main_col = "lightgrey", col_palette = rcartocolor::carto_pal(n = 12, "Bold"), bg_col = "white", s = 123)
bubbles(num_circles = 10, main_col = "white", col_palette = rcartocolor::carto_pal(n = 12, "Prism"), bg_col = "black", s = 2022)
```
{{< /detail-tag >}}

{{< three-images
"https://raw.githubusercontent.com/nrennie/nrennie.rbind.io/main/content/portfolio/rtistry/Images/bullseye_1234.jpeg"
"https://raw.githubusercontent.com/nrennie/nrennie.rbind.io/main/content/portfolio/rtistry/Images/bullseye_1234n.jpeg"
"https://raw.githubusercontent.com/nrennie/nrennie.rbind.io/main/content/portfolio/rtistry/Images/bullseye_2021.jpeg" >}}

{{< detail-tag "Code" >}}
```r
bullseye(main_col = "black", bg_col = "white", s = 1234)
bullseye(main_col = "white", bg_col = "black", s = 1234)
bullseye(main_col = "black", bg_col = "white", s = 2021)
```
{{< /detail-tag >}}

{{< three-images
"https://raw.githubusercontent.com/nrennie/nrennie.rbind.io/main/content/portfolio/rtistry/Images/chaos1.png"
"https://raw.githubusercontent.com/nrennie/nrennie.rbind.io/main/content/portfolio/rtistry/Images/chaos2.png"
"https://raw.githubusercontent.com/nrennie/nrennie.rbind.io/main/content/portfolio/rtistry/Images/chaos3.png" >}}

{{< detail-tag "Code" >}}
```r
chaos(n_lines = 75, n_points = 10, n_circles = 20, line_col = "grey70", point_col = "black", circle_col = "white", circle_line_col = "black", bg_col = "white", min_circle = 0.01, max_circle = 0.1, linewidth = 0.2, alpha = 0.5, size = 0.3, s = 1234)
chaos(n_lines = 100, n_points = 45, n_circles = 25, line_col = "grey40", point_col = "white", circle_col = "grey10", circle_line_col = "white", bg_col = "grey10", min_circle = 0.005, max_circle = 0.15, linewidth = 0.15, alpha = 0.6, size = 0.4, s = 2024)
chaos(n_lines = 150, n_points = 50, n_circles = 20, line_col = "#EDAE49", point_col = "#D1495B", circle_col = "#003D5B", circle_line_col = "#00798C", bg_col = "#413C58", min_circle = 0.005, max_circle = 0.05, linewidth = 0.1, alpha = 0.5, size = 1, s = 2023)
```
{{< /detail-tag >}}

{{< three-images
"https://raw.githubusercontent.com/nrennie/nrennie.rbind.io/main/content/portfolio/rtistry/Images/circles1.jpeg"
"https://raw.githubusercontent.com/nrennie/nrennie.rbind.io/main/content/portfolio/rtistry/Images/circles2.jpeg"
"https://raw.githubusercontent.com/nrennie/nrennie.rbind.io/main/content/portfolio/rtistry/Images/circles3.jpeg" >}}

{{< detail-tag "Code" >}}
```r
circles(n = 100, smoothness = 100, col_palette = rcartocolor::carto_pal(n  =  12, "Bold"), line_col = NA, bg_col = "black", s = 1234)
circles(n = 10, smoothness = 100, col_palette = rcartocolor::carto_pal(n  =  12, "Bold"), line_col = NA, bg_col = "#e73f74", s = 1234)
circles(n = 2, smoothness = 3, col_palette = rcartocolor::carto_pal(n  =  12, "Bold"), line_col = "black", bg_col = "black", s = 1234)
```
{{< /detail-tag >}}

{{< three-images
"https://raw.githubusercontent.com/nrennie/nrennie.rbind.io/main/content/portfolio/rtistry/Images/circular_n2.jpeg"
"https://raw.githubusercontent.com/nrennie/nrennie.rbind.io/main/content/portfolio/rtistry/Images/circular_n10.jpeg"
"https://raw.githubusercontent.com/nrennie/nrennie.rbind.io/main/content/portfolio/rtistry/Images/circular_n100.jpeg" >}}

{{< detail-tag "Code" >}}
```r
circular(n = 2, main_col = "black", bg_col = "white", s = 56)
circular(n = 10, main_col = "black", bg_col = "white", s = 56)
circular(n = 100, main_col = "black", bg_col = "white", s = 56)
```
{{< /detail-tag >}}

{{< three-images
"https://raw.githubusercontent.com/nrennie/nrennie.rbind.io/main/content/portfolio/rtistry/Images/connected_100_10F.jpeg"
"https://raw.githubusercontent.com/nrennie/nrennie.rbind.io/main/content/portfolio/rtistry/Images/connected_100_10T.jpeg"
"https://raw.githubusercontent.com/nrennie/nrennie.rbind.io/main/content/portfolio/rtistry/Images/connected_250_2F.jpeg" >}}

{{< detail-tag "Code" >}}
```r
connected(n = 100, n_geom = 10, random = F, col_palette = RColorBrewer::brewer.pal(n  =  9,"RdPu"), bg_col = "#ae217e", s = 1234)
connected(n = 100, n_geom = 10, random = T, col_palette = RColorBrewer::brewer.pal(n  =  9,"RdPu"), bg_col = "#ae217e", s = 1234)
connected(n = 250, n_geom = 2, random = F, col_palette = RColorBrewer::brewer.pal(n  =  5,"RdPu"), bg_col = "#ae217e", s = 1234)
```
{{< /detail-tag >}}

{{< three-images
"https://raw.githubusercontent.com/nrennie/nrennie.rbind.io/main/content/portfolio/rtistry/Images/contours1.jpeg"
"https://raw.githubusercontent.com/nrennie/nrennie.rbind.io/main/content/portfolio/rtistry/Images/contours2.jpeg"
"https://raw.githubusercontent.com/nrennie/nrennie.rbind.io/main/content/portfolio/rtistry/Images/contours3.jpeg" >}}

{{< detail-tag "Code" >}}
```r
contours(xmin = -3.27, xmax = -3.15, ymin = 54.43, ymax = 54.49, col_palette = MetBrewer::met.brewer("Hokusai3"), light = "white", dark = "black", range = c(0.5, 1)) 
contours(xmin = -3.27, xmax = -3.15, ymin = 54.43, ymax = 54.49, col_palette = "white", light = "lightgrey", dark = "black", range = c(1, 2)) 
contours(xmin = -5.45, xmax = -5.04, ymin = 55.43, ymax = 55.72, col_palette = PrettyCols::prettycols("Teals"), light = "white", dark = "black", range = c(0.5, 1)) 
```
{{< /detail-tag >}}

{{< three-images
"https://raw.githubusercontent.com/nrennie/nrennie.rbind.io/main/content/portfolio/rtistry/Images/crawling50.jpeg"
"https://raw.githubusercontent.com/nrennie/nrennie.rbind.io/main/content/portfolio/rtistry/Images/crawling250.jpeg"
"https://raw.githubusercontent.com/nrennie/nrennie.rbind.io/main/content/portfolio/rtistry/Images/crawling1000.jpeg" >}}

{{< detail-tag "Code" >}}
```r
crawling(n = 50, edge_colour = "black", node_size = 1, node_colour = "black", bg_col = "white", s = 1234)
crawling(n = 250, edge_colour = "black", node_size = 1, node_colour = "black", bg_col = "white", s = 1234)
crawling(n = 1000, edge_colour = "black", node_size = 1, node_colour = "black", bg_col = "white", s = 1234)
```
{{< /detail-tag >}}

{{< three-images
"https://raw.githubusercontent.com/nrennie/nrennie.rbind.io/main/content/portfolio/rtistry/Images/criss_cross1.png"
"https://raw.githubusercontent.com/nrennie/nrennie.rbind.io/main/content/portfolio/rtistry/Images/criss_cross2.png"
"https://raw.githubusercontent.com/nrennie/nrennie.rbind.io/main/content/portfolio/rtistry/Images/criss_cross3.png" >}}

{{< detail-tag "Code" >}}
```r
criss_cross(n = 25, bg_col = "white", line_col = "grey50", linewidth = 0.1, outline_col = "black", outline_width = 1.5, s = 1234)
criss_cross(n = 100, bg_col = "black", line_col = PrettyCols::prettycols("Lucent"), linewidth = 0.1, outline_col = "#F9C22E", outline_width = 1, s = 2023)
criss_cross(n = 10, bg_col = ggplot2::alpha("#462255", 0.6), line_col = PrettyCols::prettycols("Bright"), linewidth = 0.9, outline_col = "#462255", outline_width = 1.5, s = 1234)
```
{{< /detail-tag >}}

{{< three-images
"https://raw.githubusercontent.com/nrennie/nrennie.rbind.io/main/content/portfolio/rtistry/Images/divide1.jpeg"
"https://raw.githubusercontent.com/nrennie/nrennie.rbind.io/main/content/portfolio/rtistry/Images/divide2.jpeg"
"https://raw.githubusercontent.com/nrennie/nrennie.rbind.io/main/content/portfolio/rtistry/Images/divide3.jpeg" >}}

{{< detail-tag "Code" >}}
```r
divide(num_lines = 30, col_palette = PrettyCols::prettycols("TangerineBlues"), s = 1234)
divide(num_lines = 80, col_palette = grey.colors(n = 80), s = 1234)
divide(num_lines = 15, col_palette = MetBrewer::met.brewer("OKeeffe2"), s = 2022)
```
{{< /detail-tag >}}

{{< three-images
"https://raw.githubusercontent.com/nrennie/nrennie.rbind.io/main/content/portfolio/rtistry/Images/dots1.jpeg"
"https://raw.githubusercontent.com/nrennie/nrennie.rbind.io/main/content/portfolio/rtistry/Images/dots2.jpeg"
"https://raw.githubusercontent.com/nrennie/nrennie.rbind.io/main/content/portfolio/rtistry/Images/dots3.jpeg" >}}

{{< detail-tag "Code" >}}
```r
dots(n_x = 50, n_y = 100, jitter_size_width = 0.5, jitter_size_height = 0.5, col_palette  =  rcartocolor::carto_pal(n  =  7, "Purp"), bg_col = "#63589f", s = 1234)
dots(n_x = 500, n_y = 100, jitter_size_width = 0.5, jitter_size_height = 5, col_palette  =  rcartocolor::carto_pal(n  =  7, "Purp"), bg_col = "#63589f", s = 1234)
dots(n_x = 50, n_y = 100, jitter_size_width = 0.05, jitter_size_height = 50, col_palette  =  rcartocolor::carto_pal(n  =  7, "Purp"), bg_col = "#63589f", s = 1234)
```
{{< /detail-tag >}}

{{< three-images
"https://raw.githubusercontent.com/nrennie/nrennie.rbind.io/main/content/portfolio/rtistry/Images/fading_6_10.jpeg"
"https://raw.githubusercontent.com/nrennie/nrennie.rbind.io/main/content/portfolio/rtistry/Images/fading_6_1.jpeg"
"https://raw.githubusercontent.com/nrennie/nrennie.rbind.io/main/content/portfolio/rtistry/Images/fading_10_10.jpeg" >}}

{{< detail-tag "Code" >}}
```r
fading(n_layers = 6, n_points = 10, col_palette = rcartocolor::carto_pal(n  =  7, "SunsetDark"), s = 1234)
fading(n_layers = 6, n_points = 1, col_palette = rcartocolor::carto_pal(n  =  7, "Sunset"), s = 1234)
fading(n_layers = 10, n_points = 10, col_palette = rcartocolor::carto_pal(n  =  7, "SunsetDark"), s = 1234)
```
{{< /detail-tag >}}

{{< three-images
"https://raw.githubusercontent.com/nrennie/nrennie.rbind.io/main/content/portfolio/rtistry/Images/flow_fields1.jpeg"
"https://raw.githubusercontent.com/nrennie/nrennie.rbind.io/main/content/portfolio/rtistry/Images/flow_fields2.jpeg"
"https://raw.githubusercontent.com/nrennie/nrennie.rbind.io/main/content/portfolio/rtistry/Images/flow_fields3.jpeg" >}}

{{< detail-tag "Code" >}}
```r
flow_fields(n = 10000, granularity = 1000, x_freq = 1, y_freq = 1, alpha = 1, line_col = c("#edf8fb","#bfd3e6","#9ebcda","#8c96c6","#8c6bb1","#88419d","#6e016b"), bg_col = "lightgrey", s = 1234)
flow_fields(n = 10000, granularity = 1000, x_freq = 1, y_freq = 1, alpha = 0.3, line_col = "black", bg_col = "white", s = 1234)
flow_fields(n = 10000, granularity = 1000, x_freq = 3, y_freq = 0.2, alpha = 1, line_col = c("#edf8fb","#bfd3e6","#9ebcda","#8c96c6","#8c6bb1","#88419d","#6e016b"), bg_col = "lightgrey", s = 1234)
```
{{< /detail-tag >}}

{{< three-images
"https://raw.githubusercontent.com/nrennie/nrennie.rbind.io/main/content/portfolio/rtistry/Images/fractals1.jpeg"
"https://raw.githubusercontent.com/nrennie/nrennie.rbind.io/main/content/portfolio/rtistry/Images/fractals2.jpeg"
"https://raw.githubusercontent.com/nrennie/nrennie.rbind.io/main/content/portfolio/rtistry/Images/fractals3.jpeg" >}}

{{< detail-tag "Code" >}}
```r
fractals(N = 25, col_palette = MetBrewer::met.brewer("Demuth", n = 25), shift = 0, left = -1, right = 1, y_param = 3, resolution = 0.005, dist_max = 4)
fractals(N = 25, col_palette = rev(MetBrewer::met.brewer("Benedictus", n = 25)), shift = 0, left = -3, right = 3, y_param = 2, resolution = 0.005, dist_max = 4)
fractals(N = 20, col_palette = grey.colors(30), shift = -1, left = -1, right = 1, y_param = 2, resolution = 0.005, dist_max = 3)
```
{{< /detail-tag >}}

{{< three-images
"https://raw.githubusercontent.com/nrennie/nrennie.rbind.io/main/content/portfolio/rtistry/Images/gradients1.png"
"https://raw.githubusercontent.com/nrennie/nrennie.rbind.io/main/content/portfolio/rtistry/Images/gradients2.png"
"https://raw.githubusercontent.com/nrennie/nrennie.rbind.io/main/content/portfolio/rtistry/Images/gradients3.png" >}}

{{< detail-tag "Code" >}}
```r
gradients(nx = 5, ny = 5, s = 1234)
gradients(nx = 3, ny = 3, s = 2023)
gradients(nx = 20, ny = 20, s = 1234)
```
{{< /detail-tag >}}

{{< three-images
"https://raw.githubusercontent.com/nrennie/nrennie.rbind.io/main/content/portfolio/rtistry/Images/heart_n25_m.jpeg"
"https://raw.githubusercontent.com/nrennie/nrennie.rbind.io/main/content/portfolio/rtistry/Images/heart_n100_m.jpeg"
"https://raw.githubusercontent.com/nrennie/nrennie.rbind.io/main/content/portfolio/rtistry/Images/heart_n25_r.jpeg" >}}

{{< detail-tag "Code" >}}
```r
heart(n = 25, col_scheme = "mono", bg_col = "black", s = 1234)
heart(n = 100, col_scheme = "mono", bg_col = "black", s = 1234)
heart(n = 25, col_scheme = "rainbow", bg_col = "black", s = 1234)
```
{{< /detail-tag >}}

{{< three-images
"https://raw.githubusercontent.com/nrennie/nrennie.rbind.io/main/content/portfolio/rtistry/Images/infinity_n25_m.jpeg"
"https://raw.githubusercontent.com/nrennie/nrennie.rbind.io/main/content/portfolio/rtistry/Images/infinity_n100_m.jpeg"
"https://raw.githubusercontent.com/nrennie/nrennie.rbind.io/main/content/portfolio/rtistry/Images/infinity_n25_r.jpeg" >}}

{{< detail-tag "Code" >}}
```r
infinity(n = 25, col_scheme = "mono", bg_col = "black", s = 1234)
infinity(n = 100, col_scheme = "mono", bg_col = "black", s = 1234)
infinity(n = 25, col_scheme = "rainbow", bg_col = "black", s = 1234)
```
{{< /detail-tag >}}

{{< three-images
"https://raw.githubusercontent.com/nrennie/nrennie.rbind.io/main/content/portfolio/rtistry/Images/perpendicular1.jpeg"
"https://raw.githubusercontent.com/nrennie/nrennie.rbind.io/main/content/portfolio/rtistry/Images/perpendicular2.jpeg"
"https://raw.githubusercontent.com/nrennie/nrennie.rbind.io/main/content/portfolio/rtistry/Images/perpendicular3.jpeg" >}}

{{< detail-tag "Code" >}}
```r
perpendicular(n = 100, max_length = 7, linewidth = 0.5, main_col = "black", bg_col = "white", s = 123)
perpendicular(n = 1000, max_length = 5, linewidth = 0.1, main_col = "#32A287", bg_col = "white", s = 12)
perpendicular(n = 50, max_length = 10, linewidth = 0.5, main_col = "#C03221", bg_col = "#f2d6d2", s = 2023)
```
{{< /detail-tag >}}

{{< three-images
"https://raw.githubusercontent.com/nrennie/nrennie.rbind.io/main/content/portfolio/rtistry/Images/moire1.jpeg"
"https://raw.githubusercontent.com/nrennie/nrennie.rbind.io/main/content/portfolio/rtistry/Images/moire2.jpeg"
"https://raw.githubusercontent.com/nrennie/nrennie.rbind.io/main/content/portfolio/rtistry/Images/moire3.jpeg" >}}

{{< detail-tag "Code" >}}
```r
moire(inner_n = 20, dist = 10, inner_col = "grey40", outer_col = "grey60", bg_col = "grey10", inner_r = 0.5, outer_r = 0.2)
moire(inner_n = 20, dist = 4, inner_col = "grey50", outer_col = "#616283", bg_col = "#fafafa", inner_r = 0.5, outer_r = 0.3)
moire(inner_n = 4, dist = 2, inner_col = "#533E2D", outer_col = "#A27035", bg_col = "#B88B4A", inner_r = 0.35, outer_r = 0.2)
```
{{< /detail-tag >}}

{{< three-images
"https://raw.githubusercontent.com/nrennie/nrennie.rbind.io/main/content/portfolio/rtistry/Images/mirrored1.png"
"https://raw.githubusercontent.com/nrennie/nrennie.rbind.io/main/content/portfolio/rtistry/Images/mirrored2.png"
"https://raw.githubusercontent.com/nrennie/nrennie.rbind.io/main/content/portfolio/rtistry/Images/mirrored3.png" >}}

{{< detail-tag "Code" >}}
```r
mirrored(n = 15, w = 4, col_palette = PrettyCols::prettycols("PurpleTangerines"), s = 1234)
mirrored(n = 10, w = 2, col_palette = c("grey80", "grey20"), s = 19)
mirrored(n = 20, w = 4, col_palette = rev(PrettyCols::prettycols("Beach")), s = 1234)
```
{{< /detail-tag >}}

{{< three-images
"https://raw.githubusercontent.com/nrennie/nrennie.rbind.io/main/content/portfolio/rtistry/Images/mosaic1.png"
"https://raw.githubusercontent.com/nrennie/nrennie.rbind.io/main/content/portfolio/rtistry/Images/mosaic2.png"
"https://raw.githubusercontent.com/nrennie/nrennie.rbind.io/main/content/portfolio/rtistry/Images/mosaic3.png" >}}

{{< detail-tag "Code" >}}
```r
mosaic(n = 100, fill_cols = c("#4B3F72", "#CBB3BF", "#FFC857", "#119DA4", "#19647E"), line_col = "white", bg_col = "white", line_size = 1, x_means = c(0, 10, 5), y_means = c(0, 7, 8), xy_var = 2, s = 1234)
mosaic(n = 100, fill_cols = "white", line_col = "black", bg_col = "black", line_size = 1, x_means = 0, y_means = 0, xy_var = 5, s = 1234)
mosaic(n = 500, fill_cols = c("#436f85", "#432263", "#de7a00", "#416322", "#860a4d"), line_col = "white", bg_col = "white", line_size = 0.5, x_means = c(0, 10, 5), y_means = c(0, 7, 8), xy_var = 2, s = 1234)
```
{{< /detail-tag >}}

{{< three-images
"https://raw.githubusercontent.com/nrennie/nrennie.rbind.io/main/content/portfolio/rtistry/Images/mosaic_sketch1.jpeg"
"https://raw.githubusercontent.com/nrennie/nrennie.rbind.io/main/content/portfolio/rtistry/Images/mosaic_sketch2.jpeg"
"https://raw.githubusercontent.com/nrennie/nrennie.rbind.io/main/content/portfolio/rtistry/Images/mosaic_sketch3.jpeg" >}}

{{< detail-tag "Code" >}}
```r
mosaic_sketch(n = 10, fill_cols = c("#4B3F72", "#CBB3BF", "#FFC857", "#119DA4", "#19647E"), line_col = "white", bg_col = "white", line_size = 2, x_means = c(0, 10, 5), y_means = c(0, 7, 8), xy_var = 2, s = 1234)
mosaic_sketch(n = 20, fill_cols = c("white", "#008080"), line_col = "white", bg_col = "#008080", line_size = 1.5, x_means = c(0, 10, 5), y_means = c(0, 7, 8), xy_var = 2, s = 1234)
mosaic_sketch(n = 6, fill_cols = "black", line_col = "white", bg_col = "white", line_size = 2, x_means = c(0, 10, 5), y_means = c(0, 7, 8), xy_var = 2, s = 1234)
```
{{< /detail-tag >}}

{{< three-images
"https://raw.githubusercontent.com/nrennie/nrennie.rbind.io/main/content/portfolio/rtistry/Images/polygons1.jpeg"
"https://raw.githubusercontent.com/nrennie/nrennie.rbind.io/main/content/portfolio/rtistry/Images/polygons2.jpeg"
"https://raw.githubusercontent.com/nrennie/nrennie.rbind.io/main/content/portfolio/rtistry/Images/polygons3.jpeg" >}}

{{< detail-tag "Code" >}}
```r
polygons(n_x = 12, n_y = 18, gap_size = 0.5, deg_jitter = 0.1, colours = c("#9B1D20", "#3D2B3D", "#CBEFB6", "#635D5C"), rand  =  FALSE, bg_col = "gray97")
polygons(n_x = 6, n_y = 9, gap_size = 0.2, deg_jitter = 0.1, colours = c("#9B1D20", "#3D2B3D", "#CBEFB6", "#635D5C"), rand  =  FALSE, bg_col = "gray97")
polygons(n_x = 12, n_y = 18, gap_size = 0.5, deg_jitter = 0.5, colours = rcartocolor::carto_pal(7, "Burg"), rand  =  FALSE, bg_col = "gray97")
```
{{< /detail-tag >}}

{{< three-images
"https://raw.githubusercontent.com/nrennie/nrennie.rbind.io/main/content/portfolio/rtistry/Images/puzzles1.png"
"https://raw.githubusercontent.com/nrennie/nrennie.rbind.io/main/content/portfolio/rtistry/Images/puzzles2.png"
"https://raw.githubusercontent.com/nrennie/nrennie.rbind.io/main/content/portfolio/rtistry/Images/puzzles3.png" >}}

{{< detail-tag "Code" >}}
```r
puzzles(n = 200, num_groups = 30, col_palette = PrettyCols::prettycols("Beach"), bg_col = "white", s = 1234)
puzzles(n = 200, num_groups = 50, col_palette = c("black", "white"), bg_col = "black", s = 59)
puzzles(n = 1000, num_groups = 700, col_palette = PrettyCols::prettycols("Beach"), bg_col = "white", s = 1234)
```
{{< /detail-tag >}}

{{< three-images
"https://raw.githubusercontent.com/nrennie/nrennie.rbind.io/main/content/portfolio/rtistry/Images/random_tessellation1.png"
"https://raw.githubusercontent.com/nrennie/nrennie.rbind.io/main/content/portfolio/rtistry/Images/random_tessellation2.png"
"https://raw.githubusercontent.com/nrennie/nrennie.rbind.io/main/content/portfolio/rtistry/Images/random_tessellation3.png" >}}

{{< detail-tag "Code" >}}
```r
random_tessellation(n_x = 10, n_y = 10, deg_jitter = 0.1, linewidth = 0.5, line_col = "black", bg_col = "black", col_palette = PrettyCols::prettycols("Lively"), s = 1234)
random_tessellation(n_x = 30, n_y = 30, deg_jitter = 0.3, linewidth = 0.1, line_col = "black", bg_col = "#357BA2FF", col_palette = viridis::mako(n = 6), s = 1234)
random_tessellation(n_x = 25, n_y = 25, deg_jitter = 0.45, linewidth = 1, line_col = "grey60", bg_col = "grey20", col_palette = grey.colors(n = 15, start = 0.1), s = 1234)
```
{{< /detail-tag >}}

{{< three-images
"https://raw.githubusercontent.com/nrennie/nrennie.rbind.io/main/content/portfolio/rtistry/Images/rectangles1.jpeg"
"https://raw.githubusercontent.com/nrennie/nrennie.rbind.io/main/content/portfolio/rtistry/Images/rectangles2.jpeg"
"https://raw.githubusercontent.com/nrennie/nrennie.rbind.io/main/content/portfolio/rtistry/Images/rectangles3.jpeg" >}}

{{< detail-tag "Code" >}}
```r
rectangles(n = 100, max_height = 7, max_width = 5, size = 2, main_col = "lightgrey", col_palette = rcartocolor::carto_pal(n = 12, "Bold"), bg_col = "white", s = 123)
rectangles(n = 10, max_height = 15, max_width = 15, size = 4, main_col = "lightgrey", col_palette = rcartocolor::carto_pal(n = 12, "Bold"), bg_col = "white", s = 123)
rectangles(n = 100, max_height = 4, max_width = 6, size = 1, main_col = ggplot2::alpha("white", 0.5), col_palette = rcartocolor::carto_pal(n = 12, "Prism"), bg_col = "black", s = 123)
```
{{< /detail-tag >}}

{{< three-images
"https://raw.githubusercontent.com/nrennie/nrennie.rbind.io/main/content/portfolio/rtistry/Images/riley1.jpeg"
"https://raw.githubusercontent.com/nrennie/nrennie.rbind.io/main/content/portfolio/rtistry/Images/riley2.jpeg"
"https://raw.githubusercontent.com/nrennie/nrennie.rbind.io/main/content/portfolio/rtistry/Images/riley3.jpeg" >}}

{{< detail-tag "Code" >}}
```r
riley(n_x = 9, n_y = 9, offset = 3, main_col = "black", bg_col = "white")
riley(n_x = 3, n_y = 9, offset = 3, main_col = "#0E1116", bg_col = "#374A67")
riley(n_x = 12, n_y = 6, offset = 0, main_col = "#481620", bg_col = "#fafafa")
```
{{< /detail-tag >}}

{{< three-images
"https://raw.githubusercontent.com/nrennie/nrennie.rbind.io/main/content/portfolio/rtistry/Images/rings1.png"
"https://raw.githubusercontent.com/nrennie/nrennie.rbind.io/main/content/portfolio/rtistry/Images/rings2.png"
"https://raw.githubusercontent.com/nrennie/nrennie.rbind.io/main/content/portfolio/rtistry/Images/rings3.png" >}}

{{< detail-tag "Code" >}}
```r
rings(col_palette = PrettyCols::prettycols("Lively"), bg_col = "#343046", x_ring = c(0.2, 0.9), y_ring = c(0.2, 1.8), r_ring = c(0.6, 0.4), x0 = c(0, 1), y0 = c(0, 2), r = c(1, 0.7), n = c(80, 80))
rings(col_palette = PrettyCols::prettycols("Bright"), bg_col = "#EDAE49", x_ring = c(0.2, 0.9, 2.1), y_ring = c(0.2, 1.8, 0.9), r_ring = c(0.6, 0.4, 0.4), x0 = c(0, 1, 2), y0 = c(0, 2, 0.8), r = c(1, 0.7, 0.6), n = c(50, 50, 50))
rings(col_palette = grey.colors(n = 20, start = 0.1), bg_col = "black", x_ring = rep(seq(1:3), 3), y_ring = rep(seq(1:3), each = 3), r_ring = rep(0.1, 9), x0 = rep(seq(1:3), 3), y0 = rep(seq(1:3), each = 3), r = rep(0.48, 9), n = rep(80, 9))
```
{{< /detail-tag >}}

{{< three-images
"https://raw.githubusercontent.com/nrennie/nrennie.rbind.io/main/content/portfolio/rtistry/Images/shatter1.png"
"https://raw.githubusercontent.com/nrennie/nrennie.rbind.io/main/content/portfolio/rtistry/Images/shatter2.png"
"https://raw.githubusercontent.com/nrennie/nrennie.rbind.io/main/content/portfolio/rtistry/Images/shatter3.png" >}}

{{< detail-tag "Code" >}}
```r
shatter(n_x = 25, n_y = 25, decay = 0.9, colour = "black", bg_col = "gray97", s = 1234)
shatter(n_x = 100, n_y = 100, decay = 0.7, colour = "gray90", bg_col = "gray10", s = 1234)
shatter(n_x = 20, n_y = 20, decay = 0.5, colour = "#D455B8", bg_col = "#55D471", s = 1234)
```
{{< /detail-tag >}}

{{< three-images
"https://raw.githubusercontent.com/nrennie/nrennie.rbind.io/main/content/portfolio/rtistry/Images/shell1.jpeg"
"https://raw.githubusercontent.com/nrennie/nrennie.rbind.io/main/content/portfolio/rtistry/Images/shell2.jpeg"
"https://raw.githubusercontent.com/nrennie/nrennie.rbind.io/main/content/portfolio/rtistry/Images/shell3.jpeg" >}}

{{< detail-tag "Code" >}}
```r
shells(n = 4, alpha = 1, main_col = "black", bg_col = "white")
shells(n = 10, alpha = 1, main_col = "black", bg_col = "white")
shells(n = 6, alpha = 0.5, main_col = "#CC338B", bg_col = alpha("#CC338B", 0.2))
```
{{< /detail-tag >}}

{{< three-images
"https://raw.githubusercontent.com/nrennie/nrennie.rbind.io/main/content/portfolio/rtistry/Images/smudge1.jpeg"
"https://raw.githubusercontent.com/nrennie/nrennie.rbind.io/main/content/portfolio/rtistry/Images/smudge2.jpeg"
"https://raw.githubusercontent.com/nrennie/nrennie.rbind.io/main/content/portfolio/rtistry/Images/smudge3.jpeg" >}}

{{< detail-tag "Code" >}}
```r
smudge(n = 25, binwidth = 0.01, col_palette = PrettyCols::prettycols("TangerineBlues"), s = 1234)
smudge(n = 25, binwidth = 0.1, col_palette = PrettyCols::prettycols("Dark"), s = 2022)
smudge(n = 15, binwidth = 0.05, col_palette = grey.colors(12, 0, 0.9), s = 1234)
```
{{< /detail-tag >}}

{{< three-images
"https://raw.githubusercontent.com/nrennie/nrennie.rbind.io/main/content/portfolio/rtistry/Images/spirals_p2.jpeg"
"https://raw.githubusercontent.com/nrennie/nrennie.rbind.io/main/content/portfolio/rtistry/Images/spirals_p5.jpeg"
"https://raw.githubusercontent.com/nrennie/nrennie.rbind.io/main/content/portfolio/rtistry/Images/spirals_p8.jpeg" >}}

{{< detail-tag "Code" >}}
```r
spirals(perc = 0.2, s = 1234)
spirals(perc = 0.5, s = 1234)
spirals(perc = 0.8, s = 1234)
```
{{< /detail-tag >}}

{{< three-images
"https://raw.githubusercontent.com/nrennie/nrennie.rbind.io/main/content/portfolio/rtistry/Images/spiro1.png"
"https://raw.githubusercontent.com/nrennie/nrennie.rbind.io/main/content/portfolio/rtistry/Images/spiro2.png"
"https://raw.githubusercontent.com/nrennie/nrennie.rbind.io/main/content/portfolio/rtistry/Images/spiro3.png" >}}

{{< detail-tag "Code" >}}
```r
spiro(n_x = 10, n_y = 10, d = 10, R = 4, r = 1, bg_col = "grey20", linewidth = 0.5, col_palette = "white", s = 1234)
spiro(n_x = 5, n_y = 5, d = 10, R = 4, r = 1, bg_col = "grey20", linewidth = 0.5, col_palette = PrettyCols::prettycols("Lucent"), s = 2023)
spiro(n_x = 3, n_y = 3, d = 5, R = 8, r = 1, bg_col = "black", linewidth = 0.5, col_palette = PrettyCols::prettycols("Neon"), s = 1234)
```
{{< /detail-tag >}}

{{< three-images
"https://raw.githubusercontent.com/nrennie/nrennie.rbind.io/main/content/portfolio/rtistry/Images/squares_01.jpeg"
"https://raw.githubusercontent.com/nrennie/nrennie.rbind.io/main/content/portfolio/rtistry/Images/squares_02.jpeg"
"https://raw.githubusercontent.com/nrennie/nrennie.rbind.io/main/content/portfolio/rtistry/Images/squares_03.jpeg" >}}

{{< detail-tag "Code" >}}
```r
squares(n = 7, line_col = "white", pattern_col = "white", pattern_fill = "black", pattern_size = 0.4, size = 1.5, s = 1234)
squares(n = 5, line_col = "#2DC2BD", pattern_col = "#392759", pattern_fill = "#2DC2BD", pattern_size = 0.4, size = 1.5, s = 5678)
squares(n = 20, line_col = "white", pattern_col = "white", pattern_fill = "black", pattern_size = 0.4, size = 1.5, s = 1234)
```
{{< /detail-tag >}}

{{< three-images
"https://raw.githubusercontent.com/nrennie/nrennie.rbind.io/main/content/portfolio/rtistry/Images/squiggles1.jpeg"
"https://raw.githubusercontent.com/nrennie/nrennie.rbind.io/main/content/portfolio/rtistry/Images/squiggles2.jpeg"
"https://raw.githubusercontent.com/nrennie/nrennie.rbind.io/main/content/portfolio/rtistry/Images/squiggles3.jpeg" >}}

{{< detail-tag "Code" >}}
```r
squiggles(res = 100, num_lines = 100, perc = 0.1, alpha_low = 0.5, alpha_high = 1, line_col = "white", bg_col = "black", s = 1234)
squiggles(res = 1000, num_lines = 1000, perc = 0.01, alpha_low = 0.15, alpha_high = 1, line_col = "#374A67", bg_col = "white", s = 12)
squiggles(res = 100, num_lines = 10, perc = 0.5, alpha_low = 0.5, alpha_high = 1, line_col = "#348954", bg_col = "#fafafa", s = 1234)
```
{{< /detail-tag >}}

{{< three-images
"https://raw.githubusercontent.com/nrennie/nrennie.rbind.io/main/content/portfolio/rtistry/Images/stacked1.jpeg"
"https://raw.githubusercontent.com/nrennie/nrennie.rbind.io/main/content/portfolio/rtistry/Images/stacked2.jpeg"
"https://raw.githubusercontent.com/nrennie/nrennie.rbind.io/main/content/portfolio/rtistry/Images/stacked3.jpeg" >}}

{{< detail-tag "Code" >}}
```r
stacked(n_x = 5, n_y = 5, col_palette = MetBrewer::met.brewer("Hiroshige", 9), shadow_intensity = 0.5, sunangle = 315, s = 1234)
stacked(n_x = 4, n_y = 4, col_palette = MetBrewer::met.brewer("Monet", 6), shadow_intensity = 0.1, sunangle = 315, s = 123)
stacked(n_x = 20, n_y = 20, col_palette = MetBrewer::met.brewer("Hiroshige", 8), shadow_intensity = 0.3, sunangle = 180, s = 1234)
```
{{< /detail-tag >}}

{{< three-images
"https://raw.githubusercontent.com/nrennie/nrennie.rbind.io/main/content/portfolio/rtistry/Images/static_p01_n500.jpeg"
"https://raw.githubusercontent.com/nrennie/nrennie.rbind.io/main/content/portfolio/rtistry/Images/static_p10_n500.jpeg"
"https://raw.githubusercontent.com/nrennie/nrennie.rbind.io/main/content/portfolio/rtistry/Images/static_p30_n500.jpeg" >}}

{{< detail-tag "Code" >}}
```r
static(perc = 0.01, n = 500, s = 1234)
static(perc = 0.1, n = 500, s = 1234)
static(perc = 0.3, n = 500, s = 1234)
```
{{< /detail-tag >}}

{{< three-images
"https://raw.githubusercontent.com/nrennie/nrennie.rbind.io/main/content/portfolio/rtistry/Images/streams1.jpeg"
"https://raw.githubusercontent.com/nrennie/nrennie.rbind.io/main/content/portfolio/rtistry/Images/streams2.jpeg"
"https://raw.githubusercontent.com/nrennie/nrennie.rbind.io/main/content/portfolio/rtistry/Images/streams3.jpeg" >}}

{{< detail-tag "Code" >}}
```r
streams(bg_col = "white", line_col = "white", fill_col = c("#5F4690", "#1D6996", "#38A6A5", "#0F8554", "#73AF48", "#EDAD08", "#E17C05", "#CC503E", "#94346E", "#6F4070"), type = "right", s = 1234)
streams(bg_col = "black", line_col = NA, fill_col = grey.colors(n = 25), type = "up", s = 450)
streams(bg_col = "white", line_col = NA, fill_col = rep("purple", 8), type = "left", s = 13)
```
{{< /detail-tag >}}

{{< three-images
"https://raw.githubusercontent.com/nrennie/nrennie.rbind.io/main/content/portfolio/rtistry/Images/stripes_p00_n3.jpeg"
"https://raw.githubusercontent.com/nrennie/nrennie.rbind.io/main/content/portfolio/rtistry/Images/stripes_p50_n3.jpeg"
"https://raw.githubusercontent.com/nrennie/nrennie.rbind.io/main/content/portfolio/rtistry/Images/stripes_p100_n3.jpeg" >}}

{{< detail-tag "Code" >}}
```r
stripes(perc = 0, n = 3, col_palette  =  rcartocolor::carto_pal(n  =  7, "TealGrn"), alpha  =  1, s = 1234)
stripes(perc = 0.5, n = 3, col_palette  =  rcartocolor::carto_pal(n  =  7, "TealGrn"), alpha  =  1, s = 1234)
stripes(perc = 1, n = 3, col_palette  =  rcartocolor::carto_pal(n  =  7, "TealGrn"), alpha  =  1, s = 1234)
```
{{< /detail-tag >}}

{{< three-images
"https://raw.githubusercontent.com/nrennie/nrennie.rbind.io/main/content/portfolio/rtistry/Images/sunbursts1.jpeg"
"https://raw.githubusercontent.com/nrennie/nrennie.rbind.io/main/content/portfolio/rtistry/Images/sunbursts2.jpeg"
"https://raw.githubusercontent.com/nrennie/nrennie.rbind.io/main/content/portfolio/rtistry/Images/sunbursts3.jpeg" >}}

{{< detail-tag "Code" >}}
```r
sunbursts(n = 100, x_means = c(0, 10, 5), y_means = c(0, 7, 8), xy_var = 5, low = "#074050", high = "#d3f2a3", s = 1234)
sunbursts(n = 5, x_means = c(0, 1, 15), y_means = c(0, 2, 16), xy_var = 10, low = "#4e0550", high = "#facdfc", s = 1234)
sunbursts(n = 250, x_means = c(1, 2, 9, 50), y_means = c(3, 6, 8, -3), xy_var = 100, low = "white", high = "black", s = 1234)
```
{{< /detail-tag >}}

{{< three-images
"https://raw.githubusercontent.com/nrennie/nrennie.rbind.io/main/content/portfolio/rtistry/Images/sunsets1.png"
"https://raw.githubusercontent.com/nrennie/nrennie.rbind.io/main/content/portfolio/rtistry/Images/sunsets2.png"
"https://raw.githubusercontent.com/nrennie/nrennie.rbind.io/main/content/portfolio/rtistry/Images/sunsets3.png" >}}

{{< detail-tag "Code" >}}
```r
sunsets(num_bars = 8, n = 1000, col_palette = PrettyCols::prettycols("Lively"), bg_col = "#413C58", vertical = FALSE, fade_vertical = FALSE, alpha = 1, s = 2023)
sunsets(num_bars = 3, n = 1000, col_palette = PrettyCols::prettycols("Lucent"), bg_col = "black", vertical = TRUE, fade_vertical = TRUE, alpha = 1, s = 1234)
sunsets(num_bars = 10, n = 1000, col_palette = grey.colors(10), bg_col = "grey90", vertical = FALSE, fade_vertical = TRUE, alpha = 1, s = 2023)
```
{{< /detail-tag >}}

{{< three-images
"https://raw.githubusercontent.com/nrennie/nrennie.rbind.io/main/content/portfolio/rtistry/Images/tiles_veronese1.jpeg"
"https://raw.githubusercontent.com/nrennie/nrennie.rbind.io/main/content/portfolio/rtistry/Images/tiles_veronese2.jpeg"
"https://raw.githubusercontent.com/nrennie/nrennie.rbind.io/main/content/portfolio/rtistry/Images/tiles_pissaro1.jpeg" >}}

{{< detail-tag "Code" >}}
```r
tiles(n_x = 12, n_y = 12, col_palette = MetBrewer::met.brewer("Veronese", 5), s = 1234)
tiles(n_x = 50, n_y = 50, col_palette = MetBrewer::met.brewer("Veronese", 6), s = 1234)
tiles(n_x = 12, n_y = 12, col_palette = MetBrewer::met.brewer("Pissaro", 5), s = 1234)
```
{{< /detail-tag >}}

{{< three-images
"https://raw.githubusercontent.com/nrennie/nrennie.rbind.io/main/content/portfolio/rtistry/Images/vortex_n25_m.jpeg"
"https://raw.githubusercontent.com/nrennie/nrennie.rbind.io/main/content/portfolio/rtistry/Images/vortex_n100_m.jpeg"
"https://raw.githubusercontent.com/nrennie/nrennie.rbind.io/main/content/portfolio/rtistry/Images/vortex_n25_r.jpeg" >}}

{{< detail-tag "Code" >}}
```r
vortex(n = 25, start_val = 90, col_scheme = "mono", bg_col = "black", s = 1234)
vortex(n = 100, start_val = 90, col_scheme = "mono", bg_col = "black", s = 1234)
vortex(n = 25, start_val = 90, col_scheme = "rainbow", bg_col = "black", s = 1234)
```
{{< /detail-tag >}}

{{< three-images
"https://raw.githubusercontent.com/nrennie/nrennie.rbind.io/main/content/portfolio/rtistry/Images/waves23_6_bw.jpeg"
"https://raw.githubusercontent.com/nrennie/nrennie.rbind.io/main/content/portfolio/rtistry/Images/waves23_6_col.jpeg"
"https://raw.githubusercontent.com/nrennie/nrennie.rbind.io/main/content/portfolio/rtistry/Images/waves6_23_bw.jpeg" >}}

{{< detail-tag "Code" >}}
```r
waves(a = 23, b = 6, linewidth  =  0.5, main_col = "white", bg_col = "black", s = 2021)
waves(a = 23, b = 6, linewidth  =  0.5, main_col = rcartocolor::carto_pal(n  =  7, "Prism"), bg_col = "#edad08", s = 2021)
waves(a = 6, b = 23, linewidth  =  0.5, main_col = "black", bg_col = "white", s = 2021)
```
{{< /detail-tag >}}

{{< three-images
"https://raw.githubusercontent.com/nrennie/nrennie.rbind.io/main/content/portfolio/rtistry/Images/window_boxes1.png"
"https://raw.githubusercontent.com/nrennie/nrennie.rbind.io/main/content/portfolio/rtistry/Images/window_boxes2.png"
"https://raw.githubusercontent.com/nrennie/nrennie.rbind.io/main/content/portfolio/rtistry/Images/window_boxes3.png" >}}

{{< detail-tag "Code" >}}
```r
window_boxes(n_x = 10, n_y = 10, col_palette = PrettyCols::prettycols("Beach", n = 5), linewidth = 2) 
window_boxes(n_x = 12, n_y = 12, col_palette = gray.colors(20), linewidth = 2) 
window_boxes(n_x = 5, n_y = 5, col_palette = PrettyCols::prettycols("TangerineBlues"), linewidth = 1) 
```
{{< /detail-tag >}}