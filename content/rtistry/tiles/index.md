---
title: "Tiles"
subtitle: ""
excerpt: "The `tiles()` series is loosely inspired by mosaic tiling techniques."
date: 2022-01-01
weight: 1
author: "Nicola Rennie"
draft: false
categories:
  - Rtistry
layout: single
links:
- icon: github
  icon_pack: fab
  name: code
  url: https://github.com/nrennie/aRt/blob/main/R/tiles.R
---

#### Overview

The `tiles()` series is loosely inspired by mosaic tiling techniques. Each generative artwork consists of a grid of *tiles*, where each tile is made up of three squares - one large, one medium, and one small. The colouring algorithm ensures that the three squares on each tile are of different colours. 

The colour palettes for this series comes from the {MetBrewer} package written by Blake Robert Mills ([\@BlakeRobMills](https://twitter.com/BlakeRobMills).)

#### Installation

This generative artwork can be reproduced using my {aRt} package on [GitHub](https://github.com/nrennie/aRt), which you can install in R using: 

```r
remotes::install_github("nrennie/aRt")
library(aRt)
tiles()
```

#### Packages required 

* {ggplot2}
* {MetBrewer}

#### Parameters

* `n_x` specifies the number of columns in the grid.
* `n_y` specifies the number of rows in the grid.
* `col_palette` sets the colour palette. Must be one of the options from the {MetBrewer} package.
* `num_colours` specifies the number of colours to be used, cannot be more than the number of colours available in the colour palette.
* `s` sets the random seed used to colour the tiles. 


#### Examples

<p align="center">
<img src="featured.jpeg?raw=true" width="33%">
<img src="tiles1.jpeg?raw=true" width="33%">
<img src="tiles2.jpeg?raw=true" width="33%">
</p>

```r
tiles(n_x=12, n_y=12, col_palette="Veronese", num_colours=5, s=1234)
tiles(n_x=50, n_y=50, col_palette="Veronese", num_colours=6, s=1234)
tiles(n_x=12, n_y=12, col_palette="Pissaro", num_colours=5, s=1234)
```




