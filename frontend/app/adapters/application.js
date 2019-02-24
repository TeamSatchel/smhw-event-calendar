import DS from "ember-data";

import ActiveModelAdapter from 'active-model-adapter';

var adapter =  ActiveModelAdapter.extend({
  namespace: 'api'

});

export default adapter;
