---
author: Nicola Rennie
categories:
  - Rtistry
date: "2022-03-03"
draft: false
excerpt: "Generative art is the process of creating artwork through a set of pre-determined rules often with an element of randomness. This blog post will outline the best practices I follow when creating generative art in R."
layout: single
subtitle: "Generative art is the process of creating artwork through a set of pre-determined rules often with an element of randomness. This blog post will outline the best practices I follow when creating generative art in R."
tags:
- r, rtistry, generative art
title: "Best (artistic) practices in R"
image: featured.jpg
---

### What is generative art?

Generative art is the process of creating artwork through a set of pre-determined rules often with an element of randomness. It is often termed *rtistry* or *aRt* when the art is created using the programming language R. 

In October 2021, I started experimenting with generative art, and developed a [R package](https://github.com/nrennie/aRt/). I also took part in [#genuary2022](https://github.com/nrennie/genuary), the challenge running in the month of January where generative artists create art based on a different prompt each day. is an artificially generated month of time where we build code that makes beautiful things. You can view a selection of my generative art portfolio [here](https://nrennie.rbind.io/portfolio/rtistry/).


<blockquote class="twitter-tweet" align="center"><p lang="und" dir="ltr"><a href="https://t.co/sdRpqHb1OM">https://t.co/sdRpqHb1OM</a> <a href="https://t.co/BwnS1Ntgxf">pic.twitter.com/BwnS1Ntgxf</a></p>&mdash; Nicola Rennie (@nrennie35) <a href="https://twitter.com/nrennie35/status/1488099926450094080?ref_src=twsrc%5Etfw">January 31, 2022</a></blockquote> <script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>


This blog post will outline the best practices I follow when creating generative art. Note that these are simply the practices that I tend to follow, and are not meant to be representative of the practices utilised in the wider generative art community, or a recommendation of practices to follow. 


### What are best practices?

Best coding practices are informal rules that developers follow to help improve the quality of their code, and ensure it is easy to maintain. In the R (and wider) community, common coding practices include:

- using descriptive variable names
- following a consistent style guide (e.g. always using either `<-` or `=` to assign variables, not a mixture of both)
- writing short functions that do only one thing 
- writing clear user documentation (that includes how to install and use your code)
- making results reproducible (i.e. if someone else runs your code they should get the exact same output)
- writing unit tests to check which conditions your code works under

### Best practices in generative art

This section will cover some additional, or adjusted practices, I also follow when producing generative art in R.

#### Parameter restriction

The functions I use to generate art often have multiple parameters as input. These parameters may have *natural* restrictions on them. For example, some parameters may need to be positive e.g. the number of points to draw. I often impose additional restrictions on the parameters e.g., I may force there to be at least 100 points generated. Although the art could be generated (in the sense that the code would run) outside of these additional restrictions, this forces anyone else using the functions to generate art within the general style that I designed. 

I developed a [Shiny app](https://nrennie35.shinyapps.io/nrennie_aRt/) for users to generate and download a PNG of some of my rtistry. I limited the parameters even further in this instance to make it simpler for users. 

#### One function, one task

In a data science project, I would tend to split up my functions into: 

- data generation
- data wrangling
- data analysis
- visualisation

However, in my {aRt} package, *most* of the art pieces tend to each be generated by a single function: data generation, plotting, and themes all in one. In the instances where I do split into separate functions, this tends to be for reasons of computational efficiency rather than readability. There are a couple of reasons why:

- I wanted each piece to be generated by a single function
- I wanted each exported function to generate a piece of art
- I didn't want (too many) hidden functions so that users had all the tools they need to recreate a piece

I'm still on the fence about whether this is a more appropriate approach.

#### Commenting code and documentation

I do try to document code as much as possible. The part of documentation I find difficult in generative art is the overall description of what the function does. I tend to go for a *technical* description of what the code does e.g. "this function returns a {ggplot2} object constructed using polygons". I find this easier to write, and perhaps more important in terms of coding practices, than a description of the final artwork. 

#### Reproducibility

Let's think about reproducibility for a second. It’s standard good coding practice - when someone else runs your code, they should be able to produce an identical output. But is this always desirable in the generative art world? If you could replicate the Mona Lisa at the touch of a button, would you? Although I would never claim to be the Leonardo da Vinci of generative art, the world of creative coding does open up the question of whether giving someone else the ability to replicate your art is a good thing. Especially in the world of NFTs (although we're not getting into *that* here).

Personally, I do make my work reproducible and all of my code is available on [GitHub](https://github.com/nrennie).

### Final thoughts

These are just a few of the additional practices I also follow when writing code for generative art. The most important thing for me to remember is that generative art is supposed to be fun, so good coding practices probably matter even less here!

<a class="twitter-share-button"
  href="https://twitter.com/intent/tweet"
  data-size="large">
Tweet</a>