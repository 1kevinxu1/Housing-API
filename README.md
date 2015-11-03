# Housing API


### Usage

The API base url is:

    https://still-headland-6148.herokuapp.com/listings/

There is (currently) only one route, which is:

    GET /listings

This route returns the search result of listings that fit a set of given parameters
in geoJSON form. The parameters are all optional, and are as follows:

* min_price
* max_price
* min_bed
* max_bed
* min_bath
* max_bath
* page

Results are paginated and there are by 10 entries per page.

Sample usage:

    https://still-headland-6148.herokuapp.com//listings?min_price=100000&max_price=200000&min_bed=2&max_bed=2&max_bath=2&page=4

### Potential improvements

#### For product:

  * Full test coverage—search query parameters, geoJSON output,etc.
  * Implement a caching layer to retrieve data faster
  * Enable and configure CORS with rack-cors gem for more accessible API

#### For growth:

  * Geocode each listing, to make them searchable relative to each other
    - Increases user retention/engagement for customers looking at single listings by suggesting nearby/related homes
    - Imports geocoded nearby entertainment, community centers, and schools data so users can search with higher degree of specificity
  * Track controller hits and parameter frequency for data/analytics
  * Construct "user profiles" by grouping sets of listings that were searched on the same session
