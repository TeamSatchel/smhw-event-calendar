<template>
  <v-card>
    <v-card-title primary-title><div class="headline">Add new event</div></v-card-title>
    <v-form class="pa-3">
      <v-menu
        v-model="startDateMenu"
        :close-on-content-click="false"
        :nudge-right="40"
        lazy
        transition="scale-transition"
        offset-y
        full-width
        min-width="290px"
      >
        <template v-slot:activator="{ on }">
          <v-text-field
            box
            v-model="startDate"
            label="Start date"
            prepend-icon="mdi-calendar"
            readonly
            v-on="on"
          ></v-text-field>
        </template>
        <v-date-picker v-model="startDate" reactive show-current="true" @input="startDateMenu = false"></v-date-picker>
      </v-menu>

      <v-menu
        v-model="endDateMenu"
        :close-on-content-click="false"
        :nudge-right="40"
        lazy
        transition="scale-transition"
        offset-y
        full-width
        min-width="290px"
      >
        <template v-slot:activator="{ on }">
          <v-text-field
            box
            v-model="endDate"
            label="End date"
            prepend-icon="mdi-calendar"
            readonly
            v-on="on"
          ></v-text-field>
        </template>
        <v-date-picker v-model="endDate" show-current="true" @input="endDateMenu = false">
        </v-date-picker>
      </v-menu>

      <v-textarea
        v-model="description"
        auto-grow
        box
        label="Description"
        prepend-icon="mdi-card-text-outline"
        rows="1"
      ></v-textarea>
    </v-form>
    <v-divider></v-divider>
    <v-card-actions>
      <v-spacer></v-spacer>
      <v-btn color="primary" @click="addEvent">
        <v-icon left>mdi-calendar-plus</v-icon>
        Add event
      </v-btn>
    </v-card-actions>
  </v-card>
</template>

<script>
export default {
  components: {
  },
  data () {
    return {
      startDate: new Date().toISOString().substr(0, 10),
      startDateMenu: false,
      endDate: new Date().toISOString().substr(0, 10),
      endDateMenu: false,
      description: ''
    }
  },
  methods: {
    addEvent: function () {
      this.$store.dispatch('CREATE_EVENT', {
        start_date: this.startDate,
        end_date: this.endDate,
        description: this.description
      })
    }
  }
}
</script>
