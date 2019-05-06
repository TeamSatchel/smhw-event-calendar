import { helper } from '@ember/component/helper';
import { capitalize } from '@ember/string';

export function validationMessage([error]) {
  return capitalize(`${error.attribute} ${error.message}`);
}

export default helper(validationMessage);
