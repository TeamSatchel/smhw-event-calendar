//Core calendar functionality
//= require fullcalendar

//For selecting date and time
//= require flatpickr

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
          //Add flatpickr functionality
          $('#event_date_range').flatpickr({
            mode: 'range'
          });
        });
      },
      events: '/events.json',
      displayEventEnd: true, //Display end_date on event
      eventLimit: true, //Shows + sign if there are many events on a day
      eventRender: function(event, element) {
        element.find(".fc-event-title").remove();
        element.find(".fc-event-time").remove();
        if(event.description) {
          var new_description =
            '<br/><div class="fc-title">' + event.description + '</div>';
          element.append(new_description);
        }
      },
    });
};

//Listen for page to load and then creates calendar
$(document).on('turbolinks:load', create_calendar);