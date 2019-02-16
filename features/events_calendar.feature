Feature: Show me events calendar
  I as User can see events page which displays a weekly calendar highlighting the current date
  Also I'm able to create an event which contains start and end date plus a description.

  The created event should instantly show on the calendar along with some indication as to when the event starts and finishes.

  Background
    Given User

  Scenario: User can see the events calendar page
    When he visit the events-calendar page
    Then he one the events-calendar
    And he see the related calendar
