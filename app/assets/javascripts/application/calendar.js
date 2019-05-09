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
          locale: { format: 'DD/MM/YYYY' }
        });

        $('#new_event').on('submit', function() {
          var startDate = moment($('#event_date_range').data('daterangepicker').startDate).format('YYYY-MM-DD');
          var endDate = moment($('#event_date_range').data('daterangepicker').endDate).add(1, 'day').format('YYYY-MM-DD');
          $('#event_start_date').val(startDate);
          $('#event_end_date').val(endDate);
        });
      });
    }
  });
});
