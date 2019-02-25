import { helper } from '@ember/component/helper';

export function array([params]) {
  return params.toArray();
}

export default helper(array);
