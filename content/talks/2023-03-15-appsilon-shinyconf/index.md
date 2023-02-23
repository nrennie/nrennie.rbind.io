---
title: "Finding #RStats resources with Shiny and GitHub Actions"
slug: "appsilon-shinyconf-github-actions"
subtitle: "In this talk I’ll show you how to collect data from Twitter using {rtweet}, schedule that data collection with GitHub Actions, and automatically deploy a Shiny app to display the data in a table."
excerpt: "In this talk I’ll show you how to collect data from Twitter using {rtweet}, schedule that data collection with GitHub Actions, and automatically deploy a Shiny app to display the data in a table."
PublishDate: 2023-02-08T00:00:00-06:00
date: 2023-03-15T00:00:00-08:00
date_end: "2023-03-17T00:00:00-08:00"
show_post_time: false
event: "Appsilon ShinyConf 2023"
event_url: https://shinyconf.appsilon.com/
author: "Nicola Rennie"
location: "Online"
draft: false
# layout options: single, single-sidebar
layout: single
categories:
- Conference
links:
- icon: github
  icon_pack: fab
  name: GitHub
  url: https://github.com/nrennie/shinytweet
image: featured.jpg
---

One of the best parts of the R community is our love of sharing the things we learn, and many of us use social media to do just that! But in a world where social media can seem endless and somewhat unreliable, it felt like I needed a way to do two things: (i) bookmark links to interesting #RStats content that people share, and (ii) store that information somewhere that would remain accessible if my social media platform of choice ceased to exist.

So I did what any R user would - I built a Shiny app! Thanks to GitHub Actions, that Shiny app updates daily and displays the updated data in an interactive table. And it does it all while I'm asleep. 

In this talk I’ll discuss:

- Collecting data from Twitter using {rtweet}
- Scheduling tasks with GitHub Actions to update data
- Triggering app re-deployment with GitHub Actions

### Links

* Shiny app: [nrennie35.shinyapps.io/shinytweet](https://nrennie35.shinyapps.io/shinytweet/)

* GitHub repository: [github.com/nrennie/shinytweet](https://github.com/nrennie/shinytweet)

* Blog post: [nrennie.rbind.io/blog/2022-10-05-automatically-deploying-a-shiny-app-for-browsing-rstats-tweets-with-github-actions](https://nrennie.rbind.io/blog/2022-10-05-automatically-deploying-a-shiny-app-for-browsing-rstats-tweets-with-github-actions/)

Slides will be added soon!
