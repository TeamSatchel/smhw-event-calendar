//= require fullcalendar

// Creates a new calendar based on fullcalendar
var create_calendar = function() {
  var calendar = $('#calendar');
    calendar.fullCalendar({
      defaultView: 'basicWeek', //Weekly view without all_day zone, for all_day put agendaWeek
      firstDay: 1, //Starts on Monday
      columnHeaderHtml: function(mom) {
          return '<p>' + mom.format('dddd') + '</p> <p>' + mom.format('Do MMM') + '</p>';
      },
      selectable: true, //Makes calendar selectable, so we can use "select:" for adding functionality
      select: function(start, end) {
        //Calls script for creating new event
        $.getScript('/events/new', function() {
          console.log('callbak works!');
        });
      }
    });
};

//Listen for page to load and then creates calendar
$(document).on('turbolinks:load', create_calendar);