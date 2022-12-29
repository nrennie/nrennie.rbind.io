---
author: Nicola Rennie
categories:
  - R
date: "2022-12-27"
draft: false
excerpt: "After another 52 data visualisations created for #TidyTuesday, it's time for the annual round-up! Read this blog post for some interesting R packages discovered, a few new I've tricks learnt, and the data visualisations I'd like to do again."
layout: blog-single
slug: "2022-12-27-another-year-of-tidytuesday"
subtitle: "After another 52 data visualisations created for #TidyTuesday, it's time for the annual round-up! Read this blog post for some interesting R packages discovered, a few new I've tricks learnt, and the data visualisations I'd like to do again."
tags:
- r, data visualisation, tidytuesday, ggplot
title: "Another Year of #TidyTuesday"
image: featured.png
---

Last year, I wrote a [blog post](https://nrennie.rbind.io/blog/2021-12-29-a-year-of-tidytuesday/) discussing of how I found participating in #TidyTuesday every week for a year. Well, this year I did the same again. And so I'm writing another blog post about it! If you're unfamiliar with #TidyTuesday, it's a weekly data challenge aimed at the R community. Every week a new data set is posted alongside a chart or article related to that data set, and ask participants explore the data. You can access the data and find out more on [GitHub](https://github.com/rfordatascience/tidytuesday/blob/master/README.md). 

So what have I learnt this year, that I didn't know last year?

**Recording the progress of making visualisations with {camcorder}**: the [{camcorder}](https://github.com/thebioengineer/camcorder) R package records all of the plots you make on the way to making your final visualisation and turns them into a gif. It's useful to showcase the process of how you make plots using {ggplot2}, and interesting to see how other people approach the making of plots!

<p align="center">
<img src="https://raw.githubusercontent.com/nrennie/nrennie.rbind.io/main/content/blog/2022-12-27-another-year-of-tidytuesday/camcorder.gif" width = "80%">
</p>

**Dealing with different resolutions when saving images**: if you want to save high resolution images using `ggsave()` this can sometimes lead to saved plots that look quite different compared to the preview in RStudio IDE. You can use {camcorder}, R Markdown, or Quarto to preview how your images look under higher resolutions - I also write a [blog post](https://nrennie.rbind.io/blog/2022-08-16-designing-tidytuesday-visualisations-for-mobile-with-quarto/) about this!

**How R compares with Tableau for visualising data**: to get a better idea of how Tableau compares with R for data visualisation, I started recreating some of my #TidyTuesday contributions using Tableau. Sometimes it was quicker to create visualisations in Tableau - the click-and-drag features make it easier to position elements exactly where you want them. However, the data wrangling capabilities of R make it a better option in my opinion! You can see my #TableauTuesday contributions on my [Tableau Public](https://public.tableau.com/app/profile/nicola.rennie/viz/TableauTuesday/TableauTuesday_1) profile.

**A number of new R packages I hadn't used before**:

  * [{geomtextpath}](https://github.com/AllanCameron/geomtextpath): to create text which lies on curved paths
  * [{ggchicklet}](https://github.com/hrbrmstr/ggchicklet): for creating bar charts with rounded edges
  * [{ggimage}](https://github.com/GuangchuangYu/ggimage): for using images in {ggplot2} graphics
  * [{showtext}](https://github.com/yixuan/showtext): technically I did use this twice in 2021, but it's become my go-to package for working with fonts!
  * [{ggtext}](https://github.com/wilkelab/ggtext): allows you to use HTML or Markdown syntax for {ggplot2} text
  * [{ggforce}](https://ggforce.data-imaginist.com/): provides additional geom and stat functions for use with {ggplot2}
  * [{poissoned}](https://coolbutuseless.github.io/2019/06/25/poissoned-a-package-for-poisson-disc-sampling/): implements the poisson disk sampling algorithm, which I used to create this plot...

<p align="center">
  <img src="https://raw.githubusercontent.com/nrennie/tidytuesday/main/2022/2022-01-11/20220111.jpg" width="60%">
</p>
  
And now it's time for a recap of the year, where I show my:

* first visualisation of 2022,
* last visualisation of 2022,
* favourite visualisation of 2022,
* *one I'd like to re-do* visualisation of 2022!

### My first visualisation of 2022

The first week of #TidyTuesday in 2022 was a "bring your own data" week! For this plot I tried out the aforementioned {geomtextpath} package to write some text in a spiral. The data behind this plot was the introduction to my recently completed PhD thesis. I quite liked this plot - the minimalist style was a theme I definitely leaned into this year!

<p align="center">
  <img src="https://github.com/nrennie/tidytuesday/blob/main/2022/2022-01-04/20220104.jpg?raw=true" width="60%">
</p>

### My last visualisation of 2022

The last #TidyTuesday visualisation of 2022 (from today) looked at the titles in Star Trek: The Next Generation (Starfleet Academy) book series. I decided to keep this one visually simple, but there are two new things I tried in this visualisayion:

* [{eyedroppeR}](https://github.com/doehm/eyedroppeR): a colour palette generating package from [Dan Oehm](https://gradientdescending.com/) that allows you to select colours from images. I'd previously used [imagecolorpicker.com](https://imagecolorpicker.com/en) for this purpose, but it's great to bring this part of the design process inside R as well.

* Justified text: support for justified (aligned to right and left margins) text in {ggplot2} isn't built-in. Instead, you need to manually calculate varying text sizes - very much helped by [this visualisation](https://github.com/gkaramanis/tidytuesday/tree/master/2021/2021-week8) from [Georgios Karamanis](https://karaman.is/)!

<p align="center">
  <img src="https://raw.githubusercontent.com/nrennie/tidytuesday/main/2022/2022-12-27/20221227.png" width="60%">
</p>

### My favourite visualisation of 2022

Okay, so maybe this is cheating since it's technically three visualisation... For this data set on psychometric scores of TV characters, I made radar plots showing the personality traits of different Killing Eve characters. I'm not generally a huge fan of radar plots, but for this week I was mostly focused on the design elements - which I think turned out really well! I focused on designing these plots to be viewed on mobile (since many of us spend too much time scrolling on our phones...) and tried to create *character cards* for three of the characters.

<p align="center">
  <img src="https://github.com/nrennie/tidytuesday/blob/main/2022/2022-08-16/20220816_files/figure-html/villanelle-1.png?raw=true" width="20%">
  <img src="https://github.com/nrennie/tidytuesday/blob/main/2022/2022-08-16/20220816_files/figure-html/eve-1.png?raw=true" width="20%">
  <img src="https://github.com/nrennie/tidytuesday/blob/main/2022/2022-08-16/20220816_files/figure-html/carolyn-1.png?raw=true" width="20%">
</p>

### My *one I'd like to re-do* visualisation of 2022

For this data set on Kaggle's Hidden Gems, I looked at the sentiment analysis of notebook titles. The plot shows there's no real change over time - which isn't a very exciting finding. Part of the reason, I don't like this plot so much is that it was created as an interactive HTML widget, which naturally doesn't look so good as a static screenshot. I also don't think the styling feels very neat, so I'd like to have another go at this one...

<p align="center">
  <img src="https://github.com/nrennie/tidytuesday/blob/main/2022/2022-04-26/20220426.png?raw=true" width="60%">
</p>

So that's exactly what I did! In this re-worked version if the visualisation, I made two main changes:

* analysed the sentiments of the reviews, rather than the title,
* visualised the minimum and maximum sentiment of each volume, rather than the average. 

<p align="center">
<img src="https://raw.githubusercontent.com/nrennie/nrennie.rbind.io/main/content/blog/2022-12-27-another-year-of-tidytuesday/tidytuesday.png" width = "60%">
</p>

You can download the code to create the re-worked version from my [website](tidytuesday.R).

### Getting started with #TidyTuesday

If you've read this far, and you're thinking about joining in with #TidyTuesday and haven't already - I'd highly recommend it! Some useful resources for getting started:

* The [{ggplot2} book](https://ggplot2-book.org/getting-started.html) is freely available online and provides a useful reference for how different functions work.

* The [Graphic Design with ggplot2: How to Create Engaging and Complex Visualizations in R](https://github.com/rstudio-conf-2022/ggplot2-graphic-design) workshop materials from rstudio::conf(2022) by Cédric Scherer are available on GitHub.

Searching for #TidyTuesday on Twitter, LinkedIn, or Mastodon should also give some inspiration for what can be created in R!

### Final thoughts

The code for all of my #TidyTuesday contributions is on [GitHub](https://github.com/nrennie/tidytuesday), and you can view a curated selection of my favourite contributions on my [portfolio page](https://nrennie.rbind.io/portfolio/tidytuesday/).

Huge thanks to R4DS team for putting #TidyTuesday together every week, and thanks to everyone who contributed data. I might add some data of my own next year...
