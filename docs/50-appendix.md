# Appendix {-}

## Google Maps Geocoding Output

    "results": [
        {
            "address_components": [
                {
                    "long_name": "1600",
                    "short_name": "1600",
                    "types": [
                        "street_number"
                    ]
                },
                {
                    "long_name": "Amphitheatre Parkway",
                    "short_name": "Amphitheatre Pkwy",
                    "types": [
                        "route"
                    ]
                },
                {
                    "long_name": "Mountain View",
                    "short_name": "Mountain View",
                    "types": [
                        "locality",
                        "political"
                    ]
                },
                {
                    "long_name": "Santa Clara County",
                    "short_name": "Santa Clara County",
                    "types": [
                        "administrative_area_level_2",
                        "political"
                    ]
                },
                {
                    "long_name": "California",
                    "short_name": "CA",
                    "types": [
                        "administrative_area_level_1",
                        "political"
                    ]
                },
                {
                    "long_name": "United States",
                    "short_name": "US",
                    "types": [
                        "country",
                        "political"
                    ]
                },
                {
                    "long_name": "94043",
                    "short_name": "94043",
                    "types": [
                        "postal_code"
                    ]
                }
            ],
            "formatted_address": "1600 Amphitheatre Pkwy, Mountain View, CA 94043, USA",
            "geometry": {
                "location": {
                    "lat": 37.4224428,
                    "lng": -122.0842467
                },
                "location_type": "ROOFTOP",
                "viewport": {
                    "northeast": {
                        "lat": 37.4239627802915,
                        "lng": -122.0829089197085
                    },
                    "southwest": {
                        "lat": 37.4212648197085,
                        "lng": -122.0856068802915
                    }
                }
            },
            "place_id": "ChIJeRpOeF67j4AR9ydy_PIzPuM",
            "plus_code": {
                "compound_code": "CWC8+X8 Mountain View, CA",
                "global_code": "849VCWC8+X8"
            },
            "types": [
                "street_address"
            ]
        }
    ],
    "status": "OK"
}

## Results Decode

