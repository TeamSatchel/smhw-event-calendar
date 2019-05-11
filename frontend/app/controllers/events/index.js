import Controller from "@ember/controller";
import EmberObject from "@ember/object";
import { computed } from "@ember/object";
import Changeset from "ember-changeset";
import EventValidations from "../../validations/event";
import lookupValidator from "ember-changeset-validations";

export default Controller.extend({
  newEvent: computed(function() {
    return new Changeset(
      EmberObject.create({}),
      lookupValidator(EventValidations),
      EventValidations
    );
  }),

  normalizedEvents: computed("model.[]", function() {
    return this.model.map(event => ({
      title: event.description,
      start: event.startDate,
      end: event.endDate
    }));
  }),

  actions: {
    save(newEvent) {
      const properties = ["description", "startDate", "endDate"];
      let params = newEvent.getProperties(properties);
      let event = this.store.createRecord("event", params);

      return event.save().then(
        () => {
          newEvent.rollback();
        },
        err => {
          event.errors.forEach(error => {
            newEvent.pushErrors(error.attribute, error.message);
          });
          event.unloadRecord();

          throw err;
        }
      );
    }
  }
});
