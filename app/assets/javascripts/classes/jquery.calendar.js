;(function($, window, document, undefined) {

  var pluginName = 'calendar';
  var defaults = {
  };

  // The actual plugin constructor
  function Plugin(element, options) {
    this.options = $.extend( {}, defaults, options );

    this.$element = $(element);
    this.$target = this.$element.find(options && options.target || defaults.target);

    this._defaults = defaults;
    this._name = pluginName;

    this.init();
  }

  Plugin.prototype = {
    init: function() {
      this.loadFullCalendar();

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
