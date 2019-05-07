import Controller from "@ember/controller";
import EmberObject from "@ember/object";
import EventValidations from "../../validations/event";
import { computed } from "@ember/object";

export default Controller.extend({
  EventValidations,

  newEvent: EmberObject.create({
    description: null,
    startDate: null,
    endDate: null,
    errors: null
  }),

  normalizedEvents: computed("model.[]", function() {
    return this.model.map(event => ({
      title: event.description,
      start: event.startDate,
      end: event.endDate
    }));
  }),

  actions: {
    save(changeset) {
      const properties = ["description", "startDate", "endDate"];
      let params = changeset.getProperties(properties);
      let event = this.store.createRecord("event", params);

      return event.save().then(
        () => {
          this.set("newEvent", EmberObject.create({}));
        },
        err => {
          this.set(
            "newEvent.errors",
            event.errors.map(error => {
              return `${error.attribute} ${error.message}`;
            })
          );
          event.unloadRecord();
          throw err;
        }
      );
    }
  }
});