When the geocoder returns results, it places them within a (JSON) results array. Even if the geocoder returns no results (such as if the address doesn't exist) it still returns an empty results array. (XML responses consist of zero or more &lt;result&gt; elements.)

A typical result contains the following fields:

- The __types[]__ array indicates the type of the returned result. This array contains a set of zero or more tags identifying the type of feature returned in the result. For example, a geocode of "Chicago" returns "locality" which indicates that "Chicago" is a city, and also returns "political" which indicates it is a political entity.

- __formatted_address__ is a string containing the human-readable address of this location.

Often this address is equivalent to the postal address. Note that some countries, such as the United Kingdom, do not allow distribution of true postal addresses due to licensing restrictions.

The formatted address is logically composed of one or more address components. For example, the address "111 8th Avenue, New York, NY" consists of the following components: "111" (the street number), "8th Avenue" (the route), "New York" (the city) and "NY" (the US state).

Do not parse the formatted address programmatically. Instead you should use the individual address components, which the API response includes in addition to the formatted address field.

- __address_components[]__ is an array containing the separate components applicable to this address.

Each address component typically contains the following fields:

- __types[]__ is an array indicating the type of the address component. See the list of supported types.

- __long_name__ is the full text description or name of the address component as returned by the Geocoder.

- __short_name__ is an abbreviated textual name for the address component, if available. For example, an address component for the state of Alaska may have a __long_name__ of "Alaska" and a __short_name__ of "AK" using the 2-letter postal abbreviation.

Note the following facts about the __address_components[]__ array:

- The array of address components may contain more components than the __formatted_address__.

- The array does not necessarily include all the political entities that contain an address, apart from those included in the __formatted_address__. To retrieve all the political entities that contain a specific address, you should use reverse geocoding, passing the latitude/longitude of the address as a parameter to the request.

- The format of the response is not guaranteed to remain the same between requests. In particular, the number of __address_components__ varies based on the address requested and can change over time for the same address. A component can change position in the array. The type of the component can change. A particular component may be missing in a later response.

To handle the array of components, you should parse the response and select appropriate values via expressions.

- __postcode_localities[]__ is an array denoting all the localities contained in a postal code. This is only present when the result is a postal code that contains multiple localities.

- __geometry__ contains the following information:

    - __location__ contains the geocoded latitude, longitude value. For normal address lookups, this field is typically the most important.
    
    - __location_type__ stores additional data about the specified location. The following values are currently supported:

    - __"ROOFTOP"__ indicates that the returned result is a precise geocode for which we have location information accurate down to street address precision.
    
    - __"RANGE_INTERPOLATED"__ indicates that the returned result reflects an approximation (usually on a road) interpolated between two precise points (such as intersections). Interpolated results are generally returned when rooftop geocodes are unavailable for a street address.
    
    - __"GEOMETRIC_CENTER"__ indicates that the returned result is the geometric center of a result such as a polyline (for example, a street) or polygon (region).
    
    - __"APPROXIMATE"__ indicates that the returned result is approximate.
    
- __viewport__ contains the recommended viewport for displaying the returned result, specified as two latitude,longitude values defining the __southwest__ and __northeast__ corner of the viewport bounding box. Generally the viewport is used to frame a result when displaying it to a user.

- __bounds__ (optionally returned) stores the bounding box which can fully contain the returned result. Note that these bounds may not match the recommended viewport. (For example, San Francisco includes the _Farallon islands_, which are technically part of the city, but probably should not be returned in the viewport.)

- __plus_code__ is an encoded location reference, derived from latitude and longitude coordinates, that represents an area: 1/8000th of a degree by 1/8000th of a degree (about 14m x 14m at the equator) or smaller. Plus codes can be used as a replacement for street addresses in places where they do not exist (where buildings are not numbered or streets are not named).

  The plus code is formatted as a global code and a compound code:

    - __global_code__ is a 4 character area code and 6 character or longer local code (849VCWC8+R9).
    
    - __compound_code__ is a 6 character or longer local code with an explicit location (CWC8+R9, Mountain View, CA, USA). Do not programmatically parse this content.
    
    Typically, both the global code and compound code are returned. However, if the result is in a remote location (for example, an ocean or desert) only the global code may be returned.
    
- __partial_match__ indicates that the geocoder did not return an exact match for the original request, though it was able to match part of the requested address. You may wish to examine the original request for misspellings and/or an incomplete address.

  Partial matches most often occur for street addresses that do not exist within the locality you pass in the request. Partial matches may also be returned when a request matches two or more locations in the same locality. For example, "Hillpar St, Bristol, UK" will return a partial match for both Henry Street and Henrietta Street. Note that if a request includes a misspelled address component, the geocoding service may suggest an alternative address. Suggestions triggered in this way will also be marked as a partial match.

- __place_id__ is a unique identifier that can be used with other Google APIs. For example, you can use the __place_id__ in a Places API request to get details of a local business, such as phone number, opening hours, user reviews, and more. See the place ID overview.

## Address types and address component types

The __types[]__ array in the result indicates the _address type_. Examples of address types include a street address, a country, or a political entity. There is also a __types[]__ array in the __address_components[]__, indicating the type of each part of the address. Examples include street number or country. (Below is a full list of types.) Addresses may have multiple types. The types may be considered 'tags'. For example, many cities are tagged with the __political__ and the __locality__ type.

The following types are supported and returned by the geocoder in both the address type and address component type arrays:

- __street_address__ indicates a precise street address.

- __route__ indicates a named route (such as "US 101").

- __intersection__ indicates a major intersection, usually of two major roads.

- __political__ indicates a political entity. Usually, this type indicates a polygon of some civil administration.

- __country__ indicates the national political entity, and is typically the highest order type returned by the Geocoder.

- __administrative_area_level_1__ indicates a first-order civil entity below the country level. Within the United States, these administrative levels are states. Not all nations exhibit these administrative levels. In most cases, administrative_area_level_1 short names will closely match ISO 3166-2 subdivisions and other widely circulated lists; however this is not guaranteed as our geocoding results are based on a variety of signals and location data.

- __administrative_area_level_2__ indicates a second-order civil entity below the country level. Within the United States, these administrative levels are counties. Not all nations exhibit these administrative levels.

- __administrative_area_level_3__ indicates a third-order civil entity below the country level. This type indicates a minor civil division. Not all nations exhibit these administrative levels.

- __administrative_area_level_4__ indicates a fourth-order civil entity below the country level. This type indicates a minor civil division. Not all nations exhibit these administrative levels.

- __administrative_area_level_5__ indicates a fifth-order civil entity below the country level. This type indicates a minor civil division. Not all nations exhibit these administrative levels.

- __administrative_area_level_6__ indicates a sixth-order civil entity below the country level. This type indicates a minor civil division. Not all nations exhibit these administrative levels.

- __administrative_area_level_7__ indicates a seventh-order civil entity below the country level. This type indicates a minor civil division. Not all nations exhibit these administrative levels.

- __colloquial_area__ indicates a commonly-used alternative name for the entity.

- __locality__ indicates an incorporated city or town political entity.

- __sublocality__ indicates a first-order civil entity below a locality. For some locations may receive one of the additional types: sublocality_level_1 to sublocality_level_5. Each sublocality level is a civil entity. Larger numbers indicate a smaller geographic area.

- __neighborhood__ indicates a named neighborhood

- __premise__ indicates a named location, usually a building or collection of buildings with a common name

- __subpremise__ indicates a first-order entity below a named location, usually a singular building within a collection of buildings with a common name

- __plus_code__ indicates an encoded location reference, derived from latitude and longitude. Plus codes can be used as a replacement for street addresses in places where they do not exist (where buildings are not numbered or streets are not named). See https://plus.codes for details.

- __postal_code__ indicates a postal code as used to address postal mail within the country.

- __natural_feature__ indicates a prominent natural feature.

- __airport__ indicates an airport.

- __park__ indicates a named park.

- __point_of_interest__ indicates a named point of interest. Typically, these "POI"s are prominent local entities that don't easily fit in another category, such as "Empire State Building" or "Eiffel Tower".

An empty list of types indicates there are no known types for the particular address component, for example, Lieu-dit in France.

In addition to the above, address components may include the types listed here. This list is not exhaustive, and is subject to change.

- __floor__ indicates the floor of a building address.

- __establishment__ typically indicates a place that has not yet been categorized.

- __landmark__ indicates a nearby place that is used as a reference, to aid navigation.

- __point_of_interest__ indicates a named point of interest.

- __parking__ indicates a parking lot or parking structure.

- __post_box__ indicates a specific postal box.

- __postal_town__ indicates a grouping of geographic areas, such as locality and sublocality, used
for mailing addresses in some countries.

- __room__ indicates the room of a building address.

- __street_number__ indicates the precise street number.

- __bus_station__, __train_station__ and __transit_station__ indicate the location of a bus, train or public transit stop.

Note: The Geocoding API isn't guaranteed to return any particular component for an address within our data set. What may be thought of as the city, such as Brooklyn, may not show up as locality, but rather as another component - in this case, sublocality_level_1. What specific components are returned is subject to change without notice. Design your code to be flexible if you are attempting to extract address components from the response.
