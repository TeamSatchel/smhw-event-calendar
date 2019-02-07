$(document).on('ready', function(){
  $('#event-wizard-start').on('click', function(e){
    e.preventDefault();
    $('#begins').removeClass('hidden');
    $(e.target).addClass('hidden');
  })

  $('#begins').on('keypress', function( event ) {
    if ( event.which == 13 ) {
      event.preventDefault();
      if (isNaN(Date.parse(event.target.value))) {
        $(event.target).css('background', 'red');
        $('#errors').append('Invalid date');
      } else {
        $('#ends').removeClass('hidden');
        $('#begins').addClass('hidden');
        $('#summary').append('<strong>Begin: </strong>'+ event.target.value +'<br>');
        $('#errors').empty();
      }
    }
  })

  $('#ends').on('keypress', function( event ) {
    if ( event.which == 13 ) {
      event.preventDefault();
      begin = Date.parse($('#begins input').val());
      end = Date.parse(event.target.value);
      if (isNaN(end)) {
        $(event.target).css('background', 'red');
        $('#errors').append('Invalid date');
      } else if (end < begin) {
        $('#errors').empty();
        $('#errors').append('End date is before begin date');
      } else {
        $('#title').removeClass('hidden');
        $('#ends').addClass('hidden');
        $('#summary').append('<strong>End: </strong>'+ event.target.value +'<br>');
        $('#errors').empty();
      }
    }
  })

  $('#title').on('keypress', function( event ) {
    if ( event.which == 13 ) {
      event.preventDefault();
      $('#description').removeClass('hidden');
      $('#title').addClass('hidden');
      $('#summary').append('<strong>Title: </strong>'+ event.target.value +'<br>');
    }
  })

  $('#description').on('keypress', function( event ) {
    if ( event.which == 13 ) {
      event.preventDefault();
      $('#create').removeClass('hidden');
      $('#description').addClass('hidden');
      $('#summary').append('<strong>Description: </strong>'+ event.target.value +'<br>');
    }
  })
})
