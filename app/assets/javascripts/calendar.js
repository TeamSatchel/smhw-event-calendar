var full_calendar;
full_calendar = function() {
    $('.calendar').each(function(){
        var calendar = $(this);
        calendar.fullCalendar({
            selectable: true,
            selectHelper: true,
            editable: true,
            eventLimit: true,
            events: '/events.json',

            select: function(start, end) {
                $.getScript('/events/new', function() {});

                calendar.fullCalendar('unselect');
            },

            // on the move
            eventDrop: function(event, delta, revertFunc) {
                event_data = {
                    event: {
                        id: event.id,
                        start: event.start ? event.start.format() : null,
                        end: event.end ? event.end.format() : null
                    }
                };
                $.ajax({
                    url: event.update_url,
                    data: event_data,
                    type: 'PATCH'
                });
                event.preventDefault();
            },

            // edit action
            eventClick: function(event, jsEvent, view) {
                $.getScript(event.edit_url, function() {});
            }
        });
    })
};
$(document).on('turbolinks:load', full_calendar);
