# Application Programming Interface (API)

API is the acronym for Application Programming Interface, which is a software intermediary that allows two applications to talk to each other. Each time you use an app like Facebook, send an instant message, or check the weather on your phone, you’re using an API.

<div class="figure" style="text-align: center">
<img src="./images/api-request.svg" alt="Figure showing how an API works." width="80%" />
<p class="caption">(\#fig:api-fig)How an API call works</p>
</div>

## What is an API? 

When you use an application on your mobile phone, the application connects to the Internet and sends data to a server. The server then retrieves that data, interprets it, performs the necessary actions and sends it back to your phone. The application then interprets that data and presents you with the information you wanted in a readable way. This is what an API is - all of this happens via API.

To explain this better, let us take a familiar example.

Imagine you’re sitting at a table in a restaurant with a menu of choices to order from. The kitchen is the part of the “system” that will prepare your order. What is missing is the critical link to communicate your order to the kitchen and deliver your food back to your table. That’s where the waiter or API comes in. The waiter is the messenger – or API – that takes your request or order and tells the kitchen – the system – what to do. Then the waiter delivers the response back to you; in this case, it is the food.

## Working with JSON Data in Python

JSON (JavaScript Object Notation) is the language of APIs. JSON is a way to encode data structures that ensures that they are easily readable by machines. JSON is the primary format in which data is passed back and forth to APIs, and most API servers will send their responses in JSON format.

The JSON output received from a typical API looks like it contains Python dictionaries, lists, strings and integers. You can think of JSON as being a combination of these objects represented as strings. Let’s look at a simple example:

<div class="figure" style="text-align: center">
<img src="./images/json.svg" alt="Figure showing JSON structure." width="80%" />
<p class="caption">(\#fig:json-fig)JSON Structure</p>
</div>

Python has a built-in package called json, which can be used to work with JSON data.

## Companies House APIs

Companies House provides an API to access almost all the information it receives. Access is through a free API key (which although free, requires registration), and the output looks similar to the previous example but is a little more detailed. Here's an example:

<div class="figure" style="text-align: center">
<img src="./images/chapi.jpg" alt="Figure showing Companies House API structure." width="80%" />
<p class="caption">(\#fig:chapi)Companies House API Structure</p>
</div>
	
## Data Quality Augmentation

Looking at the company in example \@ref(fig:chapi), we wouldn't know if the supplied address existed or not, given the base information supplied in the API. So we wrap the Companies House API within another API, which examines the supplied address and returns an assessment, as seen in  \@ref(fig:chapi2) below:

<div class="figure" style="text-align: center">
<img src="./images/chapi2.jpg" alt="Result of Data Quality Augmentation on Supplied Address" width="80%" />
<p class="caption">(\#fig:chapi2)Result of Data Quality Augmentation on Supplied Address</p>
</div>

A further API function retrieves customer feedback from the Companies House mongoDB, and provides this information as seen in \@ref(fig:chapi3) below:

<div class="figure" style="text-align: center">
<img src="./images/chapi3.jpg" alt="Result of Data Quality Augmentation on Customer Feedback" width="80%" />
<p class="caption">(\#fig:chapi3)Result of Data Quality Augmentation on Customer Feedback</p>
</div>

Despite appearing to be a good quality company at first glance (the accounts are not overdue, and neither is the confirmation statement), this example has a fictitious address, and 148 comments made about it.

## Data Quality API

