<template>
  <div class="calendar">
    <h1>Events Calendar</h1>

    <p v-if="error" class="error">{{ error }}</p>

    <p>{{ events }}</p>
  </div>
</template>

<script>
import moment from 'moment'

export default {
  name: 'Calendar',

  data () {
    return {
      events: [],
      error: null,
      today: moment().format(dateFormat)
    }
  },

  created () {
    this.fetchEvents()
  },

  methods: {
    fetchEvents () {
      this.$http.get('/api/events').then(response => {
        this.events = response.data
        this.error = null
      }, response => {
        this.error = 'There was an error while fetching the events.'
      })
    }
  }
}
</script>

<style>
.error {
  background: #fee;
  border: 1px solid #700;
  color: #700;
  padding: 1rem;
}
</style>
