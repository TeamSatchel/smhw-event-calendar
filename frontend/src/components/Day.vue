<template>
  <p class="day">
    <strong>{{ name }}</strong>
    {{ date }}
  </p>
</template>

<script>
import moment from 'moment'

export default {
  name: 'Day',

  props: {
    value: {
      type: String,
      required: true
    }
  },

  computed: {
    name () {
      return moment(this.value).format('dddd')
    },

    date () {
      return moment(this.value).format('Do MMM')
    }
  }
}
</script>

<style>
.day {
  border: 1px solid #ccc;
  border-collapse: collapse;
  border-width: 1px 0 1px 1px;
  box-sizing: border-box;
  padding: 1rem;
  text-align: center;
  width: calc(9rem);
}

.day:last-child {
  border-width: 1px
}

.day strong {
  display: block
}
</style>
