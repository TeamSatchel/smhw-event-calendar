import Component from "@ember/component";

export default Component.extend({
  actions: {
    addEvent() {
      this.save().then(
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
