# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

  checkValue = (id) ->
    $(id).val().length > 0

  getEventDataJson = ->
    JSON.stringify({
      title:     $('#event-title').val(),
      starts_at: $('#event-starts-at').val(),
      ends_at:   $('#event-ends-at').val(),
    })

  processNewEvent = (id) ->
    $.ajax(
      url: '/events',
      type: 'POST'
      data: getEventDataJson(),
      contentType: 'application/json; charset=utf-8',
      dataType: 'json',
    ).done(
      ->
        $('#event-title').val('')
        $('#event-starts-at').val('')
        $('#event-ends-at').val('')
        $('#event-starts-at').datepicker('setEndDate', Infinity)
        $('#event-ends-at').datepicker('setStartDate', -Infinity)

        $('#new-event-modal').modal('hide')
        $('#calendar').fullCalendar('refetchEvents')
    ).fail(
      (error) ->
        $('#warning-message-span').text('Server error')
        $('#create-event-alert').show()
    )

  $ ->
    $('#calendar').fullCalendar(
      events: '/events.json',
      defaultView: 'basicWeek',
      titleFormat: 'MMMM D YYYY',
      columnHeaderFormat: 'dddd\nMMM D',
      contentHeight: 500,
      eventTextColor: 'black',
      eventBorderColor: '#c5882e',
      eventBackgroundColor: '#f4a439',
    );

    $('.datepicker').datepicker(
      format: 'yyyy-mm-dd',
      todayHighlight: true,
      autoclose: true,
    );

    $('#event-title').on 'keyup', () ->
      $('#create-event-alert').hide()

    $('#event-title, #event-starts-at, #event-ends-at').on 'change', () ->
      $('#create-event-alert').hide()

    $('#event-starts-at').on 'changeDate', (e) ->
      $('#event-ends-at').datepicker('setStartDate', e.date)

    $('#event-ends-at').on 'changeDate', (e) ->
      $('#event-starts-at').datepicker('setEndDate', e.date)

    $('#create-event-button').on 'click', () ->
      if !checkValue('#event-title') || !checkValue('#event-starts-at') || !checkValue('#event-ends-at')
        $('#warning-message-span').text('Please, fill all fields')
        $('#create-event-alert').show()
        return

      processNewEvent()

