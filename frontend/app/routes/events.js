import Route from '@ember/routing/route';
import Ember from 'ember';

export default Route.extend({
  model() {
    let store = this.store;
    return Ember.$.getJSON('api/v1/events').then(function(response) {
      store.pushPayload({event: response['data']});
      return Ember.RSVP.hash({ error_messages: {}, newItem: {}, events: response['data'] });
    });
  }
});
