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

<style>
.date {
  border: 1px solid #ccc;
  border-collapse: collapse;
  border-width: 1px 0 1px 1px;
  padding: 1rem;
  text-align: center;
  width: 7rem;
}

.date:last-child {
  border-width: 1px
}

.date strong {
  display: block
}
</style>
