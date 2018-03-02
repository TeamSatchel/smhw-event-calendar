import axios from "axios";

export default class EventsAxios {
  static getIndex() {
    return axios.get('/api/events');
  }

  static postCreate(data) {
    return axios.post(
      'api/events',
      { data: { attributes: data, type: 'events' }},
      {
        headers: {
          'Content-Type': 'application/vnd.api+json',
        },
      },
    );
  }
}
