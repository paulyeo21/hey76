# [hey76](http://hey76.herokuapp.com/)

## Summary
hey76 is a media aggregator on NBA draft candidates built on Ruby on Rails. The primary frontend libraries used in this project are Twitter Typeahead and React.js. The data concerning the draft candidates come from three sources: Bing Search, Twitter, and Instagram. Get started by navigating to http://hey76.herokuapp.com/ and typing in the name of a draft candidate. Once you search for a draft candidate the app will redirect the user to a draft candidate's individual page, where the most recent information on the candidate will appear in chronological order from left to right and top to bottom.

```ruby
draft candidates = ["Ben Simmons", "Brandon Ingram", "Jaylen Brown", "Dragan Bender", "Kris Dunn", "Buddy Hield", "Jamal Murray", "Thon Maker", "Denzel Valentine"] 
```
## Testing
Test Driven Development methodology was used during the development of hey76. The testing framework used is RSpec.

## Content
Bing, Twitter, and Instagram APIs made the content on the draft candidate pages' possible. New content is pulled in an interval to show the most updated content on draft candidates. To make this process efficient specific tactics were used for the separate APIs. Twitter, for instance, was efficient by following the guidelines here: https://dev.twitter.com/rest/public/timelines.

*Instagram has been deprecated from hey76 since their API policy change*

## Deployment
hey76 is running on Heroku.
