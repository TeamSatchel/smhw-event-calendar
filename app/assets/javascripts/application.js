//= require jquery3
//= require jquery_ujs
// require rails-ujs
//= require activestorage
//= require moment
//= require fullcalendar
//= require calendar
//= require_tree ./application

$( document ).ready(function() {
  $('#calendar').fullCalendar({
    events: '/events.json'
  });
});
