import {
  validatePresence,
  validateLength,
  validateFormat
} from "ember-changeset-validations/validators";

export default {
  description: validatePresence({ presence: true, ignoreBlank: true })
};
