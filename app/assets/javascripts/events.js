//= require ajax_request
//= require moment
//= require bootstrap-datetimepicker
//= require fullcalendar

class EventsHelper {
  static load() {
    EventsHelper.fixWeekStart();
    EventsHelper.initDatePickers();
    EventsHelper.formOnSubmit();
    EventsHelper.loadCalendar();
  }
  
  static fixWeekStart() {
    moment.updateLocale('en', {
      week: { dow: 1 }
    });
  }
  
  static initDatePickers() {
    $('.js-datepicker').datetimepicker({
      format: 'll',
      date: moment().format('YYYY-MM-DD')
    });
  }
  
  static formOnSubmit() {
    $('.js-form').submit((event) => {
      event.preventDefault();
      
      let $form = $(event.target);
      let requestOptions = {
        method: $form.attr('method'),
        data: $form.serialize(),
        successCallback: EventsHelper.successCallback
      };
      
      AJAXRequest.send($form.attr('action'), requestOptions)
    })
  }
  
  static successCallback(response) {
    $('.js-calendar').fullCalendar('refetchEvents');
    $('.js-form [name="event[title]"]').val('');
    $('.js-form [name~="event[description]"]').val('');
    
    AJAXRequest.defaultSuccessCallback(response);
  }
  
  static loadCalendar() {
    $('.js-calendar').fullCalendar({
      defaultView: 'basicWeek',
      firstDay: 1,
      titleFormat: 'D MMMM, YYYY',
      columnHeaderFormat: 'ddd, MMMM D',
      height: 300,
      events: `${location.origin}?format=json`,
      eventRender: EventsHelper.eventRenderer
    })
  }
  
  static eventRenderer(event, element) {
    element.find('.fc-content').append(EventsHelper.fcDescription(event));
  }
  
  static fcDescription(event) {
    return `<p class='fc-description'>${event.description}</p>`
  }
}

$(() => { EventsHelper.load(); });
