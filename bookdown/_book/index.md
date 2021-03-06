--- 
title: "Companies House Data Quality"
author: "Rob Eva and Lauren Calow"
date: "2022-07-28"
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

## Making sure our register benefits the public good and wider economy 

As part of developing a strategy and framework towards the management of data, it is important to capture the context and main drivers that informs Companies House’s strategic goals.  

A clear strategic CH goal is to create, maintain and publish a companies’ register built upon relevant and accurate information that supports the UK’s global reputation as a trusted place to do business and a leading exponent of greater corporate transparency. Our data needs to inspire trust and confidence so that we can maximise its value and tackle economic crime through analysis and intelligence. 

Specifically, this meets the governments industrial strategy aims to:  

- Make the UK a good place to set up and run a business  

- Ensure corporate transparency which directly supports financing of the corporate sector and inward investment to the UK economy   

- Tackle criminal activity such as money-laundering, fraud and other financial and company related crime. 

Companies House is seeing an increase in the demand for data, research and analysis alongside the data that is freely available to the public. These are primarily to help law enforcement activities but requests for ad hoc information are also on the rise.  

Alongside this, there are new opportunities through the Digital Economy Act (2017) for Companies House to share data and to gain access to new data sources that will enable verification and the identification of suspicious activity to be undertaken. 

However, the world is changing. The increasing volume and variety of data available, coupled with rapid technological development will facilitate the processing and analysis of more data in richer and more complex forms. The ability to harness the power of data is critical in enabling Companies House to be at the forefront of tackling financial and company related crime.  

The Companies House Data Strategy coupled with its security and digital strategies means that through the development of the right data capability, governance and management framework, which balances the need to extract value from data against the appropriate safeguards, we can respond and achieve our goals. 

## Why do we need a Data Strategy and Management Framework?

The purpose of Companies House is to drive confidence in the UK economy. It does this by primarily collecting and presenting data on UK companies that benefits the public good and the wider economy. Companies House operates in line with the Companies Act 2006. A consultation to reform the act is currently in progress and the feedback from this could significantly change the way in which Companies House operates.  

The notion of data is not simply numbers in a spreadsheet. Data means ‘known facts’. In addition to numbers, it can mean words, images, and sounds. Metadata is information about data and is used to find, categorise and link different elements of data together. Harnessing data and metadata are fundamental building blocks in the collection and presentation of information on UK companies. 

Companies House is a producer of official statistics as well as significant levels of management information for both internal and external purposes. As such, Companies House follows the Code of Practice for Statistics, which aims to provide the framework to ensure that statistics are trustworthy, of good quality, and are valuable.  

In addition, Companies House needs to ensure compliance with legislation such as General Data Protection Regulation (GDPR) and the Data Protection Act (DPA). This means that protecting information is essential. 

Data management is one of the foundational layers that enables all of this to happen. Data Management is amongst several cross-cutting layers that enables our organisation to operate.  

<div class="figure" style="text-align: right">
<img src="./images/star2.png" alt="Logo from The National Data Strategy" width="50%" />
<p class="caption">(\#fig:unnamed-chunk-1)Logo from The National Data Strategy</p>
</div>

## The Data Quality Project

### Project Background / Problem Statement

Data is the new currency and fundamental to effective, evidence-based decision-making. It underpins everything from major policy decisions to routine operational processing to external appraisal for a variety of analytical reasons. Often, however, our data is of unknown or questionable quality. This presents huge challenges. Poor or unknown quality data weakens evidence, undermines trust, and ultimately leads to poor outcomes. It makes our organisation less efficient and impedes effective decision-making. To make better decisions, we need better quality data. 

Improved data quality is a claimed benefit in many of the portfolio projects. However, currently there is not a harmonised method to assess this. The data quality framework, assessment and associated automated pipeline will address this gap and provide a consistent toolkit to aid in the quality assessment of data held within Companies House. 

Understanding areas of concern in data quality will aid in interventions to improve the overall integrity of the register. For example, understanding the extent of duplicated addresses, will help us to inform development work to reduce these errors, thereby improving the integrity of the register. Improvements in terms of consistency and duplication will give us more confidence when proactively identifying suspicious activity, meaning we can trust our analysis to be used to inform law enforcement partners and helps to reduce economic crime. 

### Project Objectives 

The main objectives of this project are to deliver the following: 

- A framework to assess the quality of data within Companies House to enable the organisation to deliver against its strategic goals. This will support the work of the Data Strategy. 

- A baseline measure of data quality across our data estate, identifying areas for improvement and informing the course of the Companies House Strategy. Data set prioritisation will need to be undertaken. 

- An automated data and analytical pipeline that identifies and monitors our data quality levels. A toolkit of methods to actively monitor the impact of projects and business improvement work on overall data quality aligned to the data quality dimensions1 

- An assessment of organisational maturity levels in terms of skills and roles and responsibilities, including development of "training" around the trade-off of quality dimensions to allow effective implementation and take-up. 



