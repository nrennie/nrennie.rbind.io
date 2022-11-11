---
author: Nicola Rennie
categories:
  - R
date: "2021-12-29"
draft: false
excerpt: "One of my goals for 2021 was to participate in the #TidyTuesday challenge on a regular basis. This blog post reflects on the past year of data visualisations."
layout: single
subtitle: "One of my goals for 2021 was to participate in the #TidyTuesday challenge on a regular basis. This blog post reflects on the past year of data visualisations."
tags:
- r, data visualisation, tidytuesday, ggplot
title: "A Year of #TidyTuesday"
image: featured.jpg
---

One of my goals for 2021 was to participate in the [#TidyTuesday challenge](https://github.com/rfordatascience/tidytuesday/) on a regular basis. This blog post reflects on the past year of data visualisations.

For those of you who don't know, #TidyTuesday is a weekly data challenge aimed at the R community. Every week a new dataset is posted alongside a chart or article related to that dataset, and ask participants explore the data. You can access the data and find out more [here](https://github.com/rfordatascience/tidytuesday/blob/master/README.md). 

This tweet from @[kustav_sen](https://twitter.com/kustav_sen) shows everyone who has participated in TidyTuesday at least 10 times this year.

<blockquote class="twitter-tweet" align="center"><p lang="en" dir="ltr">Another year of <a href="https://twitter.com/hashtag/TidyTuesday?src=hash&amp;ref_src=twsrc%5Etfw">#TidyTuesday</a> now complete! 🎉Here is a collage of all the participants with more than 10 posts over 2021. Big thanks to <a href="https://twitter.com/thomas_mock?ref_src=twsrc%5Etfw">@thomas_mock</a> for leading the initiative🙌<br><br>Interactive version: <a href="https://t.co/g6MqsVVPrJ">https://t.co/g6MqsVVPrJ</a><a href="https://twitter.com/hashtag/RStats?src=hash&amp;ref_src=twsrc%5Etfw">#RStats</a> <a href="https://twitter.com/hashtag/d3js?src=hash&amp;ref_src=twsrc%5Etfw">#d3js</a> <a href="https://twitter.com/hashtag/dataviz?src=hash&amp;ref_src=twsrc%5Etfw">#dataviz</a> <br><br>1/3 <a href="https://t.co/yb2Iz2HZn7">pic.twitter.com/yb2Iz2HZn7</a></p>&mdash; Kaustav Sen (@kustav_sen) <a href="https://twitter.com/kustav_sen/status/1475502029195808771?ref_src=twsrc%5Etfw">December 27, 2021</a></blockquote> <script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>

The first thing I want to reflect on is what I was trying to achieve by taking part in TidyTuesday.

* I got better at processing data. The data sets for TidyTuesday are usually relatively clean, so this was more about getting comfortable with {tidyverse} packages like {dplyr} and {tidyr} to get data into the format I needed it to be. 
* I got faster at doing basic things in {ggplot2}. I don't need to look up syntax to change plot elements quite as much. Although Google still likes to remind me how often I've looked up multi-column legends...
* I tried out a lot of different (sometimes new, sometime old) packages in R, and discovered a lot of new ways of plotting data. Sometimes it worked, sometimes it didn't. 
* I found lots of cool people on Twitter who also think playing with data in their spare time is fun. 

I saw this tweet from @[aabattani](https://twitter.com/aabattani) reflecting on a year of Tableau vizzes, and I wanted to do the same for my #TidyTuesday contributions. 

<blockquote class="twitter-tweet" align="center"><p lang="en" dir="ltr">In the spirit of <a href="https://twitter.com/josh_tapley?ref_src=twsrc%5Etfw">@josh_tapley</a>&#39;s year in review, I wanted to do a little more reflecting on my <a href="https://twitter.com/tableaupublic?ref_src=twsrc%5Etfw">@tableaupublic</a> vizzes. So here is: <br><br>- my first viz of this year<br>- my most recent viz of the year<br>- my favorite viz I posted this year<br>- and one I&#39;d like to re-do<br><br>what are yours? <a href="https://t.co/MUuWNlimRF">pic.twitter.com/MUuWNlimRF</a></p>&mdash; autumn🍂 (@aabattani) <a href="https://twitter.com/aabattani/status/1475453410195300357?ref_src=twsrc%5Etfw">December 27, 2021</a></blockquote> <script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>

#### First visualisation

My first contribution to #TidyTuesday back in January 2021 visualised the cost of different infrastructure projects. I still quite like this plot, although there are a few things I'd do differently. I'd probably colour and sort these by continent because the order of countries doesn't make much sense. Different colours for pre- and post- 2021 expenditure may also be more helpful than a dashed line. I would also add a more detailed subtitle or summary to explain what's going on. 

In terms of R code, I reordered the variables manually by start date using `factor(df$country_name[order(df$start_year)],levels=df$country_name[order(df$start_year)])` and there are definitely better ways of doing this e.g. with `fct_reorder()`. 

Overall, I think this was a pretty good first attempt.

<blockquote class="twitter-tweet" align="center"><p lang="en" dir="ltr">My PhD project analyses data obtained from railway networks and so does this week&#39;s <a href="https://twitter.com/hashtag/TidyTuesday?src=hash&amp;ref_src=twsrc%5Etfw">#TidyTuesday</a>!<br><br>Code on GitHub: <a href="https://t.co/XCjc1qsQIj">https://t.co/XCjc1qsQIj</a> <a href="https://t.co/T6LsNKGKbZ">pic.twitter.com/T6LsNKGKbZ</a></p>&mdash; Nicola Rennie (@nrennie35) <a href="https://twitter.com/nrennie35/status/1346942495008018442?ref_src=twsrc%5Etfw">January 6, 2021</a></blockquote> <script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>

#### Most recent visualisation

I had the idea for this one in my head when I saw the data set, so it was more about trying to create the idea I had rather than playing around with different ideas. 

The shades of green aren't quite different enough for the legend to be useful. Instead, I'd add the values as text underneath each icon, and add an arrow on the right hadn side to indicate increasing caffeine levels. 

I really like the clean, minimalist design of this one. 

<blockquote class="twitter-tweet" align="center"><p lang="en" dir="ltr">Looking at how much caffeine there is in different <a href="https://twitter.com/hashtag/Starbucks?src=hash&amp;ref_src=twsrc%5Etfw">#Starbucks</a> drinks for <a href="https://twitter.com/hashtag/TidyTuesday?src=hash&amp;ref_src=twsrc%5Etfw">#TidyTuesday</a> this week! <br><br>Thanks <a href="https://twitter.com/StarTrek_Lt?ref_src=twsrc%5Etfw">@StarTrek_Lt</a> for the data!<br><br>Code: <a href="https://t.co/f6VyY6vaSC">https://t.co/f6VyY6vaSC</a> <a href="https://twitter.com/hashtag/DataVisualization?src=hash&amp;ref_src=twsrc%5Etfw">#DataVisualization</a> <a href="https://twitter.com/hashtag/DataViz?src=hash&amp;ref_src=twsrc%5Etfw">#DataViz</a> <a href="https://twitter.com/hashtag/DataScience?src=hash&amp;ref_src=twsrc%5Etfw">#DataScience</a> <a href="https://twitter.com/hashtag/RStats?src=hash&amp;ref_src=twsrc%5Etfw">#RStats</a> <a href="https://t.co/3kRCY7aN6v">pic.twitter.com/3kRCY7aN6v</a></p>&mdash; Nicola Rennie (@nrennie35) <a href="https://twitter.com/nrennie35/status/1473361707477184512?ref_src=twsrc%5Etfw">December 21, 2021</a></blockquote> <script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>


#### Favourite visualisation

My favourite data for #TidyTuesday in 2021 came from the Duke Lemur Center. One of the nice features was the personal data on each lemur, so you could track individual lemurs and their offspring over time. This was the point of the year, where I started to experiment with the graphic design side of visualisation more using package like {cowplot} and {patchwork} to combine plots and overlay images (like this one of an adorable lemur). 

I also ended up following the Duke Lemur Center on twitter after this so my twitter feed regularly features lemur photos which is no bad thing.

<blockquote class="twitter-tweet" align="center"><p lang="en" dir="ltr">Looking at collared brown lemurs at <a href="https://twitter.com/DukeLemurCenter?ref_src=twsrc%5Etfw">@DukeLemurCenter</a> for <a href="https://twitter.com/hashtag/TidyTuesday?src=hash&amp;ref_src=twsrc%5Etfw">#TidyTuesday</a> this week. The oldest lemur, Yvette, born in 1959, lived to 32.6 years. <br><br>Code: <a href="https://t.co/IEBznAlkGk">https://t.co/IEBznAlkGk</a><a href="https://twitter.com/hashtag/DataVisualization?src=hash&amp;ref_src=twsrc%5Etfw">#DataVisualization</a> <a href="https://twitter.com/hashtag/DataViz?src=hash&amp;ref_src=twsrc%5Etfw">#DataViz</a> <a href="https://twitter.com/hashtag/DataScience?src=hash&amp;ref_src=twsrc%5Etfw">#DataScience</a> <a href="https://twitter.com/hashtag/RStats?src=hash&amp;ref_src=twsrc%5Etfw">#RStats</a> <a href="https://t.co/Pv5NxqOuKF">pic.twitter.com/Pv5NxqOuKF</a></p>&mdash; Nicola Rennie (@nrennie35) <a href="https://twitter.com/nrennie35/status/1430184781849972748?ref_src=twsrc%5Etfw">August 24, 2021</a></blockquote> <script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>

#### Visualisation I'd like to redo

I remember having a bit of an idea for this plot, but not quite knowing how to create it, I ended up using the {ggbump} package to create the sigmoids. Several weeks later, I discovered that this was actually called a Sankey chart and that there was a {ggplot2} compatible R package for creating them called {ggalluvial}. I've used it several times since, and I think it would definitely improve the execution of this idea. 

<blockquote class="twitter-tweet" align="center"><p lang="en" dir="ltr">A topical one for this week&#39;s <a href="https://twitter.com/hashtag/TidyTuesday?src=hash&amp;ref_src=twsrc%5Etfw">#TidyTuesday</a> (as I currently bake in 32°C heat), looking at the change in the percentage of California&#39;s population affected by droughts in the last 20 years. <br><br>Code: <a href="https://t.co/d8o9unYSB8">https://t.co/d8o9unYSB8</a><a href="https://twitter.com/hashtag/DataVisualization?src=hash&amp;ref_src=twsrc%5Etfw">#DataVisualization</a> <a href="https://twitter.com/hashtag/DataViz?src=hash&amp;ref_src=twsrc%5Etfw">#DataViz</a> <a href="https://twitter.com/hashtag/DataScience?src=hash&amp;ref_src=twsrc%5Etfw">#DataScience</a> <a href="https://twitter.com/hashtag/RStats?src=hash&amp;ref_src=twsrc%5Etfw">#RStats</a> <a href="https://t.co/abpTgOyQ8p">pic.twitter.com/abpTgOyQ8p</a></p>&mdash; Nicola Rennie (@nrennie35) <a href="https://twitter.com/nrennie35/status/1417532402860281862?ref_src=twsrc%5Etfw">July 20, 2021</a></blockquote> <script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>

### Final thoughts

Overall, #TidyTuesday has been one of the best and most fun work-related things I decided to do on 2021. During my PhD, although I had a lot of data, it all looked quite similar so there wasn't a lot of opportunity to experiment with different plots. #TidyTuesday is a nice environment to experiment with different plots and packages because you don't have to get it right. For me at least, it's about trying something new rather than making publication-ready plots. I'm definitely looking forward to participating in #TidyTuesday in 2022, and beyond. 

Huge thanks to @[thomas_mock](https://twitter.com/thomas_mock) for putting #TidyTuesday together every week, and thanks to everyone who contributed data. I might add some data of my own next year.