import Controller from '@ember/controller';
import $ from 'jquery';

export default Controller.extend({
  actions: {
    showNewEventDialog() {
      this.set('isDialogVisible', true);
    },
    cancelNewEventDialog() {
      this.set('isDialogVisible', false);
      this.send('cleanEventForm');
    },
    cleanEventForm: function (){
      this.set('model.newItem', {});
      this.set('model.error_messages', {});
    },
    submitEventForm() {
      let parentThis = this;
      let newItem = this.get('model.newItem');
      let store = this.store;
      let data = {
        title: newItem.title,
        start_date: newItem.start,
        end_date: newItem.end
      }
      $.post('api/v1/events', data, function() {
      }, 'json').then(function(response) {
        if(response.data){
          store.pushPayload({event: response.data});
          newItem['id'] = response.data.id;
          parentThis.send('cleanEventForm');
          parentThis.send('cancelNewEventDialog');
          $('.full-calendar').fullCalendar('renderEvent', newItem)
        }else if(response.meta.message) {
          parentThis.set('model.error_messages', response.meta.message);
        }
      })
    }
  }
});
