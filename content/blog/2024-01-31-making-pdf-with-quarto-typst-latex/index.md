---
title: "Making Pretty PDFs with Typst (and Quarto)"
author: Nicola Rennie
categories:
  - R
  - Quarto
  - LaTeX
date: "2024-01-31"
slug: "making-pdf-with-quarto-typst-latex"
draft: false
excerpt: "With the latest 1.4 release of Quarto, it's now possible to create PDF documents with Quarto using Typst. How does it compare to LaTeX, and is it actually easier to learn and use?"
layout: blog-single
subtitle: "With the latest 1.4 release of Quarto, it's now possible to create PDF documents with Quarto using Typst. How does it compare to LaTeX, and is it actually easier to learn and use?"
image: featured.png
---

`! Undefined control sequence` - an error message you are probably unfortunate enough to be familiar with if you've ever tried to make a PDF using LaTeX. Until recently, if you've been creating reproducible PDFs using R Markdown or [Quarto](https://quarto.org/), then your PDF documents have been most likely been created using LaTeX in the background. If you watch which files are generated when you render your document, you'll see that LaTeX files (.tex) are generated. 

LaTeX is excellent for including mathematical notation in your documents, and gives users a lot of control over the formatting of documents. However, it can also be a steep learning curve if you want to implement more complex formatting, and the error messages are not always the most informative. Some people might ask, do you need LaTeX to make PDFs? And the answer is no. There are several other ways to create PDFs, including Typst.

<p align="center">
<img src="https://raw.githubusercontent.com/nrennie/nrennie.rbind.io/main/content/blog/2024-01-31-making-pdf-with-quarto-typst-latex/featured.png" width = "60%" alt="Flowchart of PDF created with Quarto and Typst or LaTeX">
</p>

### What is Typst?

[Typst](https://typst.app/docs) is a *markup-based typesetting system that is designed to be as powerful as LaTeX while being much easier to learn and use* which has been around since late December 2022. In even more exciting news, with the [latest release of Quarto](https://quarto.org/docs/blog/posts/2024-01-24-1.4-release/), it's now possible to create PDF documents with Quarto using Typst. To use Typst with Quarto, set the `format` in the YAML of your Quarto document:

```yaml
---
title: "Hello Typst!"
format: typst
---
```

There are also some existing Quarto extensions which provide [custom Typst formats for Quarto](https://quarto.org/docs/output-formats/typst-custom.html) that you can use to add styling to your documents. So how easy is it create custom formats with Typst?

### Custom formatting with Typst

Almost a year ago, I created a Quarto extension to add LaTeX styling to PDF outputs in order to make slightly nicer looking PDFs, with an [accompanying blog post](https://nrennie.rbind.io/blog/making-pretty-pdf-quarto/) to explain the process. So it's only natural to come back a year later and try to recreate the same styling using Typst instead of LaTeX...

The Typst website provides some [guidance on creating templates](https://typst.app/docs/tutorial/making-a-template/), but as a newbie to Typst, I found it a little bit hard to follow. I started by looking at the [Department News Quarto Typst extension](https://github.com/quarto-ext/typst-templates/tree/main/dept-news) because the PDF output looked somewhat similar to what I was trying to achieve - a coloured box in the background, an image in a specific place, and some formatted text. 

There are two files here we need:

* **typst-show.typ**: a file that calls the template. It maps Pandoc metadata to template function arguments.
* **typst-template.typ**: the core template file. It defines the styling of the document.

I didn't have to make too many changes to the `typst-show.typ` file - mapping to pandoc arguments is likely to be reasonably consistent across different style extensions. For example, the title will always map to the title, and the author will always map to the author.

The `typst-template.typ` is where it gets a little bit more complicated, as I tried to rewrite LaTeX styling with Typst. So I did anyone would do - started deleting and editing lines of code... Then the error messages come along because you've broken it so you undo everything you just did. Eventually, my trial and error approach seemed to recreate something that worked (or at least the document rendered). I also used the [Typst documentation](https://typst.app/docs/reference/) to add in a few new lines.

Compare the two below where we set the page margins and position a light purple coloured rectangle on the right hand side of the page: 

{{< panelset class="packages" >}}
{{< panel name="Typst" >}}
```typst
// Configure pages.
set page(
  margin: (left: 2cm, right: 1.5cm, top: 2cm, bottom: 2cm),
  background: place(right + top, rect(
    fill: rgb("#E6E6FA"),
    height: 100%,
    width: 3cm,
  ))
)
```
{{< /panel >}}
{{< panel name="LaTeX" >}}
```latex
\usepackage{geometry}
\usepackage{eso-pic}
\usepackage{xcolor}
\geometry{a4paper, total={170mm,257mm}, left=20mm, top=20mm, bottom=20mm, right=50mm}
\definecolor{light}{HTML}{E6E6FA}
\AddToShipoutPicture{% 
    \AtPageLowerLeft{% 
        \put(\LenToUnit{\dimexpr\paperwidth-3cm},0){% 
            \color{light}\rule{3cm}{\LenToUnit\paperheight}%
          }%
     }%
}
```
{{< /panel >}}
{{< /panelset >}}

I think you'll agree that the Typst code is much easier to read and understand what's going on. The learning curve for Typst has been much less steep compared to LaTeX. The outputs look fairly similar, though not quite identical.

<p align="center">
<img src="https://raw.githubusercontent.com/nrennie/nrennie.rbind.io/main/content/blog/2024-01-31-making-pdf-with-quarto-typst-latex/report.png" width = "48%" alt="Screenshot of a pdf with a light purple sidebar.">
<img src="https://raw.githubusercontent.com/nrennie/nrennie.rbind.io/main/content/blog/2024-01-31-making-pdf-with-quarto-typst-latex/report-typst.png" width = "48%" alt="Screenshot of a pdf with a light purple sidebar.">
<br>
<small>Similar PDF styling implemented with LaTeX (left) and Typst (right)</small>
</p>

I added the Typst styling as an additional format contributed by the PrettyPDF LaTeX extension I created a year ago, instead of creating a new separate extension. You can view the updated PrettyPDF extension on [GitHub](https://github.com/nrennie/PrettyPDF).

If you want to try out the PrettyPDF extension for yourself, install it using:

```bash
quarto use template nrennie/PrettyPDF
```

> Note: the default template still uses LaTeX PDF, so you'll need to update the YAML in the .qmd file to `format: PrettyPDF-typst`, and ensure you have Quarto 1.4 installed if you want to use the Typst version.

### Typst vs LaTeX

Let's see how Typst compares to LaTeX when it comes to making PDF documents in Quarto. 

What do I like more about Typst?

* It's fast. Much faster than LaTeX. Typst is written in [Rust](https://www.rust-lang.org/), and uses incremental compilation giving faster compile times. Even with simple single page documents, it's noticeably quicker than LaTeX.
* The error messages are more informative. When I was debugging error messages in the style files, it was easier to find the source of error.
* No extra installation. To create PDFs with LaTeX using Quarto, you also need to install a recent distribution of TeX. After installing Quarto 1.4, Typst was all set up and ready to go!

What do I like more about LaTeX?

* Although Typst does provide functionality for mathematical formulae typesetting, LaTeX still feels easier to use for mathematical notation at this point. Perhaps this is simply because I'm a lot more familiar with LaTeX, or because Typst is still relatively young, but LaTeX still has the edge here.
* Sizing of images is a little bit odd, and I had to manually specify image widths. This is a known problem that Typst, pandoc and Quarto are actively working to fix so hopefully this will be fixed soon!

So, will I be using Typst if I'm creating PDF documents with Quarto? Yes, (unless I have to write a lot of equations...)

### Further resources

If you're thinking about trying out Typst and you're already a LaTeX user, you might find the [official Typst *Guide for LaTeX Users* ](https://typst.app/docs/guides/guide-for-latex-users/) useful.

The [Quarto documentation on how to use Typst](https://quarto.org/docs/output-formats/typst.html) to create PDFs is a nice starting point - just make sure you've downloaded and installed at least version 1.4 of Quarto first. There are some existing extensions which provide [custom Typst formats for Quarto](https://quarto.org/docs/output-formats/typst-custom.html) that you can use directly, or use as inspiration to create your own custom format!

Now you're ready to go and create some beautiful looking PDFs with Quarto - either using LaTeX or Typst!

<p align="center">
<img src="https://raw.githubusercontent.com/nrennie/nrennie.rbind.io/main/content/blog/2024-01-31-making-pdf-with-quarto-typst-latex/cat.gif" width = "45%" alt="Gif of a cat typing at a laptop"><br>
<small>Image: <a href="https://giphy.com/gifs/cat-laptop-document-heIX5HfWgEYlW">giphy.com</a></small>
</p>
