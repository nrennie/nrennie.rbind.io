---
author: Nicola Rennie
categories:
  - R
date: "2023-03-23"
slug: "web-scraping-rvest-london-marathon"
draft: false
excerpt: "{rvest} is an R package within the {tidyverse} which helps you scrape data from web pages. This blog post will showcase an example of scraping data from Wikipedia on London Marathon races and winners."
layout: blog-single
subtitle: "{rvest} is an R package within the {tidyverse} which helps you scrape data from web pages. This blog post will showcase an example of scraping data from Wikipedia on London Marathon races and winners."
tags:
- r, data visualisation, rvest
title: "Scraping London Marathon data with {rvest}"
image: featured.png
---

There are lots of ways to get data into R: reading from local files or URLs, R packages containing data, using packages that wrap APIs, to name a few. But sometimes, none of those are an option. Let's say you want get a table of data from a website (that doesn't provide API access). You *could* copy and paste it into a spreadsheet, re-format it manually, and then read it into R. But (to me, at least) that sounds horribly tedious...

That's where {rvest} comes in. {rvest} is an R package within the {tidyverse} which helps you scrape data from web pages. This blog post will showcase an example of scraping data from Wikipedia on London Marathon races and winners. By the end, you should be ready to scrape some data of your own!

<p align="center">
<img src="https://raw.githubusercontent.com/nrennie/nrennie.rbind.io/main/content/blog/2023-03-23-scraping-london-marathon-data-with-rvest/kermit.gif" width = "60%" alt="Gif of kermit the frog typing quickly on a typewriter"><br>
<small>Image: <a href="https://giphy.com/gifs/muppets-LmBsnpDCuturMhtLfw">giphy.com</a></small>
</p>

> A note on web-scraping: many websites have a `robots.txt` file which contains instructions for bots that tell them which webpages they can and cannot access. The relies on voluntary compliance, so please check a websites `robots.txt` file before you jump straight to web-scraping. If you're scraping multiple pages, you can use the [{polite}](https://dmi3kno.github.io/polite/) package to make sure you respect the `robots.txt` file.

### Loading the R packages

For the process of scraping the London Marathon data from Wikipedia, we need five R packages: {rvest} for web-scraping, {dplyr} for manipulating the scraped data, {lubridate} and {chron} for working with the time data (optional depending on your use case), and {readr} to save the data for re-use later.

```r
library(rvest)
library(dplyr)
library(lubridate)
library(chron)
library(readr)
```
### Scraping the data

Now let's actually get the data! The key function in {rvest} is `read_html()` which does what it says on the tin and reads in the HTML code used on the site you pass in as the first argument:

```r
london <- read_html("https://en.wikipedia.org/wiki/List_of_winners_of_the_London_Marathon")
```
The initial output doesn't look particularly nice:

```r
{html_document}
<html class="client-nojs vector-feature-language-in-header-enabled vector-feature-language-in-main-page-header-disabled vector-feature-language-alert-in-sidebar-enabled vector-feature-sticky-header-disabled vector-feature-page-tools-disabled vector-feature-page-tools-pinned-disabled vector-feature-main-menu-pinned-disabled vector-feature-limited-width-enabled vector-feature-limited-width-content-enabled" lang="en" dir="ltr">
[1] <head>\n<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">\n<meta charset="UTF-8"> ...
[2] <body class="skin-vector skin-vector-search-vue vector-toc-pinned mediawiki ltr sitedir-ltr mw-hide ...
```
Fortunately, {rvest} has some nice functions to parse this output for you, and get the elements of the site that you're actually interested in.

```r
london <- london %>% 
  html_elements(".wikitable.sortable") %>% 
  html_table()
```
Here, I've passed in `".wikitable.sortable"` to `html_elements()`. Here, `html_elements()` grabs all the elements which have `".wikitable.sortable"` as their CSS class. I determined that `".wikitable.sortable"` was the class I was looking for by using `Inspect` on the Wikipedia page (use the Ctrl + Shift + I shortcut). The `html_table()` then tidies this up even further, and returns a list of tibbles where each list entry is a different table from the Wikipedia page.

### Tidying it up

