$ ->
  $('#calendar').fullCalendar(
    events: '/events.json',
    defaultView: 'basicWeek',
    titleFormat: 'MMMM D YYYY',
    displayEventTime: false,
    columnHeaderFormat: 'dddd\nMMM D',
    contentHeight: 550,
    eventBackgroundColor: '#f4b642'
    eventBorderColor: '#d69535',
    eventTextColor: '#595550',
    defaultDate: moment().format('YYYY-MM-DD'),
    eventRender: (event, element) ->
      element.find('.fc-title').append '<div class="hr-line-solid-no-margin"></div><span style="font-size: 10px">' + event.description + '</span></div>'
      return
  );

  $('.datepicker').datepicker(
    format: 'yyyy-mm-dd',
    todayHighlight: true,
    autoclose: true,
  );

  $('#title, #description, #start-at, #end-at').on 'keyup', () ->
    $('#event-error').hide()
    enableSaveButton()

  $('#start-at').on 'changeDate', (e) ->
    $('#end-at').datepicker('setStartDate', e.date)

  $('#end-at').on 'changeDate', (e) ->
    $('#start-at').datepicker('setEndDate', e.date)

  $('#create-event').on 'click', () ->
    result = $('input').filter(->
      $.trim($(this).val()).length == 0
    ).length == 0

    if result
      createNewEvent()
    else
      disableSaveButton()
      $('#errors').text('All fields are required!')
      $('#event-error').show()

createNewEvent = (id) ->
  $.ajax(
    url: '/events',
    type: 'POST'
    data: eventDataJson(),
    contentType: 'application/json; charset=utf-8',
    dataType: 'json',
  ).done(
    ->
      cleanModalForm()
      $('#data-modal').modal('hide')
      $('#calendar').fullCalendar('refetchEvents')
  ).fail(
    (error) ->
      $('#errors').text('Error')
      $('#event-error').show()
  )

cleanModalForm = ->
  $('#title').val('')
  $('#description').val('')
  $('#start-at').val('')
  $('#end-at').val('')

eventDataJson = ->
  JSON.stringify({
    title: $('#title').val(),
    description: $('#description').val(),
    start_at: $('#start-at').val(),
    end_at: $('#end-at').val()
  })

disableSaveButton = ->
  $('#create-event').attr('disabled', true)
enableSaveButton = ->
  $('#create-event').attr('disabled', false)
