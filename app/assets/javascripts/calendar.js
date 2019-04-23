//= require fullcalendar

// Creates a new calendar based on fullcalendar
var create_calendar = function() {
  var calendar = $('#calendar');
    calendar.fullCalendar({
      defaultView: 'basicWeek', //Weekly view without all_day zone, for all_day put agendaWeek
      firstDay: 1, //Starts on Monday
      columnHeaderHtml: function(mom) {
          return '<p>' + mom.format('dddd') + '</p> <p>' + mom.format('Do MMM') + '</p>';
      }
    });
};
$(document).on('turbolinks:load', create_calendar);