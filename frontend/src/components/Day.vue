<template>
  <p class="date">
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
