$(document).ready(() => {
  bindEventCalendarForm();
  renderEventCalendar();
});

function bindEventCalendarForm() {
  let form = $('#add_event_form');

  form.bind('ajax:success', function(e, data, status, xhr) {
    createNewEvent({
      start: data.start_date,
      end: data.end_date,
      title: data.description,
    });
  });

  form.bind('ajax:error', function(e, data, status, xhr) {
    alert(data.responseJSON["errors"])
  });
}

function createNewEvent(source) {
  $('#calendar').fullCalendar('addEventSource', [source] )
}

function renderEventCalendar() {
  let calendar    = $('#calendar');
  let data_events = JSON.parse(calendar.attr('data-events'));
  let events      = data_events.map(e => ({
    start: e.start_date,
    end:   e.end_date,
    title: e.description
  }));

  calendar.fullCalendar({
    defaultView: 'basicWeek',
    firstDay: 1,
    header: false,
    events: events
  });
}
