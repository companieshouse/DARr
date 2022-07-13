--- 
title: "Companies House Data Quality"
author: "Rob Eva and Lauren Calow"
date: "2022-07-13"
site: bookdown::bookdown_site
documentclass: book
bibliography: [book.bib, packages.bib]
url: "https://companieshouse.github.io/DARr/"
cover-image: "../images/star2.png"
description: |
  This is an introduction to Companies House data quality.
  The HTML output format for this example is bookdown::bs4_book,
  set in the _output.yml file. The books is aimed towards data analysts
  and data engineers in the Data, Analystics and Research department.
biblio-style: apalike
csl: chicago-fullnote-bibliography.csl
---

# Introduction

Placeholder


## Making sure our register benefits the public good and wider economy 
## Why do we need a Data Strategy and Management Framework?
## The Data Quality Project
### Project Background / Problem Statement
### Project Objectives 

<!--chapter:end:index.Rmd-->


# Data Quality Principles

Placeholder


## Commit to data quality
### Embed effective data management and governance
### Build data quality capability
### Focus on continuous improvement
## Know your users and their needs
### What is a user?
### Research your users and understand their quality needs
## Assess quality throughout the data lifecycle
### What is a data lifecycle?
### Assess data quality at all stages of the lifecycle
### Communicate with users and stakeholders across the lifecycle
## Communicate data quality clearly and effectively
### Communicate data quality to users
### Provide effective documentation and metadata
## Anticipate changes affecting data quality
### Plan for the future

<!--chapter:end:03-dq-principles.Rmd-->


# Reproducible Analytical Pipeline (RAP)

Placeholder


## The Problem
## A RAP will:
## What RAP does
## The nature of Reproducible Analytical Pipelines (RAP)

<!--chapter:end:04-RAP.Rmd-->


# Birmingham Address Matching

Placeholder


## Introduction and Purpose
## Scores used 
## Data  
### Companies House Data
### Postcode Address File 
## Software
## Caveats and Limitations
## Method
### Cleaning the data
### Separating the Birmingham data
## Scoring the data
### Score 0 - No Postcode Given
### Score 1 - Postcode given but doesn’t exist in PAF	
### Score 2 - Partial postcode given	
### Score 3 - Postcode matches PAF but given in the incorrect field	
### Score 4 - Full correct postcode given, address doesn't match PAF	
### Score 5 - Full correct postcode given, address partially matches PAF	
### Score 6 - Address and postcode details match PAF	
## Power BI Report Link 
## Power BI Dashboard Link
## Recommendations

<!--chapter:end:05-address_match.Rmd-->


# Glasgow Address Matching

Placeholder


## Introduction and Purpose
## Scores used 
## Data  
### Companies House Data
### Postcode Address File 
## Software
## Caveats and Limitations
## Method
### Cleaning the data
### Separating the Glasgow data
## Scoring the data
### Score 0 - No Postcode Given
### Score 1 - Postcode given but doesn’t exist in PAF	
### Score 2 - Partial postcode given	
### Score 3 - Postcode matches PAF but given in the incorrect field	
### Score 4 - Full correct postcode given, address doesn't match PAF	
### Score 5 - Full correct postcode given, address partially matches PAF	
### Score 6 - Address and postcode details match PAF	
## Power BI Report Link 
## Power BI Dashboard Link
## Recommendations

<!--chapter:end:06-GLA_address_match.Rmd-->


# Application Programming Interface (API)

Placeholder


## What is an API? 
## Working with JSON Data in Python
## Companies House APIs
## Data Quality Augmentation

<!--chapter:end:08-api.Rmd-->

# Bookdown Reference

The following chapters show how Bookdown works for authoring documentation.

<!--chapter:end:19-bookdown.Rmd-->


# About

Placeholder


## Usage 
## Render book
## Preview book

<!--chapter:end:20-about.Rmd-->

# Hello bookdown 

All chapters start with a first-level heading followed by your chapter title, like the line above. There should be only one first-level heading (`#`) per .Rmd file.

## A section

All chapter sections start with a second-level (`##`) or higher heading followed by your section title, like the sections above and below here. You can have as many as you want within a chapter.

### An unnumbered section {-}

Chapters and sections are numbered by default. To un-number a heading, add a `{.unnumbered}` or the shorter `{-}` at the end of the heading, like in this section.

<!--chapter:end:21-intro.Rmd-->


# Cross-references {#cross}

Placeholder


## Chapters and sub-chapters
## Captioned figures and tables

<!--chapter:end:22-cross-refs.Rmd-->

# Parts

You can add parts to organize one or more book chapters together. Parts can be inserted at the top of an .Rmd file, before the first-level chapter heading in that same file. 

Add a numbered part: `# (PART) Act one {-}` (followed by `# A chapter`)

Add an unnumbered part: `# (PART\*) Act one {-}` (followed by `# A chapter`)

Add an appendix as a special kind of un-numbered part: `# (APPENDIX) Other stuff {-}` (followed by `# A chapter`). Chapters in an appendix are prepended with letters instead of numbers.




<!--chapter:end:23-parts.Rmd-->

# Footnotes and citations 

## Footnotes

Footnotes are put inside the square brackets after a caret `^[]`. Like this one ^[This is a footnote.]. 

## Citations

Reference items in your bibliography file(s) using `@key`.

For example, we are using the **bookdown** package [@R-bookdown] (check out the last code chunk in index.Rmd to see how this citation key was added) in this sample book, which was built on top of R Markdown and **knitr** [@xie2015] (this citation was added manually in an external file book.bib). 
Note that the `.bib` files need to be listed in the index.Rmd with the YAML `bibliography` key.


The `bs4_book` theme makes footnotes appear inline when you click on them. In this example book, we added `csl: chicago-fullnote-bibliography.csl` to the `index.Rmd` YAML, and include the `.csl` file. To download a new style, we recommend: https://www.zotero.org/styles/


The RStudio Visual Markdown Editor can also make it easier to insert citations: <https://rstudio.github.io/visual-markdown-editing/#/citations>

<!--chapter:end:24-citations.Rmd-->


# Blocks

Placeholder


## Equations
## Theorems and proofs
## Callout blocks

<!--chapter:end:25-blocks.Rmd-->


# Sharing your book

Placeholder


## Publishing
## 404 pages
## Metadata for sharing

<!--chapter:end:26-share.Rmd-->


# References {-}


<!--chapter:end:27-references.Rmd-->

