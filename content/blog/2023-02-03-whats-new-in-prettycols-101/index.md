---
author: Nicola Rennie
categories:
  - R
date: "2023-02-03"
slug: "whats-new-in-prettycols-101"
draft: false
excerpt: "{PrettyCols} is an R package containing aesthetically pleasing colour palettes that are compatible with {ggplot2}. Find out about new features and palettes contained in the latest release!"
layout: blog-single
subtitle: "{PrettyCols} is an R package containing aesthetically pleasing colour palettes that are compatible with {ggplot2}. Find out about new features and palettes contained in the latest release!"
tags:
- r, data visualisation
title: "What's new in {PrettyCols} 1.0.1?"
image: featured.png
---

Back in September 2022 I submitted {PrettyCols}, an R package containing aesthetically pleasing colour palettes, to CRAN. If you missed it, you can read the [blog post](https://nrennie.rbind.io/blog/2022-09-02-introducing-prettycols/) introducing the package!

After a few months, it was time for an update and this blog post will give you a brief overview of some of the new features and palettes!

### More palettes!

The new release contains twelve additional palettes, including two new sequential palettes (`Yellows` and `Reds`), two new diverging palettes (`PurpleYellows` and `RedBlues`), and eight new qualitative palettes. You can see the complete list of available palettes by running `view_all_palettes()`:

<p align="center">
<img width="70%" src="https://raw.githubusercontent.com/nrennie/nrennie.rbind.io/main/content/blog/2023-02-03-whats-new-in-prettycols-101/all_palettes.png">
</p>

or browsing the [package vignette](https://nrennie.github.io/PrettyCols/articles/available-palettes.html) on available palettes.

### Colourblind friendly palettes

```r
PrettyCols::view_all_palettes(colourblind_friendly = TRUE)
```
<p align="center">
<img width="70%" src="https://raw.githubusercontent.com/nrennie/nrennie.rbind.io/main/content/blog/2023-02-03-whats-new-in-prettycols-101/cblind.png">
</p>

You can combine filtering by palette types with filtering by colourblind friendliness, for example to view only colourblind friendly diverging palettes:

```r
PrettyCols::view_all_palettes(type = "div", colourblind_friendly = TRUE)
```
<p align="center">
<img width="70%" src="https://raw.githubusercontent.com/nrennie/nrennie.rbind.io/main/content/blog/2023-02-03-whats-new-in-prettycols-101/cblind_div.png">
</p>

The `view_all_palettes()` function now also supports filtering by multiple types, e.g. to view all sequential and diverging palettes:

```r
PrettyCols::view_all_palettes(type = c("seq", "div"))
```
<p align="center">
<img width="70%" src="https://raw.githubusercontent.com/nrennie/nrennie.rbind.io/main/content/blog/2023-02-03-whats-new-in-prettycols-101/div_seq.png">
</p>

The colourblind-friendliness has been checked using `colorblindcheck::palette_check()`, and a judgement made based on the number of distinct colour pairs with deuteranopia, protanopia, tritanopia in comparison to full colour vision. This judgement may not always be correct, and if you think a colour palette has been listed as colourblind friendly in error, please raise a [GitHub issue](https://github.com/nrennie/PrettyCols/issues) and I'll re-classify the palette.

### Python support

This colour palette package was originally developed for use with R, particularly with {ggplot2}. However, many people make charts and generative art with Python instead. So, now you can use PrettyCols with Python. The Python code is adapted from the [{MetBrewer}](https://github.com/BlakeRMills/MetBrewer/tree/main/Python) package from [Blake Robert Mills](https://github.com/BlakeRMills) which also provides support for R and Python.

You can install from [GitHub](https://github.com/nrennie/PrettyCols/tree/main/Python) and read more about how to use these palettes with Python in the *Using with Python* package [vignette](https://nrennie.github.io/PrettyCols/articles/using-with-python.html). 

Here's a small example of using the `Bright` colour palette with `matplotlib` to make a bar chart:

```python
import prettycols
import matplotlib.pyplot as plt

colors = pretty_cols(name="Bright", n=3, palette_type="discrete")
x = ['A', 'B', 'C']
value = [1, 2, 3]
plt.bar(x, value, color=colors)
plt.show()
```
<p align="center">
<img width="70%" src="https://raw.githubusercontent.com/nrennie/nrennie.rbind.io/main/content/blog/2023-02-03-whats-new-in-prettycols-101/python.png">
</p>

To end this post, here's another couple of examples of these palettes being used for generative art!

<div class="row">
<div class="column">
<p align="center">
<img width="90%" src="https://raw.githubusercontent.com/nrennie/nrennie.rbind.io/main/content/blog/2023-02-03-whats-new-in-prettycols-101/001.png">
</p>
</div>
<div class="column">
<p align="center">
<img width="90%" src="https://raw.githubusercontent.com/nrennie/nrennie.rbind.io/main/content/blog/2023-02-03-whats-new-in-prettycols-101/002.png">
</p>
</div>
</div>
{{< detail-tag "Show code" >}}
``` r
aRt::puzzles(n = 200,
             num_groups = 30,
             col_palette = PrettyCols::prettycols("Lively"),
             bg_col = "white",
             s = 1234)
              
aRt::stacked(n_x = 4,
             n_y = 4,
             col_palette = PrettyCols::prettycols("Lucent"),
             shadow_intensity = 0.1,
             sunangle = 315,
             s = 124)
```
{{< /detail-tag >}}

There are plans for a few more updates in the future including even more palettes, and support for diverging colour scales in {ggplot2} which allows you to specify a midpoint for the scale. If you find that something in {PrettyCols} isn't working, or if you've got an idea for more features, please raise a [GitHub issue](https://github.com/nrennie/PrettyCols/issues)!
