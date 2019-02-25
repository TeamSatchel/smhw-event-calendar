import Ember from 'ember';
const {
  get,
  set,
  RSVP
} = Ember;

export default Ember.Route.extend({
  queryParams: {
    option: {
      refreshModel: true
    }
  },
  model(params) {
    const events = this.store.findAll('event');

    return RSVP.hash({
      events: events,
      newEvent: {}
    });
  },

  setupController(controller, model) {
    this._super(controller, model);
  },

  actions: {
    showAddEventForm(){
      $('.large.modal').modal('show');
      $('.ui.form.error').hide();
      $('.ui.form').form('clear');
    },
    cancel(){
      $('.large.modal').modal('hide');
      this.set('controller.model.newEvent', {});
      $('.ui.form').form('clear');
    },
    createNew(){
      const rawNewEvent = this.get('controller.model.newEvent');

      const description = rawNewEvent.description
      const start_time  = rawNewEvent.startTime[0]
      const end_time    = rawNewEvent.endTime[0]

      const newEvent    = this.store.createRecord('event',
       { description: description,
         startTime:   start_time,
         endTime:     end_time }
     );
      newEvent.save().then(function(response) {
        $('.large.modal').modal('hide');
        $('.ui.form.error').hide();
        $('.ui.form').form('clear');

        Ember.$('.full-calendar').fullCalendar( 'renderEvent',
               { title:   description,
                 start:   start_time,
                 end:     end_time } )
      }).catch(function(err){
        $('.ui.form.error').show()
      })
    }
  },
});
