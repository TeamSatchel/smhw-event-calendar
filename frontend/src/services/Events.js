import axios from 'axios'

export default {
  getEvents () {
    return axios.get('/events').then(response => {
      return response.data
    })
  },
  createEvent (event) {
    return axios.post('/events', event)
  }
}
