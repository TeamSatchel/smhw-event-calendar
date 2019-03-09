import Route from '@ember/routing/route';

export default Route.extend({
  model() {
    return Ember.$.getJSON('api/v1/events').then(function(response) {
      return Ember.RSVP.hash({ events: response['data'] });
    });
  }
});
