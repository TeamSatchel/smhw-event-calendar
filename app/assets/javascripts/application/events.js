var initialise_calendar = function(calendar){
  $(calendar).fullCalendar('destroy');
  $(calendar).html('');

  $(calendar).fullCalendar({
    defaultView: 'basicWeek',
    firstDay: 1,
    events: '/events.json',
    height: 'auto',
    viewRender: function (view, element) {
      element.find('th.fc-day-header.fc-widget-header').each(function () {
        var date = moment($(this).data('date'))
        $(this).html('<span>' + date.format('dddd') + '</span><br><span class="day-subtitle">' + date.format('Do MMM') + '</span>')
      })
    },
    eventRender: function(event, element) {
      element.find('.fc-time').remove();
      element.find('.fc-title').append("<br/><b class='event-description'>" + event.description + '<b>').append("<br/><span class'event-user'>" + event.user_name + '<span>');
      element.find('.fc-title')
    }
  });
}

$(document).on('turbolinks:load', function(){

  $('#weekly-calendar').each(function(){
    initialise_calendar(this);
  })

});