---
title: "Automated Reporting"
subtitle: ""
excerpt: "Using Quarto or R Markdown, narrative text can be combined with code to create fully reproducible reports, and automate the reporting process."
date: 2023-02-07
author: "Nicola Rennie"
draft: false
categories:
  - Reporting
layout: single
image: featured.png
---

Automated reporting is a useful tool in reducing the likelihood of human error, making analysis more transparent, and decreasing the amount of time spent creating repetitive reports. I have extensive experience of creating these types of reports using [Quarto](https://quarto.org/) and R Markdown.

Reports can be rendered in a variety of formats including HTML documents, PDF reports, Word documents, or presentations. They can be customised and styled according to branding guidelines to give them a more professional finish. Creating *parameterised reports* means that you can use a set of parameters to create different variations of a report. For example, a report that is created every week to reflect company performance. The example below uses a reusable, custom template to create a monthly report of [Capital Bikeshare](https://capitalbikeshare.com/) usage data.

<iframe src="/portfolio/automated-reporting/report.pdf" width="100%" height="500px">
</iframe>

Using Quarto or R Markdown, narrative text can be combined with code to create fully reproducible reports, and automate the reporting process. This example report takes a month and year as input parameters. The YAML at the top of the document defines these parameters, for example:

```md
---
title: "Capital Bikeshare"
format: capitalPDF-pdf
params:
  year: 2018
  month: 5
---
```

These parameters also mean the report can be generated using:

```bash
quarto render report.qmd -P year:2018 -P month:5
```
to create a report for May 2018. Using scheduled GitHub Actions, this report could be generated on the last day of each month, and emailed out to the relevant parties - no manual labour required! My [blog post](https://nrennie.rbind.io/blog/2022-10-05-automatically-deploying-a-shiny-app-for-browsing-rstats-tweets-with-github-actions/) on automating dashboard deployment gives a few more examples of how GitHub Actions can be used to schedule and automate tasks.

You can download a copy of this PDF from [my website](report.pdf). You can also view the source code for this report on [GitHub](https://github.com/nrennie/capital-bikeshare-report).









