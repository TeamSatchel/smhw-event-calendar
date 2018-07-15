import Calendar from '@/components/Calendar.vue'

import { expect } from 'chai'
import { shallowMount } from '@vue/test-utils'

import flushPromises from 'flush-promises'
import axios from 'axios'
import moxios from 'moxios'

describe('Calendar.vue', () => {
  const events = [
    { title: 'Event 1' },
    { title: 'Event 2' }
  ]

  const getComponent = () => shallowMount(Calendar, {
    mocks: {
      $http: axios
    }
  })

  context('when API responds with success', () => {
    beforeEach(() => {
      moxios.install()

      moxios.stubRequest('/api/events', {
        status: 200,
        response: events
      })
    })

    afterEach(() => {
      moxios.uninstall()
    })

    it('initially holds empty events collection', () => {
      expect(getComponent().vm.events).to.eql([])
    })

    it('holds todays date', () => {
      const wrapper = getComponent()
      const today = new Date()

      expect(today.toISOString()).to.include(wrapper.vm.today)
    })

    it('shows the title', () => {
      expect(getComponent().text()).to.include('Events Calendar')
    })

    it('shows the events fetched from the backend API', async () => {
      const wrapper = getComponent()

      await flushPromises()

      expect(wrapper.text()).to.include(events[0].title)
      expect(wrapper.text()).to.include(events[1].title)
    })
  })

  context('when API responds with an error', () => {
    beforeEach(() => {
      moxios.install()

      moxios.stubRequest('/api/events', {
        status: 404
      })
    })

    afterEach(() => {
      moxios.uninstall()
    })

    it('shows error message when events could not be fetched', async () => {
      const wrapper = getComponent()

      await flushPromises()

      expect(wrapper.text()).to.include('error while fetching the events')
    })
  })
})