The first four tibbles contain information on the four categories of racing at London Marathon, and the fifth contains a summary table by country. Since the fifth table data can be captured from the first four, and it's in a completely different format, I decided to discard it. Now what I want to do is combine the remaining four tibbles into a single tibble, with an additional column determining which race the data relates to. 

First things first, let's decide what the names of the categories are. I *could* have grabbed this information from the Wikipedia itself, as each table has a section header. However, the title's weren't quite what I was looking for and I would have had to recode them anyway, so I decided to just directly *recode* the list of tibbles. The categories can then be set as the names of the list items.

```r
london <- london[1:4] 
categories <- c("Men", "Women", "Wheelchair Men", "Wheelchair Women")
names(london) <- categories
```
Fortunately for me, the column names in the four remaining tables already all have the same names. This meant I could take advantage of `bind_rows()` from {dplyr} to collapse the list into a single tibble. Setting `.id = "Category"` creates a new column in the tibble called `Category` which contains the list name as a variable. I also dropped the `Notes` free text column.

```r
london <- bind_rows(london, .id = "Category") %>% 
  select(-Notes)
```

The last bit of processing to do is deal with the time data. I decided to rename the column to `Time`, and convert it to a formal time object using the `chron()` function from {chron}. The `Year` column was slightly trickier than it appeared at first glance - some of the entries had a footnote marker next to the year - so `as.numeric()` doesn't work out of the box, it needed a little regex first!

```r
winners <- london %>% 
  rename(Time = `Time(h:m:s)`) %>% 
  mutate(Time = chron(times = Time)) %>% 
  mutate(Year = gsub("\\[|*.\\]", "", Year), 
         Year = as.numeric(Year)) %>% 
```
Finally, we can save the data, either as a CSV or an RDS file to make it easier to work with it later, and to avoid repeatedly scraping the same data.

```r
write_csv(winners, file = "winners.csv")
saveRDS(winners, file = "winners.rds")
```

### Repeating the process

I decided to repeat the process for data on number of London Marathon participants, and how much charity money was raised, as this might pose some interesting questions for further analysis. You can see here, that the process is quite similar:

```r
# grab table of data with notes
london_data <- read_html("https://en.wikipedia.org/wiki/London_Marathon")
london_data <- london_data %>% 
  html_elements(".wikitable.sortable") %>% 
  html_table()

# convert columns to correct type
london_marathon <- london_data[[1]] %>% 
  select(-Edition) %>% 
  mutate(Date = dmy(Date)) %>% 
  mutate(Year = year(Date), .after = 1) %>% 
  rename(Raised = `Charity raised(£ millions)`) %>% 
  mutate(Raised = gsub("\\[|*.\\]", "", Raised), 
         Raised = as.numeric(Raised)) %>% 
  mutate(across(c(Applicants, Accepted, Starters, Finishers), parse_number)) %>% 
  mutate(`Official charity` = case_when(`Official charity` == "—" ~ NA_character_,
                                        `Official charity` == "" ~ NA_character_,
                                        TRUE ~ `Official charity`))

# save as csv
write_csv(london_marathon, file = "london_marathon.csv")
saveRDS(london_marathon, file = "london_marathon.rds")
```

### Working with the data

Now, we can work with the scraped data in the same way we'd work with any other (cleaned up) data in R! Including making plots!

<p align="center">
<img src="https://raw.githubusercontent.com/nrennie/london-marathon/main/winners.png" width = "49%" alt="Barchart of London Marathon winners by country">
<img src="https://raw.githubusercontent.com/nrennie/london-marathon/main/london_marathon.png" width = "49%" alt="Dumbbell chart of London marathon starters and finishers">
</p>

Code for the plots can be found on [GitHub](https://github.com/nrennie/london-marathon/blob/main/plots.R).


### Final thoughts

I hope this blog post has convinced you that scraping data from a website does need to be as difficult as it sounds, and that it's a better option that copying and pasting! The code, data, data dictionary, and a few exploratory plots can be found on [GitHub](https://github.com/nrennie/london-marathon).

The background photo in the cover image of this blog post is from [Benjamin Davies](https://unsplash.com/@bendavisual) on [Unsplash](https://unsplash.com/photos/Oja2ty_9ZLM).