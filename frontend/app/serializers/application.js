import DS from 'ember-data';

export default DS.RESTSerializer.extend({
  keyForAttribute(attr) {
    return attr;
  }
});
