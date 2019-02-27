$(document).ready(function() {

  $.fn.datepicker.defaults.format = "yyyy-mm-dd";
  $.fn.datepicker.defaults.autoclose = true;
  $.fn.datepicker.defaults.orientation = 'bottom';

});

function show_event_form() {
  $("#event_form_container").show();
  load_event_form();
}

function create_event() {

  var data_string = $("#new_event").serialize();
  $.ajax({
    type: "POST",
    data: data_string,
    url: $("#new_event").attr('action')
  }).done(function (data) {
    $("#event_form_container").hide();
    load_sheet();
  }).error(function (xhr, ajaxOptions, thrownError) {
    $("#event_form_container").html(xhr.responseText);
  });

}

function load_event_form() {
  $.ajax({
    url: '/create'
  }).done(function (data) {
    $("#event_form_container").html(data);
  }).error(function (xhr, ajaxOptions, thrownError) {
    $("#event_form_container").html(xhr.responseText);
  });
}

function validate_event_form() {
}

