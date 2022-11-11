---
author: Nicola Rennie
categories:
  - Research
date: "2022-02-04"
draft: false
excerpt: "Last year I was a finalist in the 2021 Statistical Excellence Award for Early-Career Writing. This blog post introduces my article published in Significance and gives some tips for statistical writing."
layout: single
subtitle: "Last year I was a finalist in the 2021 Statistical Excellence Award for Early-Career Writing. This blog post introduces my article published in Significance and gives some tips for statistical writing."
tags:
- research
title: "A Story of Statistical Writing and Life Expectancy"
image: featured.jpg
---

The Statistical Excellence Award for Early-Career Writing is an annual competition run by [Significance](https://www.significancemagazine.com/) and the [RSS Young Statisticians Section](https://twitter.com/statsyss). Entrants are asked to use data and statistics to tell the stories that matter most to them. 

<blockquote class="twitter-tweet" align="center"><p lang="en" dir="ltr">Today we (<a href="https://twitter.com/signmagazine?ref_src=twsrc%5Etfw">@signmagazine</a> and <a href="https://twitter.com/statsyss?ref_src=twsrc%5Etfw">@statsyss</a>) are pleased to announce the finalists of the 2021 Statistical Excellence Award for Early-Career Writing, with stories about luck, life expectancy, and a weather-predicting tortoise <a href="https://t.co/NbwatlYiGM">https://t.co/NbwatlYiGM</a> <a href="https://t.co/VlAsmaR6uq">pic.twitter.com/VlAsmaR6uq</a></p>&mdash; Significance (@signmagazine) <a href="https://twitter.com/signmagazine/status/1413090737537830913?ref_src=twsrc%5Etfw">July 8, 2021</a></blockquote> <script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>

Congratulations to all competition entrants, especially winner [Connor Jackson](https://www.significancemagazine.com/10-news/704-writing-comp-winner?highlight=WyJuaWNvbGEiLCJyZW5uaWUiLCJuaWNvbGEgcmVubmllIl0=), and fellow finalist Anna Beukenhorst.

### Writing about statistics for the masses

The way that we write about statistics should vary depending on who will be reading our work. It seems like an obvious statement but it's something that, as a PhD student, I never really had to think about. Most of the statistical writing I did was for journal papers, conferences, or my thesis. Generally, a pretty small audience with similar backgrounds in statistics.

Gaining some practice at explaining statistical concepts has also helped me as I transitioned into working in industry as a Data Scientist at [Jumping Rivers](https://www.jumpingrivers.com/). 


### We're not getting any younger! Or should that be older?

The title of the article I submitted was *We're not getting any younger! Or should that be older?*. I wrote about trend in life expectancies, both in the UK and in the rest of the world. I started by motivating the analysis I'd done, by talking about recent rises in pension ages in the UK - something that personally affects many readers. At the same time as pension ages in the UK continue to rise, both academics and journalists claim that life expectancy is stalling. To investigate these claims, I looked at changes in UK life expectancy growth from 1960 to present day. Using data from World Bank Open Data, I used a rolling window linear model to estimate how life expectancy has changed decade-by-decade. I found that though there has been a steep decline in life expectancy growth in the last ten years, the growth is still positive and life expectancy continues to increase.

However, just as life expectancies are not equal for men and women, neither are the changes in life expectancy growth. Whilst life expectancy has stalled for women in the UK, men continue to get older - albeit more slowly than they used to. The gap between the life expectancies for men and women is closing and I estimated that, given current trends continue, both men and women will have an equal life expectancy of 85.2 years by 2100.

I then extended my analyses beyond the UK to look at the bigger picture, and examine how trends in life expectancy in the last decade differ between the most and least developed countries in the world. Countries where life expectancy has stalled are identified, and I discussed the commonalities found in such countries in terms of level of development and current life expectancy age.

The article is available [online](https://www.significancemagazine.com/science/723-we-re-not-getting-any-younger-or-should-that-be-older). 

### Statistical modelling Shiny app

With a limit of 2,000 words, I couldn't delve deep into the life expectancies of every country, and sub-population, in the world. Even without a word limit, it probably wouldn't have made a very coherent story to tell. Instead, I made an [interactive shiny dashboard](https://nrennie35.shinyapps.io/life_expectancy_shiny_app/) for *super keen* readers to explore the data on their own. 

### Tips for aspiring writers

* **Choose a relevant, but not overdone topic**: There's already a wealth of statistical information out there on topics like Covid-19 or Brexit. Although certainly interesting, it might be difficult to find a unique take on the topic. Conversely, if the topic is extremely obscure, it might limit your audience slightly. 
* **Visualise your data**: I believe that, at heart, we all read magazine articles or papers like a five-year old - we look at the pictures first. Adding in some clear, illustrative data visualisations or explanatory diagrams makes for a more engaging read than a long stream of text.
* **Stick to simple language**: If you find yourself writing a *specialist* term and then using the next sentence to explain what the phrase means, ask yourself if you can write it without using the term at all. Rather than giving the reader a new word and definition to remember, just get straight to the point.
* **What's the point?**: There should be a reason that your article exists and it should be clear to a reader what they gain by reading your article. What question does it address? I structured my article by posing an overall question in the introduction (well, actually in the title...) and then each subsection as a smaller part of that larger question.

### 2022 Competition

The 2022 Statistical Excellence Award for Early-Career Writing competition is open now. Details can be found on the Significance [website](https://www.significancemagazine.com/10-news/640-enter-our-2020-writing-competition-for-early-career-statisticians-and-data-scientists).

If you're a:

* student currently studying for a first degree, master’s or PhD in statistics, data science or related subject; or
* graduate whose last qualification in statistics, data science or related subject (whether first degree, master’s or PhD) was not more than five years ago, 

I'd highly recommend submitting an entry!
