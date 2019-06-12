function eventCalendar() {
  return $('#calendar').fullCalendar({ });
};
function clearCalendar() {
  $('#calendar').fullCalendar('delete');
  $('#calendar').html('');
};

$(document).on('turbolinks:load', function(){
  eventCalendar();
});
$(document).on('turbolinks:before-cache', clearCalendar);
