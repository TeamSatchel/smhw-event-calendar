<template>
  <v-container fluid>
    <v-layout row wrap>
      <v-flex d-flex xs12 sm4 md4>
        <add-event-form/>
      </v-flex>
      <v-flex d-flex xs12 sm8 md8>
        <event-calendar/>
      </v-flex>
    </v-layout>
  </v-container>
</template>

<script>

import AddEventForm from '@/components/AddEventForm'
import EventCalendar from '@/components/EventCalendar'

export default {
  components: {
    AddEventForm,
    EventCalendar
  }
}

</script>
