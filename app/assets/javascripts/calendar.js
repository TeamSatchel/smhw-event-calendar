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
          end = moment(end).subtract(1, 'days'); //Because fullcalendar takes 1+ day in the date
          
          var start_date = moment(start).format('YYYY-MM-DD HH:mm');
          var end_date = moment(end).format('YYYY-MM-DD HH:mm');
          
          //Initialize date selector
          moment(start).isSame(end) ? $('#event_date_range').val(start_date) : $('#event_date_range').val(start_date + ' to ' + end_date);

          //Add flatpickr functionality
          $('#event_date_range').flatpickr({
            mode: 'range',
          });
          
          $('#event_start_time').flatpickr({
            noCalendar: true,
            enableTime: true,
            time_24hr: true,
            dateFormat: "H:i",
          });
          
          $('#event_end_time').flatpickr({
            noCalendar: true,
            enableTime: true,
            time_24hr: true,
            dateFormat: "H:i",
          });
          
          //Get dates and times correctly
          $('.button').click(function() {
            
            var start_time = $('#event_start_time').val()!=null ? ' ' + $('#event_start_time').val() : '';
            var dates = $('#event_date_range').val().split(' to ');
            var end_time = $('#event_end_time').val()!="" ? ' ' + $('#event_end_time').val() : '';
            
            if (end_time == "" && dates[1] !== undefined)
              dates[1] = moment(dates[1], "YYYY-MM-DD").add(1, 'days').format('YYYY-MM-DD');

            $('#event_start_date').val(dates[0] + start_time);
            dates[1] !== undefined ? $('#event_end_date').val(dates[1] + end_time) : $('#event_end_date').val(dates[0] + end_time);
          });
          //Making sure to remove modal DOM when it's closed
          $('.close-modal').click(function() {
            $('.modal').remove();
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