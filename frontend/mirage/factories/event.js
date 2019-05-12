import { Factory, faker } from 'ember-cli-mirage';

export default Factory.extend({
  description() {
    return faker.lorem.sentence();
  },

  startDate() {
    return new Date().toJSON().slice(0,10); // today
  }
});
