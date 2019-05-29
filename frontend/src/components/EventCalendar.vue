<template>
  <v-card>
    <v-progress-circular indeterminate color="primary" v-if="events===null"></v-progress-circular>
    <FullCalendar v-else
      :events="events"
      :default-view="defaultView"
      :plugins="calendarPlugins"
      :column-header-html="columnHeaderHtml"
      :height="height"
      event-color="#f5a200"
      event-text-color="#3b3e00"
      class="pa-3"
    />
  </v-card>
</template>

<script>

import FullCalendar from '@fullcalendar/vue'
import dayGridPlugin from '@fullcalendar/daygrid'
import moment from 'moment'

export default {
  components: {
    FullCalendar // make the <FullCalendar> tag available
  },
  data () {
    return {
      calendarPlugins: [ dayGridPlugin ],
      height: 'parent',
      defaultView: 'dayGridWeek',
      columnHeaderHtml: function (date) {
        const dayOfWeek = moment(date).format('dddd')
        const dayOfMonth = moment(date).format('Do MMM')

        return `
          <span class="full-calendar-column-header-day-of-week">${dayOfWeek}</span>
          <br/>
          <span class="full-calendar-column-header-day-of-month">${dayOfMonth}</span>
      `
      }
    }
  },
  computed: {
    events () {
      const events = this.$store.getters.EVENTS
      if (events == null) { return null }
      return events.map((event) => {
        return {
          title: event.description,
          start: event.start_date,
          end: moment(event.end_date).add(1, 'days').format('YYYY-MM-DD')
        }
      })
    }
  },
  mounted () {
    this.$store.dispatch('GET_EVENTS')
  }
}

</script>

<style lang='scss'>

  @import '~@fullcalendar/core/main.css';
  @import '~@fullcalendar/daygrid/main.css';

  .full-calendar-column-header-day-of-week {
    font-weight: bold;
  }
  .full-calendar-column-header-day-of-month {
    font-weight: normal;
  }
</style>
