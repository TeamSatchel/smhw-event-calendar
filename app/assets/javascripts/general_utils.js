$(document).on('turbolinks:load', function(){

  $("button[data-submit='modal-form']").on('click', function(){
    $('.modal-body:visible form').submit()
  })

});