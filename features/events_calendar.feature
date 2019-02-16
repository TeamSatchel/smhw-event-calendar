Feature: Show me events calendar
  I as User can see events page which displays a weekly calendar highlighting the current date
  Also I'm able to create an event which contains start and end date plus a description.

  The created event should instantly show on the calendar along with some indication as to when the event starts and finishes.

  Background:
    When User visit the events-calendar page
    Then he one the events-calendar

  Scenario: User can see the events calendar page
    And he see the related calendar

  Scenario: User can create new event
    When he fill_in the form fields with the follow values:
      | title           | description   | signature  |
      | This is a title | 01A Maths     | Mr N Gohil |
    And he click the button "Add event"
    Then he see related event on the weekly calendar:
      | This is a title | 01A Maths     | Mr N Gohil |
