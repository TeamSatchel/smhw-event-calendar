import Component from "@ember/component";

export default Component.extend({
  actions: {
    addEvent() {
      this.save(this.get('changeset')).then(
        () => {
          this.set("addEventModal", false);
        },
        err => {
          console.log(err);
        }
      );
    }
  }
});
