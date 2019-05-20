var initialise_calendar = function(calendar){
  $(calendar).fullCalendar('destroy');
  $(calendar).html('');

  $(calendar).fullCalendar({
    defaultView: 'basicWeek',
    firstDay: 1,
    events: '/events.json'
  });
}

$(document).on('turbolinks:load', function(){

  $('#weekly-calendar').each(function(){
    initialise_calendar(this);
  })

});