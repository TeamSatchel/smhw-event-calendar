# smhw-event-calendar

#### Considerations

In the last 4 years I have been a pure backend Ruby on Rails developer (only api and JSON API based backend, no views). My javascript is long forgotten or extremely rusty and because of that the result of the challenge is not very promising.
That javascript issue forced me to use a plugin like fullcalendar (https://fullcalendar.io) so I didn't need to know much javascript stuff to render a calendar. Then appeared a problem when rendering appointments. I couldn't make it work and time was gone. 

So I have a working system: can create events and reload them without reload the main page. However I could make it fullcalendar to show them, but they are there. 

## Structure

I decided to use the strategy of slim models and controllers by using query objects and services (commands) when possible. This is a modular paradigm which make easier to write test and reuse code and modules. 

So I decided to use gem 'rectify' (https://github.com/andypike/rectify).

#### Services / Commands

I decided to use a service (command for rectify gem) to create a event: CreateEvent

This service just uses a form (EventForm which does validations) and save the data into an event. 


#### Query object

GetEvents sets up a query so the controller can use it and send it back to the view. We can use parameters to set up which week we need. 


#### Controller

EventController has two methods: index for GET /events and create for POST /events.


##### Index

Index just gets the event of a given week and send them back to the receiver. It supports both formats html and json. Fullcalendar has been set up to read from an url, so index needs to render json data too (app/views/events/index.html.erb line 80)

I am using a decorator so Fullcalendar can use that json data because data in the model is not exactly the same as fullcalendar needs. For example, title is description, and start/end are event_start/event_end

##### Create

Create just takes incoming data and tries to create an event. It supports html, json and javascript requests. However, it's inteded to be used only for javascript requests.

It just tries to create a new event and if the request is JS then just fires up an event so the calendar refreshes itself from the source. 

If it couldn't create a new event it just redirects to index with a notice message or just sends back a json error message. 



 