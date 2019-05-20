$(document).on('turbolinks:load', function() {

  $('.no_icon_picker').datetimepicker()

  $('.datetimepicker').each(function(){
    var options = {
      useCurrent: false,
      sideBySide: true,
      icons: {
        date: 'fa fa-calendar',
        time: 'fa fa-clock-o',
        up: 'fa fa-chevron-up',
        down: 'fa fa-chevron-down',
        previous: 'fa fa-chevron-left',
        next: 'fa fa-chevron-right',
        today: 'fa fa-crosshairs',
        clear: 'fa fa-trash-o',
        close: 'fa fa-times'
      }

    }

    options = $.extend(options, $(this).data().dateOptions);

    $(this).datetimepicker(options);
  })

  $('.datetimerange').each(function(){
    var $this = $(this)
    var range1 = $($this.find('.input-group input')[0])
    var range2 = $($this.find('.input-group input')[1])

    if(range1.data("DateTimePicker").date() != null)
      range2.data("DateTimePicker").minDate(range1.data("DateTimePicker").date());

    if(range2.data("DateTimePicker").date() != null)
      range1.data("DateTimePicker").maxDate(range2.data("DateTimePicker").date());

    range1.on("dp.change",function (e) {
      if(e.date)
        range2.data("DateTimePicker").minDate(e.date);
      else
        range2.data("DateTimePicker").minDate(false);
    });

    range2.on("dp.change",function (e) {
      if(e.date)
        range1.data("DateTimePicker").maxDate(e.date);
      else
        range1.data("DateTimePicker").maxDate(false);
    });
  })
});


var reinitialise_pickers = function(){
  $('.datetimepicker').each(function(){
    var options = {
      useCurrent: false,
      icons: {
        date: 'fa fa-calendar',
        time: 'fa fa-clock-o',
        up: 'fa fa-chevron-up',
        down: 'fa fa-chevron-down',
        previous: 'fa fa-chevron-left',
        next: 'fa fa-chevron-right',
        today: 'fa fa-crosshairs',
        clear: 'fa fa-trash-o',
        close: 'fa fa-times'
      }

    }

    $(this).datetimepicker(options);
  })



  $('.datetimerange').each(function(){
    var $this = $(this)
    var range1 = $($this.find('.input-group input')[0])
    var range2 = $($this.find('.input-group input')[1])

    if(range1.data("DateTimePicker").date() != null)
      range2.data("DateTimePicker").minDate(range1.data("DateTimePicker").date());

    if(range2.data("DateTimePicker").date() != null)
      range1.data("DateTimePicker").maxDate(range2.data("DateTimePicker").date());

    range1.on("dp.change",function (e) {
      if(e.date)
        range2.data("DateTimePicker").minDate(e.date);
      else
        range2.data("DateTimePicker").minDate(false);
    });

    range2.on("dp.change",function (e) {
      if(e.date)
        range1.data("DateTimePicker").maxDate(e.date);
      else
        range1.data("DateTimePicker").maxDate(false);
    });
  })
}