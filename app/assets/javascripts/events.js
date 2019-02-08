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


  $.each($('tbody').data().events, function( index, value ) {
    addEvent(value);
  })
  adjustTable();

  $('form').on('ajax:success', function(e, data){
    addEvent(data);
    eventHeight = $('.event#'+data.id).outerHeight();
    $('tbody td').height(($('tbody td').height() + eventHeight));
    $('#summary').empty();
    $('#create').addClass('hidden');
    $('.event').css({top: -$('tbody td').height()});
    $('#event-wizard-start').removeClass('hidden');
    e.target.reset();
  })
})

function addEvent(event) {
  thisWeekBegin = $('tbody td#'+event.begins);
  thisWeekEnd = $('tbody td#'+event.ends);
  days = (Date.parse(event.ends) - Date.parse(event.begins)) / 86400000
  if (thisWeekBegin.length > 0) {
    if (thisWeekEnd.length > 0) {
      visibilityWidth = $('table').width() / 7 * (days + 1) - 35
      up = thisWeekBegin.position().top;
      left = thisWeekBegin.position().left;
      $('#overlay').append('<div id="'+event.id+'"class="event" style="left:'+left+'px; width:'+visibilityWidth+'px;"><strong>'+event.title+'</strong><br>'+event.description+'</div>')
    }
  }
}

function adjustTable() {
  $('tbody td').css({ height: $('#overlay').height() });
  $('.event').css({ top: -($('#overlay').height() / 2) });
  $('#overlay').height($('#overlay').height() / 2);
}
