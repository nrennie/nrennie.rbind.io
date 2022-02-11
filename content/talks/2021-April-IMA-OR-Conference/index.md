---
title: "Detecting outlier demand in revenue management networks"
subtitle: "3rd IMA and OR Society Conference on Mathematics of Operational Research"
excerpt: "A (virtual) talk I gave at the 3rd IMA and OR Society Conference on Mathematics of Operational Research."
date: 2021-04-20T13:00:00-06:00
date_end: "2021-04-23T14:00:00-06:00"
show_post_time: false
event: "3rd IMA and OR Society Conference on Mathematics of Operational Research"
event_url: https://ima.org.uk/14347/14347/
author: "Nicola Rennie"
location: "Online"
draft: false
# layout options: single, single-sidebar
layout: single
categories:
- Conference
links:
- icon: download
  icon_pack: fas
  name: Slides
  url: /talks/2021-april-ima-or-conference/slides.pdf
image: featured.png
---

Transport service providers, such as airlines or railways, often use revenue management systems to control ticket prices and availability. Such systems rely on accurately forecasting expected demand to prepare optimal capacity allocations. Extraordinary events generate outlier demand, and cause inaccurate forecasts resulting in non-optimal allocations. Most revenue management systems allow room for analysts to compare the accumulated bookings against the forecasts and to intervene, if they deem the demand forecast to be inaccurate. However, research on judgemental forecasting has clearly demonstrated the existence of fallibility and bias in such practices. This motivates the need for automated alerts to highlight outlier demand, and thereby support analysts. 

The problem of detecting outlier demand is further complicated by the consideration of network effects. Passengers often book tickets that require multiple resources across a network. For example, a train ticket may be booked for a journey that passes through multiple stations. In the railway industry, there are a large number of possible itineraries and most customers book journeys for multiple legs. In this case, outlier demand is unlikely to affect only a single leg. 

We present a method for aggregating outlier detection across multiple legs in a railway network, which leverages functional analysis and extreme value theory. In a set of controlled simulation scenarios, we let demand systematically deviate from the general level, and evaluate the method’s ability to detect outlier demand.. We show that by aggregating; we are able to both increase detection rates, and reduce false positive rates, in comparison to considering each leg in isolation. We demonstrate the practical implications of detecting outliers across networks by applying the procedure to empirical booking data obtained from Deutsche Bahn.

Keywords: Revenue management; Simulation; Decision support; Outlier detection; Functional analysis; Network analysis
