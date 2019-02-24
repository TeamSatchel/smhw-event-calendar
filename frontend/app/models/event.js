import DS from 'ember-data';
import Ember from 'ember';
import { alias } from '@ember/object/computed';

const {
  get,
  set,
} = Ember;

const {
  Model, attr, computed
} = DS;


export default Model.extend({
  description: attr('string'),
  startTime:   attr('date'),
  endTime:     attr('date'),
  title:       alias('description'),
  start:       alias('startTime'),
  end:         alias('endTime')
});
