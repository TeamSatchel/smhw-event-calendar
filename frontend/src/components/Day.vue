<template>
  <p class="day" v-bind:class="{ today: isToday }">
    <strong>{{ name }}</strong>
    {{ date }}
  </p>
</template>

<script>
import moment from 'moment'
import { dateFormat } from '@/constants'

export default {
  name: 'Day',

  props: {
    value: {
      type: String,
      required: true
    }
  },

  data () {
    return {
      today: moment().format(dateFormat)
    }
  },

  computed: {
    name () {
      return moment(this.value).format('dddd')
    },

    date () {
      return moment(this.value).format('Do MMM')
    },

    isToday () {
      return this.today == moment(this.value).format(dateFormat)
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
  grid-row-start: 1;
  padding: 1rem;
  text-align: center;
}

.day.today {
  background: #eee;
}

.day:last-child {
  border-width: 1px
}

.day strong {
  display: block
}
</style>
