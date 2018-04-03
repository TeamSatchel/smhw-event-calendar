# smhw-event-calendar

## Decisions
#### Upgrade to Rails 5.1
This decision was made as the version of rails originally bundled was over a year old. Rails 5.1 also comes out of the box with support for webpacker and JS frameworks Angular/React/Vue, which can be initialised from the command line.
#### Bundle Rubocop
Using rubocop ensures consistent code styling and convention throughout the development process.
#### Replace unit test with Rspec
Rspec is readable and easy to navigate.
#### Single page application
As the specification read, `the created event should instantly show on the calendar`, I decided to build a single page application where the Rails engine is used to serve Json to a Javascript front end. This allows a very clear separation of concerns, meaning that the backend can even be exposed and consumed by any number of different UIs/front ends. It also allows stricter testing of the individual concerns.
#### Add React
Having not done a great deal of front end development, particularly with single page applications, I thought this would be a good opportunity to get to grips with one of the more increasingly used ones in React. 

## Future Improvements
#### Add testing for JS/React components
Adding testing for the js would ensure solid code and would be useful when adding additional features, such as the create event button. This could be done with yarn test or jasmine.

## Check it out
* Clone the repo: `git clone git@github.com:philbrockwell1984/smhw-event-calendar.git`
* Install the gems: `bundle`
* Install the JS dependencies: `yarn install`
* Prepare the database: `bundle exec rails db:create db:migrate db:seed`

* Run the tests: `rspec`
* Run the server: `foreman start -f Procfile.dev -p 3000`
