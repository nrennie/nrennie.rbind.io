---
title: "Rtistry"
subtitle: ""
excerpt: "Generative art is the practice of creating artwork using code. When the programming language of choice is R, it's often termed *Rtistry* or *aRt*."
date: 2022-01-01
weight: 2
author: "Nicola Rennie"
draft: false
categories:
  - Rtistry
layout: single
links:
- icon: github
  icon_pack: fab
  name: code
  url: https://github.com/nrennie/aRt
---

### Overview

Generative art is the practice of creating artwork using code. When the programming language of choice is R, it's often termed *Rtistry* or *aRt*. The generative artwork below can be reproduced using my {aRt} package on [GitHub](https://github.com/nrennie/aRt), which you can install in R using: 

```r
remotes::install_github("nrennie/aRt")
library(aRt)
```
You can also view my generative artwork on [Instagram](https://www.instagram.com/nrennie_art/). 

### Examples

#### Attraction

``` r
attraction(n=50000, a=-3, b=1, c=0.5, d=-1, main_col="black", bg_col="white")
attraction(n=50000, a=-6, b=1, c=0.5, d=-2, main_col="black", bg_col="white")
attraction(n=50000, a=-3, b=-2, c=1, d=-1, main_col="SunsetDark", bg_col="white")
```
<p align="center">
<img src="attraction1.jpeg?raw=true" width="30%">
<img src="attraction2.jpeg?raw=true" width="30%">
<img src="attraction3.jpeg?raw=true" width="30%">
</p>

#### Blending

``` r
blending(n = 100, down = "white", up = "black", s = 1234)
blending(n = 500, down = "white", up = "black", s = 1234)
blending(n = 100, down = "#ba1141", up = "#003366", s = 1234)
```
<p align="center">
<img src="blending1.jpeg?raw=true" width="30%">
<img src="blending2.jpeg?raw=true" width="30%">
<img src="blending3.jpeg?raw=true" width="30%">
</p>

#### Boxes 

``` r
boxes(n=100, perc=0.1, col_palette="DarkMint", bg_col="black", s=1234)
boxes(n=20, perc=0.1, col_palette="DarkMint", bg_col="black", s=1234)
boxes(n=100, perc=0.5, col_palette="Magenta", bg_col="black", s=1234)
```
<p align="center">
<img src="boxes_n100_p1.jpeg?raw=true" width="30%">
<img src="boxes_n20_p1.jpeg?raw=true" width="30%">
<img src="boxes_n100_p5.jpeg?raw=true" width="30%">
</p>

#### Bricks

``` r
bricks(n_y=20, colours=c("#9B1D20", "#3D2B3D", "#CBEFB6", "#635D5C"), bg_col="gray97")
bricks(n_y=200, colours=c("#9B1D20", "#3D2B3D", "#CBEFB6", "#635D5C"), bg_col="gray97")
bricks(n_y=20, colours=carto_pal(7, "Burg"), bg_col="gray97")

```
<p align="center">
<img src="bricks1.jpeg?raw=true" width="30%">
<img src="bricks2.jpeg?raw=true" width="30%">
<img src="bricks3.jpeg?raw=true" width="30%">
</p>


#### Bubbles

``` r
bubbles(num_circles = 20, main_col = "black", col_palette = "Bold", bg_col = "white", s = 1234)
bubbles(num_circles = 20, main_col = "lightgrey", col_palette = "Bold", bg_col = "white", s = 123)
bubbles(num_circles = 10, main_col = "white", col_palette = "Prism", bg_col = "black", s = 2022)
```
<p align="center">
<img src="bubbles1.jpeg?raw=true" width="30%">
<img src="bubbles2.jpeg?raw=true" width="30%">
<img src="bubbles3.jpeg?raw=true" width="30%">
</p>


#### Bullseye

``` r
bullseye(main_col="black", bg_col="white", s=1234)
bullseye(main_col="white", bg_col="black", s=1234)
bullseye(main_col="black", bg_col="white", s=2021)
```
<p align="center">
<img src="bullseye_1234.jpeg?raw=true" width="30%">
<img src="bullseye_1234n.jpeg?raw=true" width="30%">
<img src="bullseye_2021.jpeg?raw=true" width="30%">
</p>


#### Circles

``` r
circles(n=100, smoothness=100, col_palette="Bold", line_col=NA, bg_col="black", s=1234)
circles(n=10, smoothness=100, col_palette="Bold", line_col=NA, bg_col="#e73f74", s=1234)
circles(n=2, smoothness=3, col_palette="Bold", line_col="black", bg_col="black", s=1234)
```
<p align="center">
<img src="circles1.jpeg?raw=true" width="30%">
<img src="circles2.jpeg?raw=true" width="30%">
<img src="circles3.jpeg?raw=true" width="30%">
</p>

#### Circular

``` r
circular(n=2, main_col="black", bg_col="white", s=56)
circular(n=10, main_col="black", bg_col="white", s=56)
circular(n=100, main_col="black", bg_col="white", s=56)
```
<p align="center">
<img src="circular_n2.jpeg?raw=true" width="30%">
<img src="circular_n10.jpeg?raw=true" width="30%">
<img src="circular_n100.jpeg?raw=true" width="30%">
</p>

#### Connected

``` r
connected(n=100, n_geom=10, random=F, col_palette="RdPu", bg_col="#ae217e", s=1234)
connected(n=100, n_geom=10, random=T, col_palette="RdPu", bg_col="#ae217e", s=1234)
connected(n=250, n_geom=2, random=F, col_palette="RdPu", bg_col="#ae217e", s=1234)
```
<p align="center">
<img src="connected_100_10F.jpeg?raw=true" width="30%">
<img src="connected_100_10T.jpeg?raw=true" width="30%">
<img src="connected_250_2F.jpeg?raw=true" width="30%">
</p>

#### Crawling

``` r
crawling(n=50, edge_colour="black", node_size=1, node_colour="black", bg_col="white", s=1234)
crawling(n=250, edge_colour="black", node_size=1, node_colour="black", bg_col="white", s=1234)
crawling(n=1000, edge_colour="black", node_size=1, node_colour="black", bg_col="white", s=1234)
```
<p align="center">
<img src="crawling50.jpeg?raw=true" width="30%">
<img src="crawling250.jpeg?raw=true" width="30%">
<img src="crawling1000.jpeg?raw=true" width="30%">
</p>

#### Dots

``` r
dots(n_x=50, n_y=100, jitter_size_width=0.5, jitter_size_height=0.5, col_palette = "Purp", bg_col="#63589f", s=1234)
dots(n_x=500, n_y=100, jitter_size_width=0.5, jitter_size_height=5, col_palette = "Purp", bg_col="#63589f", s=1234)
dots(n_x=50, n_y=100, jitter_size_width=0.05, jitter_size_height=50, col_palette = "Purp", bg_col="#63589f", s=1234)
```
<p align="center">
<img src="dots1.jpeg?raw=true" width="30%">
<img src="dots2.jpeg?raw=true" width="30%">
<img src="dots3.jpeg?raw=true" width="30%">
</p>

#### Fading

``` r
fading(n_layers=6, n_points=10, col_palette="SunsetDark", s=1234)
fading(n_layers=6, n_points=1, col_palette="Sunset", s=1234)
fading(n_layers=10, n_points=10, col_palette="SunsetDark", s=1234)
```
<p align="center">
<img src="fading_6_10.jpeg?raw=true" width="30%">
<img src="fading_6_1.jpeg?raw=true" width="30%">
<img src="fading_10_10.jpeg?raw=true" width="30%">
</p>

#### Flow fields

``` r
flow_fields(n = 10000, granualarity = 1000, x_freq = 1, y_freq = 1, alpha = 1, line_col = c("#edf8fb","#bfd3e6","#9ebcda","#8c96c6","#8c6bb1","#88419d","#6e016b"), bg_col = "lightgrey", s = 1234)
flow_fields(n = 10000, granualarity = 1000, x_freq = 1, y_freq = 1, alpha = 0.3, line_col = "black", bg_col = "white", s = 1234)
flow_fields(n = 10000, granualarity = 1000, x_freq = 3, y_freq = 0.2, alpha = 1, line_col = c("#edf8fb","#bfd3e6","#9ebcda","#8c96c6","#8c6bb1","#88419d","#6e016b"), bg_col = "lightgrey", s = 1234)
```
<p align="center">
<img src="flow_fields1.jpeg?raw=true" width="30%">
<img src="flow_fields2.jpeg?raw=true" width="30%">
<img src="flow_fields3.jpeg?raw=true" width="30%">
</p>

#### Heart

``` r
heart(n=25, col_scheme="mono", bg_col="black", s=1234)
heart(n=100, col_scheme="mono", bg_col="black", s=1234)
heart(n=25, col_scheme="rainbow", bg_col="black", s=1234)
```
<p align="center">
<img src="heart_n25_m.jpeg?raw=true" width="30%">
<img src="heart_n100_m.jpeg?raw=true" width="30%">
<img src="heart_n25_r.jpeg?raw=true" width="30%">
</p>

#### Infinity

``` r
infinity(n=25, col_scheme="mono", bg_col="black", s=1234)
infinity(n=100, col_scheme="mono", bg_col="black", s=1234)
infinity(n=25, col_scheme="rainbow", bg_col="black", s=1234)
```
<p align="center">
<img src="infinity_n25_m.jpeg?raw=true" width="30%">
<img src="infinity_n100_m.jpeg?raw=true" width="30%">
<img src="infinity_n25_r.jpeg?raw=true" width="30%">
</p>

#### Polygons

``` r
polygons(n_x=12, n_y=18, gap_size=0.5, deg_jitter=0.1, colours=c("#9B1D20", "#3D2B3D", "#CBEFB6", "#635D5C"), rand = FALSE, bg_col="gray97")
polygons(n_x=6, n_y=9, gap_size=0.2, deg_jitter=0.1, colours=c("#9B1D20", "#3D2B3D", "#CBEFB6", "#635D5C"), rand = FALSE, bg_col="gray97")
polygons(n_x=12, n_y=18, gap_size=0.5, deg_jitter=0.5, colours=carto_pal(7, "Burg"), rand = FALSE, bg_col="gray97")

```
<p align="center">
<img src="polygons1.jpeg?raw=true" width="30%">
<img src="polygons2.jpeg?raw=true" width="30%">
<img src="polygons3.jpeg?raw=true" width="30%">
</p>

#### Rectangles

``` r
rectangles(n = 100, max_height = 7, max_width = 5, size = 2, main_col = "lightgrey", col_palette = "Bold", bg_col = "white", s = 123)
rectangles(n = 10, max_height = 15, max_width = 15, size = 4, main_col = "lightgrey", col_palette = "Bold", bg_col = "white", s = 123)
rectangles(n = 100, max_height = 4, max_width = 6, size = 1, main_col = ggplot2::alpha("white", 0.5), col_palette = "Prism", bg_col = "black", s = 123)

```
<p align="center">
<img src="rectangles1.jpeg?raw=true" width="30%">
<img src="rectangles2.jpeg?raw=true" width="30%">
<img src="rectangles3.jpeg?raw=true" width="30%">
</p>


#### Shell

``` r
shells(n = 4, alpha = 1, main_col = "black", bg_col = "white")
shells(n = 10, alpha = 1, main_col = "black", bg_col = "white")
shells(n = 6, alpha = 0.5, main_col = "#CC338B", bg_col = alpha("#CC338B", 0.2))
```
<p align="center">
<img src="shell1.jpeg?raw=true" width="30%">
<img src="shell2.jpeg?raw=true" width="30%">
<img src="shell3.jpeg?raw=true" width="30%">
</p>


#### Spirals

``` r
spirals(perc=0.2, s=1234)
spirals(perc=0.5, s=1234)
spirals(perc=0.8, s=1234)
```
<p align="center">
<img src="spirals_p2.jpeg?raw=true" width="30%">
<img src="spirals_p5.jpeg?raw=true" width="30%">
<img src="spirals_p8.jpeg?raw=true" width="30%">
</p>

#### Static

``` r
static(perc=0.01, n=500, s=1234)
static(perc=0.1, n=500, s=1234)
static(perc=0.3, n=500, s=1234)
```
<p align="center">
<img src="static_p01_n500.jpeg?raw=true" width="30%">
<img src="static_p10_n500.jpeg?raw=true" width="30%">
<img src="static_p30_n500.jpeg?raw=true" width="30%">
</p>


#### Stripes

``` r
stripes(perc=0, n=3, col_palette = "TealGrn", alpha = 1, s=1234)
stripes(perc=0.5, n=3, col_palette = "TealGrn", alpha = 1, s=1234)
stripes(perc=1, n=3, col_palette = "TealGrn", alpha = 1, s=1234)
```
<p align="center">
<img src="stripes_p00_n3.jpeg?raw=true" width="30%">
<img src="stripes_p50_n3.jpeg?raw=true" width="30%">
<img src="stripes_p100_n3.jpeg?raw=true" width="30%">
</p>

#### Tiles

``` r
tiles(n_x=12, n_y=12, col_palette="Veronese", num_colours=5, s=1234)
tiles(n_x=50, n_y=50, col_palette="Veronese", num_colours=6, s=1234)
tiles(n_x=12, n_y=12, col_palette="Pissaro", num_colours=5, s=1234)
```
<p align="center">
<img src="tiles_veronese1.jpeg?raw=true" width="30%">
<img src="tiles_veronese2.jpeg?raw=true" width="30%">
<img src="tiles_pissaro1.jpeg?raw=true" width="30%">
</p>


#### Vortex

``` r
vortex(n=25, start_val=90, col_scheme="mono", bg_col="black", s=1234)
vortex(n=100, start_val=90, col_scheme="mono", bg_col="black", s=1234)
vortex(n=25, start_val=90, col_scheme="rainbow", bg_col="black", s=1234)
```
<p align="center">
<img src="vortex_n25_m.jpeg?raw=true" width="30%">
<img src="vortex_n100_m.jpeg?raw=true" width="30%">
<img src="vortex_n25_r.jpeg?raw=true" width="30%">
</p>


#### Waves

``` r
waves(a=23, b=6, main_col="white", bg_col="black", s=2021)
waves(a=23, b=6, main_col="Prism", bg_col="#edad08", s=2021)
waves(a=6, b=23, main_col="black", bg_col="white", s=2021)
```
<p align="center">
<img src="waves23_6_bw.jpeg?raw=true" width="30%">
<img src="waves23_6_col.jpeg?raw=true" width="30%">
<img src="waves6_23_bw.jpeg?raw=true" width="30%">
</p>

