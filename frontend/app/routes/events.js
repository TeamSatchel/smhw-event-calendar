import Route from '@ember/routing/route';
import { hash } from 'rsvp';
import $ from 'jquery';

export default Route.extend({
  model() {
    let store = this.store;
    return $.getJSON('api/v1/events').then(function(response) {
      store.pushPayload({event: response['data']});
      return hash({ error_messages: {}, newItem: {}, events: response['data'] });
    });
  }
});
