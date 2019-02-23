'use strict';

$(document).ready(function($) {

  $('#calendar').fullCalendar({
    defaultView: 'basicWeek',
    firstDay: 1,
    allDayDefault: true,
    eventSources: [
      {
        url: '/events.json',
        color: 'yellow',
        textColor: 'black'
      }
    ],
    eventRender: function(event, element) {
      if (!!event.subject)
        element.find('.fc-content').append('<br><span><strong>' + event.subject + '</strong></span>');
      if (!!event.description)
        element.find('.fc-content').append('<br><span>' + event.description + '</span>');
    }
  });

});
