---
author: Nicola Rennie
categories:
  - R
  - Python
  - Shiny
slug: "seeing-double-shiny-python-r"
date: "2023-01-20"
draft: false
excerpt: "Back in July 2022 at rstudio::conf(2022), Posit (formerly RStudio) announced the release of Shiny for Python. I wanted to see how the two compared - so I built the same Shiny app twice! This blog post highlights a few of the differences, and things that were a little tricky switching to Shiny for Python."
layout: blog-single
subtitle: "Back in July 2022 at rstudio::conf(2022), Posit (formerly RStudio) announced the release of Shiny for Python. I wanted to see how the two compared - so I built the same Shiny app twice! This blog post highlights a few of the differences, and things that were a little tricky switching to Shiny for Python."
title: "Seeing double? Building the same app in Shiny for R and Shiny for Python"
image: featured.png
---

[Shiny](https://shiny.rstudio.com/) is an R package that makes it easier to build interactive web apps straight from R. Back in July 2022 at rstudio::conf(2022), Posit (formerly RStudio) announced the release of [Shiny for Python](https://shiny.rstudio.com/py/). As someone who knows Python but hasn't written any Python code for quite a long time, I wanted to see how the two compared. So I did the only logical thing and built a Shiny app - twice!

After building (almost) identical Shiny apps, with one built solely in R and the other solely in Python, I've written this blog post to take you through some of the things that are the same, and a few things that are slightly different.

Note: at the time of writing Shiny for Python is still in alpha, so if you're reading this blog quite a while after it was first published, some things may have changed.

Before we start, let's load the packages we need for our Shiny apps:

{{< panelset class="packages" >}}
{{< panel name="R" >}}
```r
library(dplyr)
library(shiny)
library(ggplot2)
```
{{< /panel >}}
{{< panel name="Python" >}}
```python
import plotnine as gg
import pandas as pd
from pyodide.http import open_url
from shiny import *
from mizani.breaks import date_breaks
from mizani.formatters import date_format
```
{{< /panel >}}
{{< /panelset >}}

I'll explain where we need each of these packages as we go through.

### Data

The data used in the apps relates to European flights and comes from [Eurocontrol](https://ansperformance.eu/data/), via the [#TidyTuesday](https://github.com/rfordatascience/tidytuesday) repository. Note that I've used a subset of the data, and done a little pre-processing - mainly to stop this blog becoming a {dplyr} versus pandas blog! We can read the data in using {readr} in R, and pandas in Python.

{{< panelset class="loaddata" >}}
{{< panel name="R" >}}
```r
flights <- readr::read_csv("flights_data.csv")
```
{{< /panel >}}
{{< panel name="Python" >}}
```python
flights = pd.read_csv('flights_data.csv')
```
{{< /panel >}}
{{< /panelset >}}

Note that although `pd.read_csv('flights_data.csv')` works fine when running the app locally, we may need to edit this slightly depending on how we're going to deploy our Python app - more on that later...

### Building the UI

Just like R, in Python, Shiny apps have a UI and a server. The UI (user interface) defines what a user sees, and the server defines the computations happening in the background. Let's start with developing the UI. I wanted to keep the app looking simple to allow me to compare the R and Python versions, without getting distracted by lots of fancy UI features. So our apps will have a few things:

* a title
* some markdown text explaining what the data is
* some check boxes that a user can interact with
* some markdown text explaining what the check boxes do
* a static plot displaying the data

There are different ways to create UI objects, and different ways to structure the files and functions you create in Shiny. Here, I've created a function that makes the UI, `create_ui()` and then called that function. This is the first comparison of Shiny for R and Shiny for Python code. Here, the Python version makes it a little clearer which functions create UI elements since they all begin with `ui.`. The Python functions are also named using `snake_case` rather than `camelCase` as is common in Shiny for R. Other than these syntax difference, the code is pretty much identical - it made it very easy to pick up the Python code! 

{{< panelset class="ui" >}}
{{< panel name="R" >}}
```r
# Function for UI  ----
create_ui <- function() {
  # create our ui object ----
  app_ui <- fluidPage(
    
    # App title ----
    titlePanel("European Flights"),
    
    # Subtitle ----
    markdown("
           The number of flights arriving or leaving from European airports saw a dramatic decrease with the onset of the Covid-19 pandemic in March 2020. Amsterdam - Schipol remains the busiest airport, averaging 1,150 flights per day since January 2016.
           
           Data: [Eurocontrol](https://ansperformance.eu/data/)
           "),
    
    # Row for plot
    fluidRow(
      # bar chart output ----
      column(10, 
             plotOutput("barplot")
      ),
      # controls ----
      column(2,
             markdown("### **Controls**
               
               Use the selectors below to choose a set of countries to explore.
               "),
             checkboxGroupInput(
               "country", "Country",
               choices = c("Belgium", "France", "Ireland", "Luxembourg", "Netherlands", "United Kingdom"),
               selected = c("Belgium", "France", "Ireland", "Luxembourg", "Netherlands", "United Kingdom")
             )
      )
    )
  )
  return(app_ui)
}

ui_obj <- create_ui()
```
{{< /panel >}}
{{< panel name="Python" >}}
```python
# Function for UI
def create_ui():
  # create our ui object ----
  app_ui = ui.page_fluid(
    
    # App title ----
    ui.panel_title("European Flights"),
    
    # Subtitle ----
    ui.markdown(
        """
        The number of flights arriving or leaving from European airports saw a dramatic decrease with the onset of the Covid-19 pandemic in March 2020. Amsterdam - Schipol remains the busiest airport, averaging 1,150 flights per day since January 2016.
        
        Data: [Eurocontrol](https://ansperformance.eu/data/)
        """
    ),
    ui.row(
        # bar chart output ----
        ui.column(10,
          ui.output_plot("barplot")
        ), 
        # controls ----
        ui.column(2, 
          ui.markdown(
            """
            ### **Controls**
            
            Use the selectors below to choose a set of countries to explore.
    
            """
          ),
          ui.input_checkbox_group(
              "country", "Country",
              choices=["Belgium", "France", "Ireland", "Luxembourg", "Netherlands", "United Kingdom"],
              selected=["Belgium", "France", "Ireland", "Luxembourg", "Netherlands", "United Kingdom"]
          )
        )
    )
  )
  return app_ui

ui_obj = create_ui()
```
{{< /panel >}}
{{< /panelset >}}

### Styling the UI

There are multiple ways to add CSS styling in Shiny apps - you can add it in (some) of the functions using the `style` argument, you can add include some inline code, or you can have a separate CSS file that you reference. Since this is just a small, single file app, I decided to add it inline. In R, you can use `tags$head()` and `tags$style()` to add CSS code to the head of the HTML generated by the Shiny app, and wrap it in `HTML()` to make it clear it's HTML/CSS code rather than R code. In Python, the functions are `ui.tags.head()`, `ui.tags.style()`, and `ui.HTML()` and is otherwise identical.

{{< panelset class="ui" >}}
{{< panel name="R" >}}
```r
tags$head(
  tags$style(
    HTML(
      "@import url('https://fonts.googleapis.com/css2?family=Roboto:wght@100&display=swap'); body { color: #505050; font-family: 'Roboto', sans-serif; padding-left: 20px; padding-right: 20px;} h2 { font-family: 'Roboto', sans-serif; color: #black;}"
    )
    )
)
```
{{< /panel >}}
{{< panel name="Python" >}}

```python
ui.tags.head(
  ui.tags.style(
    ui.HTML(
      "@import url('https://fonts.googleapis.com/css2?family=Roboto:wght@100&display=swap'); body { color: #505050; font-family: 'Roboto', sans-serif; padding-left: 20px; padding-right: 20px; } h2 { font-family: 'Roboto', sans-serif; color: #black; }"
  )
  )
)
```
{{< /panel >}}
{{< /panelset >}}

Let's have a look at the two different apps (I'm only 80% sure I've labelled these the right way round...):

<p align="center">
<img src="https://raw.githubusercontent.com/nrennie/nrennie.rbind.io/main/content/blog/2023-01-20-seeing-double-shiny-python-r/python.png" width = "90%" alt="Screenshot of a shiny app showing a stacked bar chart of flights over time"><br>
<small>Python</small>
</p>

<p align="center">
<img src="https://raw.githubusercontent.com/nrennie/nrennie.rbind.io/main/content/blog/2023-01-20-seeing-double-shiny-python-r/r.png" width = "90%" alt="Screenshot of a shiny app showing a stacked bar chart of flights over time"><br>
<small>R</small>
</p>

There are a couple of very subtle differences:

* the plots look a little different in terms of the text size and positioning, but this is due to differences between plotnine and {ggplot2}, rather than Shiny in R and Python. 
* The buttons and text sizes appear slightly larger in the Python version, when viewed on the same screen. That *might* be due to them being hosted in different places - but it's something I want to dig into a little bit deeper.

Overall, it's quite impressive just how similar these two apps look despite being built in different languages.

### Building the server

Now let's get onto the server code. Well, almost. Before we really get into writing the server code, let's define a function that creates the plot - using {ggplot2} in R, and plotnine in Python:

{{< panelset class="plot" >}}
{{< panel name="R" >}}
```r
create_plot <- function(data) {
  ggplot(data = data, 
         mapping = aes(x = Date, y = Total, fill = Country)) +
    geom_col() +
    labs(x = "", y = "Total number of flights per week", title = "Total number of flights per week") +
    scale_fill_manual(values = c("Belgium" = "#F2C57C", "France" = "#DDAE7E", "Ireland" = "#7FB685", "Luxembourg" = "#426A5A", "Netherlands" = "#EF6F6C", "United Kingdom" = "#AC9FBB")) +
    theme_minimal() +
    theme(panel.grid.major.x = element_blank(),
          panel.grid.minor.x = element_blank())
}
```
{{< /panel >}}
{{< panel name="Python" >}}
```python
def create_plot(data):
  plot = (
    gg.ggplot(data = data, mapping = gg.aes(x = 'Date', y='Total', fill='Country')) +
      gg.geom_col() +
      gg.labs(x = "", y = "Total number of flights per week", title="Total number of flights per week") +
      gg.scale_x_datetime(breaks=date_breaks('1 years'), labels=date_format('%Y')) +
      gg.scale_fill_manual(values = {'Belgium':'#F2C57C', 'France':'#DDAE7E', 'Ireland':'#7FB685', 'Luxembourg':'#426A5A', 'Netherlands':'#EF6F6C', 'United Kingdom':'#AC9FBB'}) +
      gg.theme_minimal() +
      gg.theme(panel_grid_major_x = gg.element_blank(),
               panel_grid_minor_x = gg.element_blank())
  )
  return plot.draw()
```
{{< /panel >}}
{{< /panelset >}}

I won't go into too much detail here, since this blog isn't a comparison of plotnine and {ggplot2}. If you do want to know how the two compare, this [workshop](https://www.youtube.com/watch?v=JUrRYYFDWJc) by Tanya Shapiro for R-Ladies Cologne & Paris is a good place to start. The only key difference between the two, beyond standard differences in syntax was the `date_breaks()` function - to display only the year, rather than every single date along the x-axis. In {ggplot2}, these are built-in, where as in Python they require additional importing:

```python
from mizani.breaks import date_breaks
from mizani.formatters import date_format
```
Okay, now it's actually time for the server code. Because I pre-processed the data a little bit first, the server code isn't too complicated. It takes the input from the check boxes, filters the data, and calls our plot function on the filtered data.

Similar to the UI construction, I've written a function that creates a server object and then called that function. 
{{< panelset class="server" >}}
{{< panel name="R" >}}
```r
# Function to define server
create_server <- function(data) {
  f <- function(input, output, session) {
    
    output$barplot <- renderPlot({
      req(input$country)
      new_data <- filter(data, Country %in% input$country) 
      create_plot(new_data)
    })
    
  }
  return(f)
}

server = create_server(flights)
```
{{< /panel >}}
{{< panel name="Python" >}}
```python
# Function for the server
def create_server(data):
  def f(input, output, session):
  
    @output(id = "barplot")
    @render.plot
    def plot():
      req(input.country())
      country = list(input.country())
      new_data = data[data['Country'].isin(country)]
      plot = create_plot(new_data)
      return plot
  return f

server = create_server(flights)
```
{{< /panel >}}
{{< /panelset >}}

Again, the main difference here is the change in syntax: in R, we can create our output with something like `output$barplot <- renderPlot(...)`, whereas in Python you have:

```python
@output(id = "barplot")
@render.plot
```
The filtering of the data looks a little different, but as with the plot differences, this is due to the differences between {dplyr} and pandas, rather than Shiny. If you want to use base R instead of {dplyr}, it'll look a bit more similar. Then finally, we need to link the UI and the server to make our Shiny app:

{{< panelset class="app" >}}
{{< panel name="R" >}}
```r
shinyApp(ui_obj, server)
```
{{< /panel >}}
{{< panel name="Python" >}}
```python
app = App(ui_obj, server)
```
{{< /panel >}}
{{< /panelset >}}

To run the app locally in R, we can use `runApp()` or click the Run App button in RStudio IDE. In Python, there's a command line tool:

```python
shiny run --port 5000 app.py
```
You can then go to `localhost:5000` to see your app running. Note that you don't need to call your app file `app.py` in Python, it's just habit on my part!

### Deployment

Most of the blog post so far has been "Shiny for R and Shiny for Python are pretty similar", but here's where it they're completely different: deployment!

The deployment of the R version is nothing especially exciting - it's deployed to [shinyapps.io](https://www.shinyapps.io/). It's possible to automate this process using GitHub Actions, and you can read more about automating the deployment of Shiny apps in my previous [blog post](https://nrennie.rbind.io/blog/2022-10-05-automatically-deploying-a-shiny-app-for-browsing-rstats-tweets-with-github-actions/). The way that deploying to shinyapps.io works it that the server and the client are separate: the server runs the R code, and clients connect via a web browser. You can deploy Python Shiny apps in a similar way, where there is a separate server running the Python code. But, there's another way to deploy Shiny apps built with Python...

[Shinylive](https://shiny.rstudio.com/py/docs/shinylive.html) is a method of deployment where apps run entirely in the client's web browser, without the need for a separate server running Python.

<p align="center">
<img src="https://raw.githubusercontent.com/nrennie/nrennie.rbind.io/main/content/blog/2023-01-20-seeing-double-shiny-python-r/shinylive.png" width = "90%" alt="Demonstration of difference between shinylive and traditional deployment"><br>
<small>Image: <a href="https://shiny.rstudio.com/py/docs/shinylive.html">shiny.rstudio.com/py/docs/shinylive</a></small>
</p>

There are some big advantages to using Shinylive instead of a traditional deployment. The biggest advantages for me, is that it means apps can be deployed to any static web hosting service - including GitHub Pages! There are a couple of disadvantages of this type of deployment, and the most obvious one is the large download size which means the initial load time is quite slow. However, the data will be cached by the browser and it should load quicker in future. The [Shinylive documentation](https://shiny.rstudio.com/py/docs/shinylive.html) provides a longer overview of the pros and cons.

Shinylive deployment was relatively seamless - it integrated well with GitHub Pages and I was able to automate the deployment so any changes to main on GitHub trigger a re-deploy. The official documentation was enough to guide me through the process. I did have a look at a few other blog posts on shinylive, but some of the early tutorials were a little out of date since Shiny for Python is still in active development and changing. If you are browsing for blog posts, look for one that gets updated, or has a recent date. I particularly like [this guide](https://github.com/RamiKrispin/shinylive) from Rami Krispin which talks about deploying an app with shinylive to GitHub Pages.

The only issue I had with shinylive deployment was reading in the data file. Whilst supplying the URL of the CSV file (or even the local file path): 
```python
flights = pd.read_csv('https://raw.githubusercontent.com/nrennie/EuropeanFlights-Python/main/app/flights_data.csv')
```
works fine when running the app locally, it doesn't work when deployed with shinylive. Instead you need to wrap the URL inside `open_url()` from `pyodide`:

```python
from pyodide.http import open_url
flights = pd.read_csv(open_url('https://raw.githubusercontent.com/nrennie/EuropeanFlights-Python/main/app/flights_data.csv'))
```
This is because in the first version `pandas` is using `urllib.request`, which doesn't currently work in Pyodide (needed for running Python in a browser with shinylive). The use of Pyodide also means that we [can't load local data files](https://pyodide.org/en/stable/usage/faq.html). Unfortunately, the version containing `open_url()` won't run locally. So you either need to switch between the two versions when developing and deploying, or create a function that does that switching for you - see [shinylive.io/py/examples/#fetch-data-from-a-web-api](https://shinylive.io/py/examples/#fetch-data-from-a-web-api) for help with the latter. You can also find a bit more information in this [GitHub issue](https://github.com/rstudio/py-shiny/issues/293).

### Final thoughts

I'm super excited by Shiny for Python, and it felt very easy to use - at least as an R user with experience of Shiny in R. If you're an R user looking to learn or refresh your Python skills - I think building a Shiny app in Python is a good place to start!

* The finished apps look very similar, and it was hard to tell them apart.
* The R code and the Python code are very similar.
* The deployment method *could* be entirely different!

In my opinion, one of the best things about R is the wide-range of community developed packages - including the numerous packages that extend the functionality of Shiny. Since Shiny for Python is still relatively new, some of the features I normally rely on in R aren't quite there yet, and I'm really hoping the community comes together to create those additional features. Shiny for Python definitely has a lot of potential and I'd be interested to hear from those with experience in building apps in other Python frameworks how Shiny stacks up against the competition. 

If you want to explore the Shiny apps mentioned in this post, the Python version is deployed on [GitHub Pages](https://nrennie.github.io/EuropeanFlights-Python/), and the source code can be found on [GitHub](https://github.com/nrennie/EuropeanFlights-Python). The R version is deployed on  [shinyapps.io](https://nrennie35.shinyapps.io/EuropeanFlights/), and the source code can be found on [GitHub](https://github.com/nrennie/EuropeanFlights-R).

P.S. Just for fun, I also created a version in Streamlit. I was surprised by how quickly I got this up and running - about 25 mins after installing Streamlit for the first time, I had a deployed and (mostly) working [app](https://nrennie-europeanflights-streamlit-app-pdfow5.streamlit.app/)! You can also view the code for the Streamlit version on [GitHub](https://github.com/nrennie/EuropeanFlights-Streamlit) to compare.

<p align="center">
<img src="https://raw.githubusercontent.com/nrennie/nrennie.rbind.io/main/content/blog/2023-01-20-seeing-double-shiny-python-r/plane.gif" width = "90%" alt="Gif of plane landing on a runway"><br>
<small>Image: <a href="https://giphy.com/gifs/SafranGroup-landing-airbus-a350-RjBZI0nO3Hk6aprlMz">giphy.com</a></small>
</p>
