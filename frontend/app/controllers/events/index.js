import Controller from "@ember/controller";
import EmberObject from "@ember/object";

export default Controller.extend({
  newEvent: EmberObject.create({
    description: null,
    startDate: null,
    endDate: null,
    errors: null
  }),

  actions: {
    save() {
      const properties = ["description", "startDate", "endDate"];
      let params = this.get("newEvent").getProperties(properties);
      let event = this.store.createRecord("event", params);

      return event.save().then(
        () => {
          this.set("newEvent", {});
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
