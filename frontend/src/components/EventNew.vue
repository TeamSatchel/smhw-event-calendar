<template>
  <form class="new-event-form">
    <h1>Add new Event</h1>

    <fieldset>
      <p>
        <input type="text" name="title" maxlength="25" placeholder="Title..."/>
      </p>
      <p>
        <input type="text" name="location" maxlength="25" placeholder="Location..." />
      </p>
      <p>
        <input type="text" name="description" maxlength="35" placeholder="Description... "/>
      </p>
      <p>
        Start date:
        <input
          type="date"
          name="start_date"
          :value="today"
          :min="min"
          :max="max" />
      </p>
      <p>
        End date:
        <input
          type="date"
          name="end_date"
          :value="today"
          :min="min"
          :max="max" />
      </p>
    </fieldset>
  </form>
</template>

<script>
import moment from 'moment'
import { dateFormat } from '@/constants'

export default {
  name: 'EventNew',

  props: {
    min: {
      type: String,
      required: true
    },
    max: {
      type: String,
      required: true
    }
  },

  data () {
    return {
      today: moment().format(dateFormat)
    }
  }
}
</script>

<style>
.new-event-form fieldset {
  border: 1px solid #ccc;
  padding: 0.5rem 1.5rem;
  width: 20rem;
}

.new-event-form input[type=text] {
  font-size: 0.9rem;
  padding: 0.5rem;
  width: 80%;
}

.new-event-form input[type=date] {
  font-size: 1rem;
  padding: 0.5rem;
}
</style>
