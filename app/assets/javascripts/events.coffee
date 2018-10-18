# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

  $ ->
    $('#calendar').fullCalendar(
      events: '/events.json',
      defaultView: 'basicWeek',
      titleFormat: 'MMMM D YYYY',
      columnHeaderFormat: 'dddd\nMMM D',
      contentHeight: 500,
      eventTextColor: 'black',
      eventBorderColor: '#c5882e',
      eventBackgroundColor: '#f4a439',
    );
