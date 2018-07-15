<template>
  <div class="calendar">
    <h1>Events Calendar</h1>
    <p>{{ events }}</p>
  </div>
</template>

<script>
export default {
  name: 'Calendar',

  data () {
    return {
      events: []
    }
  },

  created () {
    this.fetchEvents()
  },

  methods: {
    fetchEvents () {
      this.$http.get('/api/events').then(response => {
        this.events = response.data
      }, response => {
        // handle error
      })
    }
  }
}
</script>

<style>
</style>
