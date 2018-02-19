# Event Calendar

## Candidate notes:
- Rails updated to version '4.2.8' - needed to fix an incompatibility with Active Support on my local machine
- Bootstrap gem added to help with table formating

## To Do:
### Validate the end_date is >= start_date
### Restriction the collection of Events in the index action to the current week
Currently the table will add an extra row even if the event does not fall within the displayed week
### Handle errors gracefully
### Improve the formating of the Event bar on the calendar

## The test:
We ask candidates to undertake a small development exercise for us so they can demonstrate their technical prowess. In this instance, we want you to build a simple Rails application which comprises an events calendar. This application will consist of an /events page which displays a weekly calendar highlighting the current date. Application users must be able to create an event which contains start and end date plus a description.

Furthermore, the created event should instantly show on the calendar along with some indication as to when the event starts and finishes. The image on the /events page provides an example of what we are looking for.

Given this requirement, candidates should create an EventsController with these actions: index, create.
Events should be saved in a backend store without refreshing the page.

![example](app/assets/images/evenst_calendar.png)

Candidates may use any gems/plugins when building your solution. However, we will question candidates on their choices of gems/plugins.

Please commit changes to git often with descriptive messages. These messages and the granularity of commits will be examined.
Candidates should take no longer than 2/3 hours.

A basic project is available in https://github.com/TeamSatchel/smhw­event­calendar

You can fork this project, and then when you have completed the work to your satisfaction, please raise a pull request for our attention.

