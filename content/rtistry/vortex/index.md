---
title: "Vortex"
subtitle: ""
excerpt: "The `vortex()` series is inspired by patterns observed in fluid dynamics."
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
  url: https://github.com/nrennie/aRt/blob/main/R/vortex.R
---


#### Overview

Available in two colour schemes, the `vortex()` series is inspired by patterns observed in fluid dynamics. This artwork is generated using line graphs and polar coordinates. There are two custom colour palettes available for this artwork - either a monochrome, or rainbow effect.

#### Installation

This generative artwork can be reproduced using my {aRt} package on [GitHub](https://github.com/nrennie/aRt), which you can install in R using: 

```r
remotes::install_github("nrennie/aRt")
library(aRt)
vortex()
```

#### Packages required 

* {ggplot2}

#### Parameters

* `n` specifies how many lines are drawn i.e. how dense the pattern is.
* `start_val` sets the angle where the lines are drawn from i.e. sets where the *gap* in the lines is located.
* `col_scheme` sets the main colour scheme of the artwork. There are two options: either `"rainbow"` or `"mono"`.
* `bg_col` sets the background colour of the artwork.
* `s` sets the random seed used to generate the values. 


#### Examples

<p align="center">
<img src="featured.jpeg?raw=true" width="33%">
<img src="vortex1.jpeg?raw=true" width="33%">
<img src="vortex2.jpeg?raw=true" width="33%">
</p>

```r
vortex(n=25, start_val=90, col_scheme="mono", bg_col="black", s=1234)
vortex(n=100, start_val=90, col_scheme="mono", bg_col="black", s=1234)
vortex(n=25, start_val=90, col_scheme="rainbow", bg_col="black", s=1234)
```






