$(document).on('turbolinks:load', function() {
  $(document).on('shown.bs.modal', '#new_event', function () {
    $('.date-range-picker').each(function () {
      $(this).daterangepicker({
        timePicker: true,
        timePickerIncrement: 30,
        alwaysShowCalendars: true,
        parentEl: '#new_event'
      }, function (start, end, label) {
        $('.start_at_hidden').val(start.format('YYYY-MM-DD HH:mm'));
        $('.end_at_hidden').val(end.format('YYYY-MM-DD HH:mm'));
      });
    })
  });
});

