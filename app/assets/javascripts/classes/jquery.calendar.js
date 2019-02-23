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

      this.dialog = $( "#event-form" ).dialog({
        autoOpen: false,
        height: 400,
        width: 350,
        modal: true,
        buttons: {
          'Create an event': function() {
            $(this).find('#new_event').submit();
          },
          Cancel: function() {
            $(this).dialog('close');
          }
        }
      });

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

    bindEvents: function() {
      this.$element.on('click', '.js-create-event', $.proxy(this, 'showCreateForm'));
    },

    showCreateForm:  function(e) {
      e.preventDefault();
      this.dialog.dialog( "open" );
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
