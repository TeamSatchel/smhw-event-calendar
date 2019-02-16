$(document).ready(() => {
  $('#calendar').fullCalendar({
    defaultView: 'basicWeek',
    firstDay: 1,
    header: false,
    events: [
      {
        title: 'My Event',
        start: '2010-01-01',
        description: 'This is a cool event'
      }
      // more events here
    ],
    eventRender: function(event, element) {
      element.qtip({
        content: event.description
      });
    }
  })
});
