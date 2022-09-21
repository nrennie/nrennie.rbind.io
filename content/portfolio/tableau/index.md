---
title: "Tableau"
subtitle: ""
excerpt: "Tableau is an interactive data visualization tool, used to make plots, dashboards, and presentations of data."
date: 2022-05-01
weight: 8
author: "Nicola Rennie"
draft: false
categories:
  - Data visualisation
layout: single
image: featured.png
links:
- icon: globe
  icon_pack: fa
  name: Tableau Public
  url: https://public.tableau.com/app/profile/nicola.rennie/
---

## Tableau

[Tableau](https://www.tableau.com/en-gb) is an interactive data visualization tool, used to make plots, dashboards, and presentations of data. Although I primarily use R to create plots and dashbaords for visualising data, I've recently started to explore less-programmatic ways of visualiing data. 

My portfolio of data visualisation is still under construction, and the following represents some preliminary examples of plots and dashboards I have built using Tableau. My Tableau data visualisations and dashboards can be found on my [Tableau Public profile](https://public.tableau.com/app/profile/nicola.rennie/).

### #TableauTuesday

In order to improve my Tableau skills, I've started visualising [#TidyTuesday](https://github.com/rfordatascience/tidytuesday) data sets in Tableau as well as in R (and calling it #TableauTuesday). All of the examples here can be found on my [Tableau Public profile](https://public.tableau.com/app/profile/nicola.rennie/viz/TableauTuesday/).

In this example, I visualised the score differences in Scotland's rugby matches in the Womens' Six Nations Rugby tournament. The chart is a lollipop chart, colour-coded by whether or not the macth was a home or away game. The image on the left shows the version created using Tableau, and the image on the right shows the version created using {ggplot2} in R.

The data can be found on [GitHub](https://github.com/rfordatascience/tidytuesday/blob/master/data/2022/2022-05-24/readme.md).

<p align="center">
<img width = "47%" src="/portfolio/tableau/Rugby.png?raw=true">
<img width = "45%" src="/portfolio/tableau/20220524.png?raw=true">
</p>

<div class='tableauPlaceholder' id='viz1658586207969' style='position: relative'><noscript><a href='#'><img alt='Rugby ' src='https:&#47;&#47;public.tableau.com&#47;static&#47;images&#47;Ta&#47;TableauTuesday&#47;Rugby&#47;1_rss.png' style='border: none' /></a></noscript><object class='tableauViz'  style='display:none;'><param name='host_url' value='https%3A%2F%2Fpublic.tableau.com%2F' /> <param name='embed_code_version' value='3' /> <param name='site_root' value='' /><param name='name' value='TableauTuesday&#47;Rugby' /><param name='tabs' value='no' /><param name='toolbar' value='yes' /><param name='static_image' value='https:&#47;&#47;public.tableau.com&#47;static&#47;images&#47;Ta&#47;TableauTuesday&#47;Rugby&#47;1.png' /> <param name='animate_transition' value='yes' /><param name='display_static_image' value='yes' /><param name='display_spinner' value='yes' /><param name='display_overlay' value='yes' /><param name='display_count' value='yes' /><param name='language' value='en-GB' /></object></div>                <script type='text/javascript'>                    var divElement = document.getElementById('viz1658586207969');                    var vizElement = divElement.getElementsByTagName('object')[0];                    if ( divElement.offsetWidth > 800 ) { vizElement.style.width='100%';vizElement.style.height=(divElement.offsetWidth*0.75)+'px';} else if ( divElement.offsetWidth > 500 ) { vizElement.style.width='100%';vizElement.style.height=(divElement.offsetWidth*0.75)+'px';} else { vizElement.style.width='100%';vizElement.style.height='977px';}                     var scriptElement = document.createElement('script');                    scriptElement.src = 'https://public.tableau.com/javascripts/api/viz_v1.js';                    vizElement.parentNode.insertBefore(scriptElement, vizElement);                </script>

<details>
    <summary><b>See more examples</b></summary>
    
<p align="center">
<img width = "80%" src="/portfolio/tableau/Frogs.png?raw=true">
</p>

<p align="center">
<img width = "80%" src="/portfolio/tableau/CHIP Dataset.png?raw=true">
</p>

<p align="center">
<img width = "80%" src="/portfolio/tableau/Wastewater Plants.png?raw=true">
</p>

<p align="center">
<img width = "80%" src="/portfolio/tableau/firsts.png?raw=true">
</p>

<p align="center">
<img width = "80%" src="/portfolio/tableau/Flights.png?raw=true">
</p>

<p align="center">
<img width = "80%" src="/portfolio/tableau/Pay Gap.png?raw=true">
</p>

<p align="center">
<img width = "80%" src="/portfolio/tableau/Pride.png?raw=true">
</p>

<p align="center">
<img width = "80%" src="/portfolio/tableau/Companies.png?raw=true">
</p>

<p align="center">
<img width = "80%" src="/portfolio/tableau/Rugby.png?raw=true">
</p>

<p align="center">
<img width = "80%" src="/portfolio/tableau/Droughts.png?raw=true">
</p>

<p align="center">
<img width = "80%" src="/portfolio/tableau/Rent.png?raw=true">
</p>

<p align="center">
<img width = "80%" src="/portfolio/tableau/eurovision.png?raw=true">
</p>

</details>

### European Flights

I revisited some data from one of the [#TidyTuesday](https://github.com/rfordatascience/tidytuesday/tree/master/data/2022/2022-07-12) challenges on European flights data from [Eurocontrol](https://ansperformance.eu/data/). I constructed a dashboard to display information of flights leaving or arriving from six European countries, where users can filter by a date range and a set of countries they are interested in. The dashboard is available on [Tableau Public](https://public.tableau.com/app/profile/nicola.rennie/viz/EuropeanFlights_16611157667530/EuropeanFlightsTableau_1).

<p align="center">
<img width = "80%" src="/portfolio/tableau/flights_dashboard.png?raw=true">
</p>

I also recreated the same dashboard using {shiny} in R, and embedded it as a new tab in the Tableau dashboard for a side-by-side comparison of R and Tableau. 

### #30ChartMapChallenge 2022

For the 2022 [#30DayChartChallenge](https://30daychartchallenge.org/), I used Tableau to create a voronoi treemap of sunflower seed production by country. I also created the same map using R, which can be found [here](https://github.com/nrennie/30DayChartChallenge/tree/main/2022#day-4-flora-in-tableau-left-and-r-right). I then expanded this into a larger dashboard, incorporating further data sources and additional plots.

<p align="center">
<img width = "80%" src="/portfolio/tableau/Sunflowers.png?raw=true">
</p>

### #30DayMapChallenge 2021

As part of the 2021 [#30DayMapChallenge](https://30daymapchallenge.com/), I visualised the population in different electoral wards in Glasgow. The rest of my contributions for the challenge can be found [here](https://github.com/nrennie/30DayMapChallenge).

<p align="center">
<img width = "80%" src="/portfolio/tableau/glasgow.png?raw=true">
</p>





