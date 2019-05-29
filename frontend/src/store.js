import Vue from 'vue'
import Vuex from 'vuex'
import EventsService from '@/services/Events'

Vue.use(Vuex)

export default new Vuex.Store({
  state: {
    events: null
  },

  getters: {
    EVENTS: state => {
      return state.events
    }
  },

  mutations: {
    SET_EVENTS: (state, events) => {
      state.events = events
    },

    ADD_EVENT: (state, event) => {
      if (state.events === null) {
        state.events = []
      }
      state.events.push(event)
    }
  },

  actions: {
    GET_EVENTS: async (context) => {
      let events = await EventsService.getEvents()
      context.commit('SET_EVENTS', events)
    },

    CREATE_EVENT: async (context, event) => {
      // eslint-disable-next-line
      let { data } = await EventsService.createEvent(event)
      context.commit('ADD_EVENT', event)
    }
  }
})
