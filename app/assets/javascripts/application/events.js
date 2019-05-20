$(document).on('turbolinks:load', function(){

  $('#weekly-calendar').each(function(){
    $(this).fullCalendar('delete');
    $(this).html('');

    $(this).fullCalendar({
      defaultView: 'basicWeek',
      firstDay: 1,
      events: '/events.json'
    });
  })

});