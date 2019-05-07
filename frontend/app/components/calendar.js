import Component from "@ember/component";
import { Calendar } from "@fullcalendar/core";
import dayGridPlugin from "@fullcalendar/daygrid";
import moment from 'moment';

export default Component.extend({
  didInsertElement() {
    this._super(...arguments);

    const calendarRoot = this.element.querySelector("#full_calendar");

    let fullCalendar = new Calendar(calendarRoot, {
      plugins: [dayGridPlugin],
      defaultView: "dayGridWeek",
      header: false,
      aspectRatio: 3,
      firstDay: 1, // Monday
      views: {
        dayGridWeek: {
          columnHeaderHtml: function(date) {
            let current = moment(date);
            let formatedDate = `<span class="day">${current.format('dddd')}</span>`;
            formatedDate += `<span class="date">${current.format('Do MMM')}</span>`;
            return formatedDate;
          }
        }
      },
      events: this.fetchEvents.bind(this)
    });

    this.set("fullCalendar", fullCalendar);

    this.fullCalendar.render();
  },

  willDestroyElement() {
    this.fullCalendar.destroy();

    this._super(...arguments);
  },

  didUpdateAttrs() {
    this._super(...arguments);

    this.fullCalendar.refetchEvents();
  },

  fetchEvents(params, successCallback) {
    successCallback(this.events);
  }
});
