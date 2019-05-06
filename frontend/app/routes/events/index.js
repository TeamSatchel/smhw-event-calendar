import Route from '@ember/routing/route';
import RSVP from 'rsvp';

export default Route.extend({
  model() {
    return RSVP.hash({
      events: this.store.findAll('event'),
      event: this.store.createRecord('event')
    });
  },

  setupController(controller, models) {
    controller.setProperties(models);
  }
});
