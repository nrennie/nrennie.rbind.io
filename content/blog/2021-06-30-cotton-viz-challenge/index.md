---
author: Nicola Rennie
categories:
  - Data Visualisation
date: "2021-06-30"
draft: false
excerpt: "In June, the #CottonViz data visualisation challenge was run by the History of Statistics & Young Statisticians sections of the Royal Statistical Society (RSS)."
layout: single
subtitle: "In June, the #CottonViz data visualisation challenge was run by the History of Statistics & Young Statisticians sections of the Royal Statistical Society (RSS)."
tags:
- r, data visualisation
title: "#CottonViz Data Visualisation Challenge"
image: featured.jpg
---

In June, the #CottonViz data visualisation challenge was run by the History of Statistics & Young Statisticians sections of the Royal Statistical Society (RSS). The challenge aimed to celebrate the work of Mary Eleanor Spear (1897 –1986), credited with popularising the *range-bar* charts.

<blockquote class="twitter-tweet" align="center"><p lang="en" dir="ltr">Reimagining Mary Eleanor Spear&#39;s visualisation of US cotton supply for the <a href="https://twitter.com/hashtag/CotttonViz?src=hash&amp;ref_src=twsrc%5Etfw">#CotttonViz</a> competition with <a href="https://twitter.com/HistoryofStats?ref_src=twsrc%5Etfw">@HistoryofStats</a> and <a href="https://twitter.com/statsyss?ref_src=twsrc%5Etfw">@statsyss</a>. First time using the {ggpattern} package (great for colourblind-friendly visualisations).<a href="https://twitter.com/hashtag/DataVisualization?src=hash&amp;ref_src=twsrc%5Etfw">#DataVisualization</a> <a href="https://twitter.com/hashtag/DataViz?src=hash&amp;ref_src=twsrc%5Etfw">#DataViz</a> <a href="https://twitter.com/hashtag/RStats?src=hash&amp;ref_src=twsrc%5Etfw">#RStats</a> <a href="https://t.co/R84pa9G8L5">pic.twitter.com/R84pa9G8L5</a></p>&mdash; Nicola Rennie (@nrennie35) <a href="https://twitter.com/nrennie35/status/1405542205184299013?ref_src=twsrc%5Etfw">June 17, 2021</a></blockquote> <script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>

The challenge invited particpants to either recreate Spears' original visualisation of US cotton supply (shown below), or design a new visualisation of the same data. 

<p align="center">
<img src="spears-charts400.png?raw=true" width="49%">
</p>

The details of the challenge can be found on the [RSS website](https://rss.org.uk/news-publication/news-publications/2021/section-group-reports/mary-eleanor-spear-dataviz-competition-for-childre/). Prizes were available for:

* Most accurate recreation 
* Most creative
* Most innovative

I started by recreating the original viz using {ggplot2}. One of the things I really like about the original visualisation is the black and white nature of it. Instead, patterns are used to tell apart the bars, leading me to discover the {ggpattern} package in R.

<p align="center">
<img src="viz2.jpg?raw=true" width="80%">
</p>

I also made three other attempts at re-visualising the US cotton supply data. For my first visualisation I stayed similar to the original design and created a 2 x 1 plot, one an area plot and the other a line chart. 

<p align="center">
<img src="viz4.jpg?raw=true" width="80%">
</p>

The other two attempts were both waffle plots. The first was a simple faceted waffle plot showing the number of bales of cotton per year and where it was distributed. 

<p align="center">
<img src="viz3.jpg?raw=true" width="80%">
</p>

Although I liked the design of the first waffle plot, it wasn't overly creative and didn't reflect the *cotton* theme. So I decided to hand-draw some cotton bales (using Inkscape) and use these instead of tiles in my waffle plots. This plot won me an honourable mention from the judges. 

<p align="center">
<img src="viz.jpg?raw=true" width="80%">
</p>

Congratulations to all winners, and thanks to the History of Statistics & Young Statisticians sections of the RSS for organising this event. The RSS news article can be found [here](https://rss.org.uk/news-publication/news-publications/2021/general-news/cottonviz-data-visualisation-challenge-winners-ann/).
