// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require moment
//= require bootstrap-datetimepicker
//= require_tree .

$( document ).ready(function() {

  $("#new_event").on("submit", function(event){
    $.ajax({
      type: "POST",
      url: this.action,
      data: $(this).serialize(),
      success: function(response) {
        $('#messages').addClass("bg-success")
        $('#messages').text(response.notice)
      },
      error: function(response){
        $('#messages').addClass("bg-danger")
        $('#messages').text(response.responseText)
      }
    });
    event.preventDefault();
  });


  $(function () {
    $('#datetimepicker1').datetimepicker({
      defaultDate: new Date(),
      format: 'DD-MM-YYYY'
    });
    $('#datetimepicker2').datetimepicker({
      defaultDate: new Date(),
      format: 'DD-MM-YYYY'
    });
  });

});
