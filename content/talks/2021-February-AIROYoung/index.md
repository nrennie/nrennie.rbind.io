---
title: "Detecting outlier demand in railway networks"
subtitle: "5th AIRO Young Workshop"
excerpt: "A (virtual) talk I gave at the 5th AIRO Young Workshop at Università degli Studi di Napoli Federico II, Italy."
date: 2021-02-08T10:00:00-06:00
date_end: "2021-02-12T11:00:00-06:00"
show_post_time: false
event: "5th AIRO Young Workshop"
event_url: http://opslab.dieti.unina.it/index.php/en/home-eng-2/ayws
author: "Nicola Rennie"
location: "Università degli Studi di Napoli Federico II, Italy (online)"
draft: false
# layout options: single, single-sidebar
layout: single
categories:
- Workshop
links:
- icon: download
  icon_pack: fas
  name: Slides
  url: /talks/2021-february-airoyoung/slides.pdf
image: featured.png
---

Transport service providers, such as airlines and railways, often use revenue manage-ment to control offers and demand in mobility networks. Such systems rely on accu-rate demand forecasts as input for the underlying optimisation models. When changes in the market place cause demand to deviate from the expected values, revenue man-agement controls no longer fit for the resulting outliers. Analysts can intervene if they deem the demand forecast to be inaccurate. However, existing research on judgemen-tal forecasting highlights fallibility and bias when human decision makers are not sys-tematically supported in such tasks. This motivates the need for automated alerts to highlight outliers and thereby support analysts. 

Network effects complicate the problem of detecting outlier demand in practice. Pas-sengers often book travel itineraries that stretch across multiple legs of a network. Thereby, they requests products that require multiple resources -- seats on several legs. In the rail and long-distance coach industries, the large number of possible itiner-aries makes it likely for outlier demand to affect multiple legs. At the same time, outli-er demand from a single itinerary may be difficult to recognise as it mixes with regular demand on individual legs. To support outlier detection in transport networks, we pre-sent a method to aggregates outlier detection across highly correlated legs. We propose to use the results of this analysis to construct a ranked alert list that can support ana-lyst decision making. We show that by aggregating we are able to improve detection performance compared to considering each leg in isolation. 

Keywords: Revenue management, Networks, Outlier detection
