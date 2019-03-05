$(document).ready ->
  clear_form_errors = (form) ->
    form.find('.form-group').removeClass('has-error')
    form.find('span.help-block').remove()
    return

  $('#create-event-modal-window').on 'hidden.bs.modal', (e) ->
    clear_form_errors $(e.target)
    return

  $('#new_event').bind 'ajax:success', (evt, xhr, status, error) ->
    form = $(this)

    clear_form_errors form
    $('.grid-calendar .calendar-body .event').remove()

    $('.grid-calendar .calendar-body').append xhr.events
    $('#create-event-modal-window').modal('toggle')


    form.trigger("reset")
    return
  .bind 'ajax:error', (evt, xhr, status, error) ->
    form = $(this)

    clear_form_errors form

    $.each(xhr.responseJSON, (field, messages) ->
      input = form.find('input, select, textarea').filter(->
        name = $(this).attr('name')
        if name
          name.match(new RegExp('event' + '\\[' + field + '\\(?'))
      )
      input.closest('.form-group').addClass('has-error')
      input.parent().append('<span class="help-block">' + $.map(messages, (m) -> m.charAt(0).toUpperCase() + m.slice(1)).join('<br />') + '</span>')
    )
    return
  return

