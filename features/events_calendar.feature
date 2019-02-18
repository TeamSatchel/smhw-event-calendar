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

  Scenario: User can't create a invalid event
    When he fill_in the form fields with the follow values:
      | start_date           | end_date | title  | description | signature |
      |                      |          |        |             |           |
    And he click the button "Add event"
    Then he see the alert message with follow message:
      | Start date can't be blank | End date can't be blank | Description can't be blank |

  Scenario: User can create event with start_date boundary value
    When he fill_in the form fields with the follow values:
      | title  | description     | signature  |
      | Event  | boundary values | Mr N Gohil |
    And fill_in "start_date" with boundary value
    And he click the button "Add event"
    Then he see related event on the weekly calendar:
      | Event | boundary values | Mr N Gohil |
