import Controller from '@ember/controller';

export default Controller.extend({
  actions: {
    showEvent(event) {
    },
    showNewEventDialog() {
      this.set('isDialogVisible', true);
    },
    cancelNewEventDialog() {
      this.set('isDialogVisible', false);
    },
    submitEventForm() {
      let newItem = this.get('model.newItem');
      let store = this.store;
      let data = {
        title: newItem.title,
        description: newItem.description,
        start_date: newItem.startDate,
        end_date: newItem.endDate
      }
      Ember.$.post('api/v1/events', data, function(response) {
      }, 'json').then(function(response) {
        if(response.data){
          // store.set('model.events', {events: response.data});
        }else if(response.meta.message) {
          store.set('model.error_messages', response.meta.message);
        }
      })
    }
  }
});
