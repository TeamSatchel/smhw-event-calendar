<template>
  <div class="calendar">
    <h1>Events Calendar</h1>

    <p v-if="error" class="error">{{ error }}</p>

    <section class="header">
      <template v-for="day in days">
        <Day :value="day" />
      </template>
    </section>

    <section class="events">
      <template v-for="event in events">
        <Event :value="event" :firstDay="firstDay" />
      </template>
    </section>

    <section class="actions">
      <button @click="toggleNewEventForm">
        Add new Event
      </button>
    </section>

    <section
      class="event-new"
      v-if="displayNewEventForm">
      <EventNew />
    </section>
  </div>
</template>

<script>
import moment from 'moment'
import Day from '@/components/Day'
import Event from '@/components/Event'
import EventNew from '@/components/EventNew'

const dateFormat = 'YYYY-MM-DD'

export default {
  name: 'Calendar',

  components: {
    Day,
    Event,
    EventNew
  },

  data () {
    return {
      displayNewEventForm: false,
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
    },

    toggleNewEventForm () {
      this.displayNewEventForm = !this.displayNewEventForm
    }
  }
}
</script>

<style>
.header {
  display: grid;
  grid-auto-columns: calc(9rem + 10px);
}

.events {
  display: grid;
  grid-gap: 10px;
  grid-auto-flow: dense;
  grid-auto-columns: 9rem;
  padding: 0 5px;
}

.error {
  background: #fee;
  border: 1px solid #700;
  color: #700;
  padding: 1rem;
}

.actions {
  margin-top: 3rem;
}

.actions button {
  font-size: 0.9rem;
  padding: 0.6rem 1.2rem;
}
</style>
