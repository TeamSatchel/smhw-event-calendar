$(document).ready(function() {

  load_sheet();

});

function load_sheet() {
 $.ajax({
    url: '/sheet'
  }).done(function (data) {
    $("#week_sheet_container").html(data);
  }).error(function (xhr, ajaxOptions, thrownError) {
    $("#week_sheet_container").html(xhr.responseText);
  });
}

function remove_all_events() {
  $.ajax({
    url: '/removeall'
  }).done(function (data) {
    load_sheet();
  });
}

