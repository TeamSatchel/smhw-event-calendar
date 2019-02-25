// calender_init
var calendar_init = function calendar_init() {
    $('#calendar').each(function () {
        var calendar = $(this);
        calendar.fullCalendar({
            header: {
                left: 'prev,next today',
                center: 'title',
                right: 'month,agendaWeek,agendaDay'
            },
            defaultView: 'agendaWeek',
            // select multiple days and have callback event when it occurs
            selectable: true,
            //make changes to the calendar
            editable: true,
            // limit events displayed if there are too many on one day
            eventLimit: true,
            displayEventTime: false,
            events: '/events.json',


            // select callback which recieves start/end date.
            // when user clicks and drags the date a modal will appear to create
            // used a date range picker
            // the jquery getscript will trigger the events new.js.erb file
            select: function select(start, end) {
                $.getScript('/events/new', function () {
                    $('#event_date_range').val(moment(start).format("MM/DD/YYYY HH:mm") + ' - ' + moment(end).format("MM/DD/YYYY HH:mm"));
                    date_range_picker();
                    $('.start_hidden').val(moment(start).format('YYYY-MM-DD HH:mm'));
                    $('.end_hidden').val(moment(end).format('YYYY-MM-DD HH:mm'));
                });
                calendar.fullCalendar('unselect');
            },


            eventDrop: function eventDrop(event) {
                // event_data contains event params we are passing as PATCH to update
                event_data = {
                    event: {
                        id: event.id,
                        start_date: event.start.format(),
                        end_date: event.end.format()
                    }
                };
                $.ajax({
                    // update_url set in _events.json.jbuilder
                    url: event.update_url,
                    data: event_data,
                    type: 'PATCH'
                });
            },
            // display the event description
            eventRender: function(event, element) {
                if (event.description)
                    element.find('.fc-content').append('<br><div class="description">' + event.description + '</div>');
            },
            //click on event to call edit.js.erb
            eventClick: function eventClick(event) {
                $.getScript(event.edit_url, function () {
                    $('#event_date_range').val(moment(event.start).format("MM/DD/YYYY HH:mm") + ' - ' + moment(event.end).format("MM/DD/YYYY HH:mm"));
                    date_range_picker();
                    $('.start_hidden').val(moment(event.start).format('YYYY-MM-DD HH:mm'));
                    $('.end_hidden').val(moment(event.end).format('YYYY-MM-DD HH:mm'));
                });
            }
        });
    });
};

$(document).ready(calendar_init);