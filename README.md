# [hey76](http://hey76.herokuapp.com/)

## Summary
hey76 is a social media aggregator for NBA draft candidates built on Ruby on Rails. The frontend libraries used in this project are twitter typeahead, twitter bootstrap, and masonry. The data concerning the draft candidates come from three sources: Bing Search, Twitter, and Instagram. Get started by navigating to http://hey76.herokuapp.com/ and typing in the name of a draft candidate.

```ruby
draft candidates = ['Karl-Anthony Towns', 'D'Angelo Russell', 'Jahlil Okafor', 'Kristaps Porziņģis', 'Mario Hezonja', 'Willie Cauley-Stein', 'Emmanuel Mudiay', 'Stanley Johnson', 'Frank Kaminsky', 'Justise Winslow', 'Myles Turner', 'Trey Lyles', 'Devin Booker', 'Cameron Payne', 'Kelly Oubre Jr.', 'Terry Rozier', 'Rashad Vaughn', 'Sam Dekker', 'Jerian Grant', 'Delon Wright', 'Justin Anderson', 'Bobby Portis', 'Rondae Hollis-Jefferson', 'Tyus Jones', 'Jarell Martin', 'Nikola Milutinov', 'Larry Nance, Jr.', 'R. J. Hunter', 'Chris McCullough', 'Kevon Looney', 'Cedi Osman', 'Montrezl Harrell', 'Jordan Mickey', 'Anthony Brown', 'Guillermo Hernangómez', 'Rakeem Christmas', 'Richaun Holmes', 'Darrun Hilliard', 'Juan Pablo Vaulet', 'Josh Richardson', 'Pat Connaughton', 'Olivier Hanlan', 'Joseph Young', 'Andrew Harrison', 'Marcus Thornton', 'Norman Powell', 'Artūras Gudaitis', 'Dakari Johnson', 'Aaron White', 'Marcus Eriksson', 'Tyler Harvey', 'Satnam Singh Bhamara', 'Sir'Dominic Pointer', 'Dani Díez', 'Cady Lalanne', 'Branden Dawson', 'Nikola Radičević', 'J. P. Tokoto', 'Dimitrios Agravanis', 'Luka Mitrović']
```

## Architecture
hey76 is built with draft candidate names and their instagram and twitter handles. The lib/tasks/scheduler.rake file populates the inserts database with the most recent news articles, twitter tweets, and instagram posts. All of that data is presented in a Pinterest-style interface on each draft candidates individual page, when the user searches for his name.

## Models
Draft candidates

```ruby
Draftee(id: integer, name: string, twitter: string, instagram: string, created_at: datetime, updated_at: datetime)
```

Inserts (news, twitter, instagram)
```ruby
Insert(id: integer, content: text, draftee_id: integer, date: datetime, type_of: string, content_id: string, created_at: datetime, updated_at: datetime)
```

## Deployment
hey76 is deployed on Heroku. Heroku provides a scheduler that updates the three data sources referenced above.

## Next Steps
Next steps would be to handle changes in twitter handles and instagram usernames. Currently, everything can be edited manually, but an automated process would be nice. Some of the user interface and design such as the draft candidates' individual pages could be decorated better, for example using their twitter/instagram profile pictures. Another step would be to distinguish users who use the app. This way there is all-around better security. Lastly, masonry supports a infinite scroll feature, but also considering building without masonry or using a better maintained layout library could be useful. 
