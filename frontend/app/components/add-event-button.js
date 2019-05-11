import Component from "@ember/component";

export default Component.extend({
  actions: {
    addEvent() {
      this.save(this.get("event")).then(() => {
        this.set("addEventModal", false);
      });
    }
  }
});
