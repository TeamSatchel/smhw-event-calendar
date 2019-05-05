import Component from '@ember/component';

export default Component.extend({
  init() {
    this._super(...arguments);
    this.set('event', {});
  },

  actions: {
    addEvent() {
      console.log(this.get('event'));
    }
  }
});
