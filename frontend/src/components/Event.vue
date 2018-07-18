<template>
  <div
    class="event"
    v-bind:style="style">
    <p class="title">
      {{ value.title }}
    </p>
    <p class="location">
      {{ value.location }}
    </p>
    <p class="description">
      {{ value.description }}
    </p>
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
    },

    style () {
      const backgroundColors = ['#50EBEE', '#F8F861', '#BEA5EB', '#6EEB53']

      return {
        backgroundColor: backgroundColors[this.daysOffset % backgroundColors.length],
        gridColumnStart: this.daysOffset + 1,
        gridColumnEnd: this.daysOffset + this.daysCount + 1
      }
    }
  }
}
</script>

<style>
.event {
  border: 1px solid #888;
  border-radius: 5px;
  box-sizing: border-box;
  height: 5rem;
  padding: 0.5rem;
  font-size: 0.9rem;
}

.event p {
  margin: 0;
}

.event .location {
  font-weight: 700;
}

.event .description {
  font-size: 85%;
}
</style>
