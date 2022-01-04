---
title: "Waves"
subtitle: ""
excerpt: "The `waves()` series, inspired by repeating patterns, is constructed from sine and cosine waves."
date: 2022-01-01
weight: 3
author: "Nicola Rennie"
draft: false
categories:
  - Rtistry
layout: single
links:
- icon: github
  icon_pack: fab
  name: code
  url: https://github.com/nrennie/aRt/blob/main/R/waves.R
---


#### Overview

The `waves()` series, inspired by repeating patterns, is constructed from sine and cosine waves.


#### Installation

This generative artwork can be reproduced using my {aRt} package on [GitHub](https://github.com/nrennie/aRt), which you can install in R using: 

```{r}
remotes::install_github("nrennie/aRt")
library(aRt)
waves()
```

#### Packages required 

* {ggplot2}
* {rcartocolor}


#### Parameters

* `a` is a sine wave parameter.
* `b` is a cosine wave parameter.
* `main_col` sets the main colour of the artwork. There are two ways to specify the colours: (i) if a single colour is given, all lines will be the same colour. If a palette from the {rcartocolor} package is given the colours will change with the radius of the pattern.
* `bg_col` sets the background colour of the artwork.
* `s` sets the random seed used to generate the values. 


#### Examples

<p align="center">
<img src="featured.jpeg?raw=true" width="33%">
<img src="waves1.jpeg?raw=true" width="33%">
<img src="waves2.jpeg?raw=true" width="33%">
</p>

```r
waves(a=23, b=6, main_col="white", bg_col="black", s=2021)
waves(a=23, b=6, main_col="Prism", bg_col="#edad08", s=2021)
waves(a=6, b=23, main_col="black", bg_col="white", s=2021)
```






