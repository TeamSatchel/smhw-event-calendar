import DS from 'ember-data';
const { Model } = DS;

export default Model.extend({
  description: DS.attr(),
  startDate: DS.attr(),
  endDate: DS.attr()
});
