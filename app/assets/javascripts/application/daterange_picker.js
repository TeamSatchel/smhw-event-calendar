$(document).on('turbolinks:load', function() {
  $(document).on('shown.bs.modal', '#new_event', function () {
    $('.date-range-picker').daterangepicker({
      timePicker: true,
      timePickerIncrement: 30,
      alwaysShowCalendars: true,
      parentEl: '#new_event'
    }, function (start, end, label) {
      $('#event_start_at').val(start.format('YYYY-MM-DD HH:mm'));
      $('#event_end_at').val(end.format('YYYY-MM-DD HH:mm'));
    });
  });
});

