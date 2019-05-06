import Component from "@ember/component";
import { Calendar } from "@fullcalendar/core";
import dayGridPlugin from "@fullcalendar/daygrid";

export default Component.extend({
  didInsertElement() {
    this._super(...arguments);

    const calendarRoot = this.element.querySelector("#full_calendar");

    let fullCalendar = new Calendar(calendarRoot, {
      plugins: [dayGridPlugin],
      defaultView: "dayGridWeek",
      events: [
        {
          title: "All Day Event",
          start: "2019-05-05"
        },
        {
          title: "Long Event",
          start: "2019-05-07",
          end: "2019-05-11"
        }
      ]
    });

    this.set("fullCalendar", fullCalendar);

    this.fullCalendar.render();
  },

  willDestroyElement() {
    this.fullCalendar.destroy();

    this._super(...arguments);
  }
});
