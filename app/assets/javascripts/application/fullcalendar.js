$(document).on('turbolinks:load', function () {
  $('#calendar').fullCalendar({
    plugins: ['dayGrid'],
    header: {
        left: '',
        center: 'title'
      },
    events: '/events.json',
  });
});