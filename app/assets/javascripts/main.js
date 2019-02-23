'use strict';

$(document).ready(function($) {

  $('#calendar').fullCalendar({
    defaultView: 'basicWeek',
    firstDay: 1,
    eventSources: [
      {
        url: '/events.json',
        color: 'yellow',
        textColor: 'black'
      }
    ]
  });

});
