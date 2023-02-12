---
title: "Making Pretty PDFs with Quarto"
author: Nicola Rennie
categories:
  - R
  - Quarto
date: "2023-03-09"
slug: "making-pretty-pdf-quarto"
draft: false
excerpt: "Adding custom styling to documents makes them look more professional. This blog post will take you through the process of making a Quarto extension to create a reusable custom template for good-looking PDFs."
layout: blog-single
subtitle: "Adding custom styling to documents makes them look more professional. This blog post will take you through the process of making a Quarto extension to create a reusable custom template for good-looking PDFs."
tags:
- r, quarto, latex
image: featured.png
---

[Quarto](https://quarto.org/) is an open-source scientific and technical publishing system that allows you to combine text with code to create fully reproducible documents in a variety of formats. One of those formats is PDF. The default outputs look reasonably good for academic articles, but if you're making professional reports, a CV, or sending a letter - you probably want something that just looks a bit *nicer*.

Before we begin, I do want to point out that PDFs are not accessible, and generally recommend using HTML documents instead. However, many places won't yet accept HTML documents - especially when it comes to uploading documents online. So, we might have to stick with PDF for now.

### What are Quarto extensions?

[Quarto extensions](https://quarto.org/docs/extensions/) are used to modify and extend the behaviour of Quarto. Templates are just one type of Quarto extension.

> Note that if you're using or developing Quarto extensions, you will most likely need to be using at least version 1.2 of Quarto.

### Building a Quarto extension

Here, I've developed the Quarto extension in a GitHub repository with the following structure:

```shell
repository
├── template.qmd 
├── _extensions
│  |  ├── PrettyPDF
│  |  |  ├── _extension.yml
│  |  |  ├── PrettyPDF.tex
│  |  |  ├── pagestyle.tex
│  |  |  ├── logo.png
```

The `template.qmd` is the file that will be copied over to a new directory when a user chooses to use the template, as well as the extension. Template files are optional, but it makes it easier when starting a new file if the YAML has already been filled in for a user. In this case, it's a .qmd file that's (almost) the same as the default template you get if you do `File --> New File --> Quarto Document` but with the format specified as `format: PrettyPDF-pdf` to make sure Quarto looks for our extension.

The `PrettyPDF.tex` file is where most of the work is being done, and is what I'll explain in the rest of this blog post. It contains LaTeX code which will be included in the header of the document, and implements the styling that we want. The (optional) `pagestyle.tex` file contains an extra little bit of LaTeX that needs to be included before the body of the document (but not in the header). The (optional) `logo.png` file is the image that will be included in the final document in the top right corner.

The `_extension.yml` file is where the extension specific information is stored. It looks a little bit like the YAML at the top of Quarto documents, in that it specifies the format (and any pre-set format options). But it also includes information on the extension - including the extension name, and the version number. For the `PrettyPDF` extension, it looks like this:

```yaml
title: PrettyPDF
author: Nicola Rennie
version: 0.0.1
contributes:
  formats: 
    pdf:
      include-in-header: 
       - "PrettyPDF.tex"
      include-before-body:
       - "pagestyle.tex"
      toc: false
      code-block-bg: light
      linkcolor: highlight
      urlcolor: highlight
```
You can see where the `PrettyPDF.tex` and `pagestyle.tex` are referenced. These could be added directly in the template file, but it keeps the main .qmd YAML a bit tidier if they're loading in the background, and uses the same pre-sets for all documents of this type.

Let's talk about that `PrettyPDF.tex` file in a bit more detail...

#### Load some LaTeX packages

The first thing we need to do is load some LaTeX packages, that will allow us to implement the rest of the styling options.

```latex
% load packages
\usepackage{geometry}
\usepackage{xcolor}
\usepackage{eso-pic}
\usepackage{fancyhdr}
\usepackage{sectsty}
\usepackage{fontspec}
\usepackage{titlesec}
```

Now we can set up the page geometry. Here we specify that we want the paper size to be A4, and increase the margin on the right hand side. This is because I want to add a coloued bar on the right hand side of the page, and need to make sure the text doesn't overlap into that sidebar.

```latex
%% Set page size with a wider right margin
\geometry{a4paper, total={170mm,257mm}, left=20mm, top=20mm, bottom=20mm, right=50mm}
```
Let's also define some colours using the `xcolor` package, which takes hex colours as input (crucially, not including the # symbol)! Defining colours at the start makes it easier to change colours later, and easier to match up different elements with the same colour. Here, I've defined three colours: `light` (which is a pale purple) that will be used for the aforementioned sidebar and code block background; `highlight` (which is a brighter purple) that will be used for links; and `dark` which will be used for text.

```latex
%% Let's define some colours
\definecolor{light}{HTML}{E6E6FA}
\definecolor{highlight}{HTML}{800080}
\definecolor{dark}{HTML}{330033}
```
You *could* also define a colour for the page background but I'd recommend against that most of the time. Some people still print PDFs - and you don’t want to be the person who sends in their CV with a dark background colour and only half of gets printed because there's not enough ink in the printer...

So let's get onto adding that sidebar! This LaTeX code chunk, adds a coloured bar (with the `light` colour`) on the right hand side which spans the entire height of the page, and is 3cm wide.

```latex
%% Let's add the border on the right hand side
\AddToShipoutPicture{% 
    \AtPageLowerLeft{% 
        \put(\LenToUnit{\dimexpr\paperwidth-3cm},0){% 
            \color{light}\rule{3cm}{\LenToUnit\paperheight}%
          }%
     }%
}
```
If we want to add a logo in the (top right) corner, we can edit the above code instead to be:

```latex
%% Let's add the border on the right hand side and the logo in the top right corner
\AddToShipoutPicture{% 
    % Right bar
    \AtPageLowerLeft{% 
        \put(\LenToUnit{\dimexpr\paperwidth-3cm},0){% 
            \color{light}\rule{3cm}{\LenToUnit\paperheight}%
          }%
     }%
    % Logo
    \AtPageLowerLeft{% 
        \put(\LenToUnit{\dimexpr\paperwidth-2.25cm},27.2cm){% 
            \color{light}\includegraphics[width=1.5cm]{_extensions/nrennie/PrettyPDF/logo.png}
          }%
     }%
}
```
The second part of this LaTeX code, adds the file `logo.png` to the top right corner, 2.25cm from the side of the page, and is 1.5cm wide (which ensures it's centered on the 3cm sidebar). Here, the file extension is relative to where the main .qmd file is after the extension has been installed by a user.

Since I have a sidebar, I'd prefer if the page numbers were in that sidebar, rather than in the middle of the page (where they normally are by default). This LaTeX code defines a new page style that pushes the page number to the right hand side, and also increase how far it is from the bottom of the page.

```latex
%% Style the page number
\fancypagestyle{mystyle}{
\fancyhf{}
\renewcommand\headrulewidth{0pt}
\fancyfoot[R]{\thepage}
\fancyfootoffset{3.5cm}
}
\setlength{\footskip}{20pt}
```
To get this to work, we need to include `\pagestyle{mystyle}` just before our document content - that's what's stored in the `pagestyle.text` folder. Again, it could be included in the `template.qmd` file, but this approach means users don't see what they don't need to.

Finally, I want to deal with the font: colours and font family. Let's start of with changing the colour of all the section title font to our `dark` colour. I also added an underline to subsection (##) headings. 

```latex
%% style the chapter/section fonts
\chapterfont{\color{dark}\fontsize{20}{16.8}\selectfont}
\sectionfont{\color{dark}\fontsize{20}{16.8}\selectfont}
\subsectionfont{\color{dark}\fontsize{14}{16.8}\selectfont}
\titleformat{\subsection}
  {\sffamily\Large\bfseries}{\thesection}{1em}{}[{\titlerule[0.8pt]}]
```

I also want to left align the title, since it looks better with the sidebar on the right:

```latex
% left align title
\makeatletter
\renewcommand{\maketitle}{\bgroup\setlength{\parindent}{0pt}
\begin{flushleft}
  {\sffamily\huge\textbf{\MakeUppercase{\@title}}}
  \@author
\end{flushleft}\egroup
}
\makeatother
```

Now we just need to change the fonts that are used. Here, I've used the `Ubuntu` font which I've downloaded and stored in the `_extensions/Ubuntu` directory. LaTeX has some built-in font rules, so here I've set the default sans serif font to be Ubuntu, as well as the main font. Again, the file paths here are relative to the main .qmd file that a user will be editing.

```latex
%% Use some custom fonts
\setsansfont{Ubuntu}[
    Path=_extensions/nrennie/PrettyPDF/Ubuntu/,
    Scale=0.9,
    Extension = .ttf,
    UprightFont=*-Regular,
    BoldFont=*-Bold,
    ItalicFont=*-Italic,
    ]

\setmainfont{Ubuntu}[
    Path=_extensions/nrennie/PrettyPDF/Ubuntu/,
    Scale=0.9,
    Extension = .ttf,
    UprightFont=*-Regular,
    BoldFont=*-Bold,
    ItalicFont=*-Italic,
    ]
```
And that's everything that's in the `PrettyPDF.tex` file! You can download a copy of the template PDF [here](template.pdf).

### Using this extension

If you want to use this extension in your own projects, please feel free to do so! You can install the extension using the command line:

To install the Quarto extension, create a directory, and use the template file:

```bash
quarto use template nrennie/PrettyPDF
```

To use the extension in an existing project without installing the template file:

```bash
quarto install extension nrennie/PrettyPDF
```
Note that you will need to update the output format of your existing .qmd file to `format: PrettyPDF-pdf` to enable use of the extension. You can add any additional PDF options to the `PrettyPDF-pdf` using, for example:

```yaml
format:
  PrettyPDF-pdf:
    keep-tex: true
```

### Adapting this extension

If you want to update this template to use, for example, different colours or a different logo, you have two options. 

* Install the extension using the instructions above, then edit the  `_extensions/nrennie/PrettyPDF/PrettyPDF.tex` file.

* Make a fork of the [GitHub repository](https://github.com/nrennie/PrettyPDF), and update the `_extensions/PrettyPDF/PrettyPDF.tex` file. You can then install the extension from your own GitHub.

#### Changing the logo 
Either replace the `logo.png` file in the `_extensions` directory with a new file of your choosing (with the same name), or change the file path on line 28 of `PrettyPDF.tex` to point to a different logo file. Note that the file path is relative to your .qmd file. You can remove lines 25-30, if you'd rather not have a logo at all.

#### Changing the colours
Lines 14-16 of `PrettyPDF.tex` define three colours used in the template: `light`, `dark`, and `highlight`. Change the hex colours in these lines to update the colours. The `light` colour changes the sidebar and code block background colours. The `dark` colour changes the text colour, and the `highlight` colour changes the link colours.

### Further resources

If you're looking for more Quarto extensions, I'd highly recommend checking out the [Awesome Quarto](https://github.com/mcanouil/awesome-quarto) repository - it has links to lots of Quarto resources including talks, tools, examples, and articles.

If you want to know how to distribute your Quarto extension as part of an R package, instead of through GitHub, this [blog post](https://spencerschien.info/post/r_for_nonprofits/quarto_template/) from [Spencer Schien]() will be very useful.

This [blog post](https://meghan.rbind.io/blog/quarto-pdfs/) from [Meghan Hall](https://meghan.rbind.io/about/) gives sme great tips for customising Quarto PDFs, including parameterised reports so you change the styling of your report based on parameters, and your data.

Now you're ready to go and create some beautiful looking PDFs with Quarto!

<p align="center">
<img src="https://raw.githubusercontent.com/nrennie/nrennie.rbind.io/main/content/blog/2023-03-09-making-pretty-pdfs-with-quarto/art.gif" width = "60%" alt="Gif of a dog wearing a beret painting a canvas"><br>
<small>Image: <a href="https://giphy.com/gifs/dog-human-painting-4y6DqPvlICp5S">giphy.com</a></small>
</p>







