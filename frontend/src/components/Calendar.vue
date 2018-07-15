<template>
  <div class="calendar">
    <h1>Events Calendar</h1>

    <p v-if="error" class="error">{{ error }}</p>

    <p>{{ events }}</p>
  </div>
</template>

<script>
import moment from 'moment'

const dateFormat = 'YYYY-MM-DD'

export default {
  name: 'Calendar',

  data () {
    return {
      events: [],
      error: null,
      today: moment().format(dateFormat)
    }
  },

  computed: {
    firstDay () {
      const earliestEventStartDate =
        this.events.map(event => event.start_date).sort()[0]

      return earliestEventStartDate || this.today
    },

    lastDay () {
      const latestEventEndDate =
        this.events.map(event => event.end_date).sort().reverse()[0]

      return latestEventEndDate || this.today
    },

    days () {
      const daysArray = []

      for (let i = 0; i < this.daysCount; i++) {
        const day = moment(this.firstDay).add(i, 'days').format(dateFormat)
        daysArray.push(day)
      }

      return daysArray
    },

    daysCount () {
      return moment(this.lastDay).diff(this.firstDay, 'days') + 1
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
