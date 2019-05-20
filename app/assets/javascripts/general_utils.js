$(document).on('click', "button[data-submit='modal-form']", function(){
  $('.modal-body:visible form').submit()
})

$(document).on('turbolinks:load', function(){

});