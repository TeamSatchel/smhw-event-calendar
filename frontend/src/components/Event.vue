<template>
  <div class="event">
    {{ value.title }}
  </div>
</template>

<script>
import moment from 'moment'

export default {
  name: 'Event',

  props: {
    value: {
      type: Object,
      required: true
    },
    firstDay: {
      type: String,
      required: true
    }
  },

  computed: {
    daysCount () {
      return moment(this.value.end_date).diff(this.value.start_date, 'days') + 1
    },

    daysOffset () {
      return moment(this.value.start_date).diff(this.firstDay, 'days')
    }
  }
}
</script>

<style>
.event {
  background: #EEF;
  border: 1px solid #CCC;
  border-radius: 5px;
  box-sizing: border-box;
  height: 5rem;
  padding: 0.5rem;
  font-size: 0.9rem;
}
</style>
