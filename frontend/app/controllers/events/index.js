import Controller from '@ember/controller';

export default Controller.extend({
  actions: {
    create(event) {
      // let event = this.store.createRecord('event', event_params);
      return event.save();
    }
  }
});
