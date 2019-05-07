document.addEventListener('turbolinks:load', function() {
  $('#calendar').fullCalendar({
    defaultView: 'basicWeek',
    height: 650,
    events: '/events.json',
  });
})
