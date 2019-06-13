//= require jquery_ujs
//= require rails-ujs
//= require jquery
//= require bootstrap-sprockets
//= require activestorage
//= require moment
//= require bootstrap-datepicker
//= require fullcalendar
//= require calendar
//= require_tree ./application

$( document ).ready(function() {
  $('#calendar').fullCalendar({
    header: {
        left: 'prev, next, today',
        center: 'title',
        right: 'month,basicWeek,basicDay'
    },
    events: '/events.json',
    defaultView: 'basicWeek'
  });
});
