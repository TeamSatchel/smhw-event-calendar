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
      title: data.title,
      desc: data.description,
      signature: data.signature,
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
    start:     e.start_date,
    end:       e.end_date,
    title:     e.title,
    desc:      e.description,
    signature: e.signature
  }));

  calendar.fullCalendar({
    defaultView: 'basicWeek',
    firstDay: 1,
    header: false,
    events: events,
    height: 500,
    columnFormat: "dddd\nDo MMM",
    eventColor: 'orange',
    viewRender: function( view, element ) {
      element.find('th.fc-day-header').each(function () {
        let date = moment($(this).data('date'));
        $(this).html('<strong>' + date.format('dddd') + '</strong><br><span>' + date.format('Do MMM') + '</span>');
      })
    },
    eventAfterRender: function (event, element, view) {
      $(element.find('.fc-title')).html(event.title + '<br><strong>' + event.desc + '</strong><br>' + event.signature);
    }
  });
}
