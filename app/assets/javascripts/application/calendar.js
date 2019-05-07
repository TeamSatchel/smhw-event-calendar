document.addEventListener('turbolinks:load', function() {
  $('#calendar').fullCalendar({
    defaultView: 'basicWeek',
    height: 650,
    events: '/events.json',
    firstDay: 1,
    selectable: true,
    select: function(start, end) {
      $.getScript('/events/new', function() {
        end = moment(end).subtract(1, 'days');

        $('#event_date_range').daterangepicker({
          startDate: moment(start),
          endDate: moment(end),
          locale: {
            format: "YYYY/MM/DD"
          }
        });
      });
    }
  });
});
