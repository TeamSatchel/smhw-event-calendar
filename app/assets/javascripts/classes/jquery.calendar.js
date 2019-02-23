;(function($, window, document, undefined) {

  var pluginName = 'calendar';
  var defaults = {
  };

  // The actual plugin constructor
  function Plugin(element, options) {
    this.options = $.extend( {}, defaults, options );

    this.$element = $(element);
    this.$target = this.$element.find(options && options.target || defaults.target);

    this.$form = this.$element.find('#new_event');

    this._defaults = defaults;
    this._name = pluginName;

    this.init();
  }

  Plugin.prototype = {
    init: function() {
      this.loadFullCalendar();
      this.loadDialog();

      this.bindEvents();
    },

    loadFullCalendar: function() {
      this.fullCalendar = $('.js-calendar-view').fullCalendar({
        defaultView: 'basicWeek',
        firstDay: 1,
        displayEventTime: false,
        eventSources: [
          {
            url: '/events.json',
            color: 'yellow',
            textColor: 'black'
          }
        ],
        columnHeaderHtml: function(mom) {
          return '<strong>'+mom.format('dddd')+'</strong><br><span>'+mom.format('Do MMM')+'</span>';
        },
        eventRender: function(event, element) {
          if (!!event.subject)
            element.find('.fc-content').append('<br><span><strong>' + event.subject + '</strong></span>');
          if (!!event.description)
            element.find('.fc-content').append('<br><span>' + event.description + '</span>');
        }
      });
    },

    loadDialog: function() {
      this.dialog = $('#event-form').dialog({
        autoOpen: false,
        height: 400,
        width: 350,
        modal: true,
        buttons: {
          'Create an event': $.proxy(this, 'createEvent'),
          Cancel: $.proxy(this, 'cancelForm')
        }
      });
    },

    bindEvents: function() {
      this.$element.on('click', '.js-create-event', $.proxy(this, 'showCreateForm'));
      this.$form.on('submit', $.proxy(this, 'clearFormErrors'));
      this.$form.on('ajax:success', $.proxy(this, 'formSuccess'))
        .on('ajax:error', $.proxy(this, 'formError'));
    },

    showCreateForm:  function(e) {
      e.preventDefault();
      this.dialog.dialog('open');
    },

    createEvent: function() {
      this.$form.submit();
    },

    cancelForm: function() {
      this.dialog.dialog('close');
      this.clearForm();
    },

    formSuccess: function(event, data) {
      data.color = 'red';
      data.textColor = 'white';

      this.clearForm();

      $('.js-calendar-view').fullCalendar('renderEvent', data);
    },

    formError: function(event, data) {
      console.log(data);
      if (data.status == 422) {
        console.log(data.responseJSON);
        for (var key in data.responseJSON) {
          var input = this.$form.find('input[name="event[' + key + ']"]');

          if (input) {
            var inputWrapper = input.closest('.input');
            inputWrapper.addClass('with-error');
            if (inputWrapper.find('.error').length == 0) {
              inputWrapper.append('<span class="error">' + data.responseJSON[key][0] + '</span>');
            }
          }
        }
      }
    },

    clearForm: function() {
      this.$form.trigger('reset');
      this.clearFormErrors();
      this.dialog.dialog('close');
    },

    clearFormErrors: function() {
      this.$form.find('.input').removeClass('with-error');
      this.$form.find('.input .error').remove();
    },

  };

  // A really lightweight plugin wrapper around the constructor,
  // preventing against multiple instantiations
  $.fn[pluginName] = function ( options ) {
    this.each(function () {
      if (!$.data(this, 'plugin_' + pluginName)) {
        $.data(this, 'plugin_' + pluginName, new Plugin( this, options ));
      }
    });

    return this;
  };

})(jQuery, window, document);
