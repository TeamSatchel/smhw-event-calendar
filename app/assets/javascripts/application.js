//= require jquery
//= require jquery_ujs
// = require popper
// = require bootstrap-sprockets
//
//= require fullcalendar.core
//= require fullcalendar.daygrid
//= require fullcalendar.timegrid
//= require fullcalendar.bootstrap
//= require fullcalendar.interaction
//
//= require_self

$(function() {
  window.calendar = new FullCalendar.Calendar(document.getElementById('calendar'), {
    events: '/events.json',
    plugins: ['interaction', 'timeGrid', 'bootstrap'],
    defaultView: 'timeGridWeek',
    timeZone: 'UTC',
    editable: false,
    header: {
      left: '',
      center: 'title',
    },
    themeSystem: ['bootstrap'],
    eventClick: function(event) { console.log(event.event.id) }
  });
});
