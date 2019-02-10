$(document).ready(function () {
    var dp_format = {dateFormat: 'yy-mm-dd', firstDay: 1}
    $('#event_start_at').datepicker(dp_format);
    $('#event_end_at').datepicker(dp_format);

    $("input:visible").on("keydown", function(e){
        $('.error').addClass('hidden');
    });

    $.ajax({
        type: "GET",
        url: '/events',
        data: $(this).serialize(),
        success: function(response) {
            $.each( response, function( index, event ) {
                build_event(event);
            });
        }
    });

    $("#create-event").on("submit", function(e){
        e.preventDefault();
        $.ajax({
            type: "POST",
            url: '/events',
            data: $(this).serialize(),
            success: function(response) {
                build_event(response);
            },
            error: function(response) {
                $('.error').removeClass('hidden').text(response.responseText);
            }
        });
        $(this).closest('form').find("input[type=text], textarea").val("");
    });

    function build_event(event) {
        if(event.days_before_week_start < 7){
            var cells = '';
            for (var i = 0; i < event.days_before_week_start; i++) {
                cells += '<td></td>';
            }
            cells += "<td colspan='" + event.duration + "'>"
                + "<div class='event' style='background: " + event.colorize + "'</div> <pre>"
                + event.title
                + "</pre></td>";

            for (var i = 0; i < event.days_to_week_end; i++) {
                cells += '<td></td>';
            }
            var content = '<tr>' + cells + '</tr>';

            $('.my-table tr:last').after(content);
        }
    }
});
