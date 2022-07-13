# Glasgow Address Matching

## Introduction and Purpose

As part of Companies House Data Strategy, Data Governance and Data Quality is being reviewed. From this, one of the issues identified with Companies House data, is that around 1% of companies do not supply an accurate postcode, or do not provide a postcode at all. 

The current legislation is that Companies have to provide a physical address, however it is not a legal requirement to provide a postcode. 

Companies House also states the below regarding the information available for public use:
“We carry out basic checks on documents received to make sure that they have been fully completed and signed, but we do not have the statutory power or capability to verify the accuracy of the information that companies send to us.”

This means some data can be incorrectly input and isn’t verified, leading to a lower data quality, particularly when some fields on the registering form are not mandatory. 
In order to gain further insight on the postcode inaccuracies in Companies House data, a scoring matrix for the quality of address and postcode data given by a company.  Companies address details were compared to the Postcode Address File (PAF) and scores given when the address details met a certain criteria.

## Scores used 


Table: (\#tab:unnamed-chunk-1)Postcode Scoring Matrix | Version 1

| Score|Definition                                                 |
|-----:|:----------------------------------------------------------|
|     0|No postcode given                                          |
|     1|Postcode given but doesn’t exist in PAF                    |
|     2|Partial postcode given                                     |
|     3|Postcode matches PAF but given in the incorrect field      |
|     4|Full correct postcode given, address doesn't match PAF     |
|     5|Full correct postcode given, address partially matches PAF |
|     6|Address and postcode details match PAF                     |

## Data  

### Companies House Data

The data from Companies House was from the Companies House Free Company Data Product containing basic details of live companies on the register.

This is saved on the Companies House website. The file used for this data set was named ‘BasicCompanyDataAsOneFile-2022-03-01.zip (415Mb)’ and is publicly available at:

http://download.companieshouse.gov.uk/en_output.html

### Postcode Address File 

The PAF is a database containing all known postcodes in the UK, containing the Royal Mail postal addressed. This was downloaded from MongoDB.

The data used in this analysis containing the Glasgow addresses is saved in the below Companies House sharepoint page (access may be restricted to DAR).

https://companieshouse.sharepoint.com/sites/team-aci/Shared%20Documents/Forms/AllItems.aspx?id=%2Fsites%2Fteam%2Daci%2FShared%20Documents%2FData%20Quality%2FPostcode%20Files%2FGLASGOW&p=true

## Software

The Software/programs used for analysis were Microsoft Excel and Microsoft Power BI.

## Caveats and Limitations

This data was the current position of Companies House and the PAF on 11/03/2022 therefore any subsequent updates in the Companies House data or Postcode Address File will not be reflected in this analysis.  

The filters used within the data were:

- Postcodes beginning with G1 - G7
- 'Glasgow’ filled in the address line 2
- 'Glasgow’ in the post town.

Not all address data was complete so the filters were applied to fit one or more of the above criteria.

## Method

Import the data files onto Power BI (desktop).

### Cleaning the data

1.	Open the PAF and highlight the ‘postcode.stripped’ column. Replace the spaces with nothing to remove any whitespace.

2.	Open the CH data file and highlight the ‘RegAddress.PostCode’ column. Replace the spaces with nothing to remove any whitespace.

### Separating the Glasgow data

1. Open the Companies House Data in the Query editor

2. Add a conditional column and insert the below conditions to populate the condition with the phrase “GLASGOW”, else “Other”.

    - ‘RegAddress.PostCode’ beings with ‘G1’,’G2’,’G3’,’G4’,’G5’,’G6’,’G7’ OR 
    - RegAddress.AddressLine1, RegAddress. AddressLine2, RegAddress.PostTown, RegAddress.County contains ‘Glasgow’. 
    
3. Filter any remaining rows out (in this data, there were a few locations on ‘Glasgow Road’ with a different postcode that were not filtered out using the above conditions and some postcodes beginning with be such as B80 which are not in the Glasgow PAF).
4. Use a filter to only select the values in this column that say ‘Glasgow’. 
5. Close and apply the query. 


## Scoring the data

### Score 0 - No Postcode Given

1.	Add a new column on the CH File. This can be done in the query editor, or ‘Data’ view. For this report, the column was added in the ‘Data’ view.
2.	Input the formula No Postcode = if('BasicCompanyDataAsOneFile-2022-03-01'[RegAddress.PostCode]="",0,1)
3.	into the new column. It will return a 0 for the postcodes in the postcode field that are blank, and a 1 for the rows in the postcode field which contain a value. 
4.	Go to the reports tab and into the ‘Score 0’ sheet. 
5.	Click onto a visualisation to insert. A pie chart was used for the Glasgow file as there were only two distinct values. The legend and details are the column that contains the “0” or “1”. Values are the count of this field. A table summarizing these values was also added to the sheet.

### Score 1 - Postcode given but doesn’t exist in PAF	

1.	Add a new column on the CH File. This can be done in the query editor, or ‘Data’ view. For this report, the column was added in the ‘Data’ view.
2.	Input the formula PAF Match = CONTAINS('B-2022-03','B-2022-03'[postcode.stripped],'BasicCompanyDataAsOneFile-2022-03-01'[RegAddress.PostCode])
3.	into the new column. It will return a True for the postcodes in the postcode field that match the PAF and a False for the postcodes that do not match the PAF. The column was labelled ‘PAF Match’.
4.	Insert another new column and input the formula Length = LEN('BasicCompanyDataAsOneFile-2022-03-01'[RegAddress.PostCode])
5.	This will count the number of characters in the postcode supplied in the CH file. The column was labelled ‘Postcode Length’. 
6.	Go to the reports tab and into the ‘Score 1’ sheet. 
7.	Click onto a visualisation to insert. A pie chart was used for the Glasgow file as there were only two distinct values. The legend and details are the column that contains the “True” or “False”. Values are the count of this field. 
8.	Go to the filter pane and add a filter for the column ‘Postcode Length’. Tick ‘5’ and ‘6’. This will only bring back the score for the full postcodes given. The blank postcodes have already been scored and the incomplete postcodes are scored separately in the next tab. 


### Score 2 - Partial postcode given	

1.	Go to the reports tab and into the ‘Score 2’ sheet. 
2.	Click onto a visualisation to insert. A pie chart was used for the Glasgow file. The legend and details field is the Postcode Length Column and Values are the Count of the postcode length field. 
3.	Go to the filter pane and add a filter for the column ‘Postcode Length’. Untick ‘0’, ‘5’ and ‘6’. This will bring back the score for the postcodes that were incomplete and were not blank. Ful and blank postcodes have been scored elsewhere. 

### Score 3 - Postcode matches PAF but given in the incorrect field	

1.	Go to the Query Editor (click transform data) and load the Companies House data file.
2.	Insert a conditional column. 
3.	Insert a condition that RegAddress.AddressLine1 contains ‘B1’,’B2’,’B3’,’B4’,’B5’,’B6’,’B7’ 
4.	This formula will bring back the 0 if there isn’t a postcode in the address line 1 field, or ‘Postcode in address line 1’ if the postcode is in this column.
5.	Repeat steps 2-4 for RegAddress.AddressLine2 and RegAddress.PostTown
6.	Filter the ‘PAF Match’ column to ’False’ – the ones which show ‘True’ are scored otherwise.
7.	Check the remaining rows for any data that doesn’t match the conditions. 
8.	Close and apply the query. 
9.	Go to the reports tab and into the ‘Score 3’ sheet. 
10.	Insert a visualisation – a clustered bar chart was used for this data.
11.	The Axis values were the PAF Match column and values were a count of the column with the postcodes contained in address line 1. 
12.	Go to the filter pane and add a filter for the column containing the count of the postcodes in line 1, and untick the ‘0’ option. The visual will now only be looking at postcodes contained in address line 1. 
13.	Repeat steps 11&12 for the postcodes in address line 2 and post town. 
14.	The bar charts now show how many postcodes were in the address lines. 
15.	A second filter can be added on the ‘PAF Match’ column with only ‘False’ ticked to show the postcode values in the postcode column that did not match the PAF. For this report, both ‘True’ and ‘False´ values were kept in the visual. 
16.	Only the values where a full postcode in an address field and ‘False’ in the PAF match field were counted.   
In this data set, there were no full, correct postcodes given in the address fields. 
**NOTE** If a full postcode matching the PAF file was entered into the address line 1 and 2 or post town, these would need filtering out of the Score 1 postcodes, otherwise some postcodes would be scored both 1 and 4. In this data set, none of the postcodes given in the address fields matched the PAF, so this step was left out.

### Score 4 - Full correct postcode given, address doesn't match PAF	

1.	Go to the Query Editor and open the PAF data
2.	Highlight sub_building_name, building_number, thoroughfare.name and thoroughfare.descriptor – NA on Glasgow data columns in that order and merge. The delimiter is a space. 
3.	Once the column has been created, right click the column, click Transform then Trim. This removes spaces from the beginning and end of the text.
4.	Close & Apply the Query.
5.	Open data view and open the Companies House data file
6.	Add a new column and type in the formula Address Match = CONTAINS('B-2022-03','B-2022-03'[Merged],'BasicCompanyDataAsOneFile-2022-03-01'[Address Line 1])
7.	The companies where address line 1 matches the PAF will come back as ‘True’ and the ones that do not match will be ‘False’
8.	Go to the ‘Score3&5’ report tab and click onto a visualisation to insert.
9.	The Details is the column that contains the ‘True’ or ‘False’ that was just created and the values are a count of this column.  
10.	Go to the Filter column and add a Filter for the ‘PAF Match’ column and untick ‘False’. 
11.	The values in this report that are ‘True’ score 5, and those that are ‘False’ score 3. 

### Score 5 - Full correct postcode given, address partially matches PAF	

See Glasgow instructions

### Score 6 - Address and postcode details match PAF	

These were scored while scoring postcodes with a ‘4’. Any that did not score 4, were given the score of 5. These were The same conditions in the address line details, but with the PAF Match column filtered to those that were ‘True’ and matched the postcode field in Companies House Data.

## Power BI Report Link 

## Power BI Dashboard Link

## Recommendations

1. Define what a good address would look like in Companies House data. One of the issues with current data is that some address details are not in the appropriate field, such as the town being input into ‘Address Line 2’ column. 
2. If the postcode field in CH data is blank, consider augmenting data by adding a new column to lookup the company address to bring back a postcode that exists in the PAF. Currently CH cannot correct any submitted data such as postcodes but a reference column for a matched address could be added, as outlined in Corporate Transparency and Register Reform White Paper (publishing.service.gov.uk), “If an individual fails to verify, the public register will be annotated to show this. This will enable anyone viewing the register to make their own assessment of the integrity and risk profile of those they are researching”. Could this be extended to full address details to standardise?
3. Conduct further analysis on the correlation between a Company not supplying a postcode, or not supplying a correct address (one that doesn’t match the PAF) and filing accounts and confirmation statements on time. Preliminary analysis has been completed on this and in the future, the quality of addresses submitted could be used as an indicator for companies that are fraudulent, or would not file accounts and confirmation statements on time. The analysis already completed can be found in the following BI Dashboard: https://app.powerbi.com/groups/me/dashboards/2921b718-7552-40f2-b759-6ae77120bad5?ctid=e6acfe5e-7f2a-455a-9d85-ecf93371f601&pbi_source=linkShare
4. Utilise other software for analysis. Currently, the PAF is split into sections (Glasgow and Glasgow in this example), so the Companies House data requires filtering to find addresses in those cities, however, not all postcodes with the filters applied are in the correct cities. For example postcodes exist in ‘B7’ but ‘B74’ is not in the PAF as a Glasgow postcodes. Addresses are also input into several different fields, or customers do not state the city, but smaller towns within the city as the main post town. This makes it unfeasible to filter the CH accurately.  
