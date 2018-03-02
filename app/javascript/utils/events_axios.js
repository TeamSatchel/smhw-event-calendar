import axios from "axios";

export default class EventsAxios {
  static getIndex() {
    return axios.get('/api/events');
  }
}
