$(document).ready(() => {
  bindEventCalendarForm();
  renderEventCalendar();
});

function bindEventCalendarForm() {
  let form = $('#add_event_form');

  form.bind('ajax:success', function(e, data, status, xhr) {
    createNewEvent({
      start: data.start_date,
      end: data.end_date + 'T23:59:59',
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
  $('#description').val('')
}

function renderEventCalendar() {
  let calendar    = $('#calendar');
  let data_events = JSON.parse(calendar.attr('data-events'));
  let events      = data_events.map(e => ({
    start:     e.start_date,
    end:       e.end_date + 'T23:59:59',
    title:     e.title,
    desc:      e.description,
    signature: e.signature
  }));

  calendar.fullCalendar({
    defaultView: 'basicWeek',
    firstDay: 1,
    header: false,
    events: events,
    displayEventTime : false,
    columnFormat: "dddd\nDo MMM",
    eventColor: 'orange',
    viewRender: customViewRender,
    eventAfterRender: customAfterRender
  });
}

function customViewRender( view, element ) {
  element.find('th.fc-day-header').each(function () {
    let date = moment($(this).data('date'));
    $(this).html('<strong>' + date.format('dddd') + '</strong><br><span>' + date.format('Do MMM') + '</span>');
  });
}

function customAfterRender(event, element, view) {
  $(element.find('.fc-title')).html(event.title + '<br><strong>' + event.desc + '</strong><br>' + event.signature);
}
