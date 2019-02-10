$(document).ready(function () {
    var dp_format = {dateFormat: 'yy-mm-dd', firstDay: 1}
    $('#event_start_at').datepicker(dp_format);
    $('#event_end_at').datepicker(dp_format);

    $("#create-event").on("submit", function(e){
        e.preventDefault();
        $.ajax({
            type: "POST",
            url: '/events',
            data: $(this).serialize(),
            success: function(response) {
                console.log(response);
                console.log(response.days_before_week_start);
                if(response.days_before_week_start < 7){
                    var cells = '';
                    for (var i = 0; i < response.days_before_week_start; i++) {
                        cells += '<td></td>';
                    }
                    cells += "<td colspan='" + response.duration + "'>"
                        + "<div class='event' style='background: " + response.colorize + "'</div> <pre>"
                        + response.title
                        + "</pre></td>";

                    for (var i = 0; i < response.days_to_week_end; i++) {
                        cells += '<td></td>';
                    }
                    var content = '<tr>' + cells + '</tr>';

                    $('.my-table tr:last').after(content);
                }
            }
        });
        $(this).closest('form').find("input[type=text], textarea").val("");
    });
});
