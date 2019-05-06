import Component from '@ember/component';

export default Component.extend({
  init() {
    this._super(...arguments);
    this.set('event', {});
  },

  actions: {
    addEvent() {
      this.create(this.get('event')).then(() => {
        this.set('addEventModal', false);
      });
    }
  }
});
