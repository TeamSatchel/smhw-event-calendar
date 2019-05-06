import Component from '@ember/component';

export default Component.extend({
  actions: {
    addEvent() {
      this.create(this.get('event')).then(() => {
        console.log('yes');
        this.set('addEventModal', false);
      }, (res) => {
        console.log('no');
      });
    }
  }
});
