document.addEventListener 'DOMContentLoaded', ->
  calendarEl = document.getElementById('calendar')
  calendar = new (FullCalendar.Calendar)(calendarEl,
    plugins: [ 'dayGrid', 'interaction' ]
    selectable: true
    select: (e) ->
      t = prompt('Create an event from ' + e.startStr + ' to ' + e.endStr + ' (excl).\nEnter a description:')
      (t or e.view.type.match(/^timeGrid/)) and n.unselect()
      t and n.addEvent(
        title: t
        start: e.start
        end: e.end)
      return
  )
  calendar.render()
  return
