import Calendar from '@/components/Calendar.vue'

import { expect } from 'chai'
import { shallowMount } from '@vue/test-utils'

import flushPromises from 'flush-promises'
import axios from 'axios'
import moxios from 'moxios'

describe('Calendar.vue', () => {
  const events = [
    { title: 'Event 1', start_date: '2018-07-14', end_date: '2018-07-17' },
    { title: 'Event 2', start_date: '2018-07-16', end_date: '2018-07-18' }
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

    describe('#firstDay', () => {
      it('is the start day of the earliest event', async () => {
        const wrapper = getComponent()
        const startDate = events[0].start_date

        await flushPromises()

        expect(wrapper.vm.firstDay).to.eql(startDate)
      })
    })

    describe('#lastDay', () => {
      it('is the end day of the latest event', async () => {
        const wrapper = getComponent()

        await flushPromises()

        expect(wrapper.vm.lastDay).to.eql(events[1].end_date)
      })
    })

    describe('#days', () => {
      it('includes days spanning all events durations', async () => {
        const wrapper = getComponent()

        await flushPromises()

        expect(wrapper.vm.days).to.include(events[0].start_date)
        expect(wrapper.vm.days).to.include(events[0].end_date)
        expect(wrapper.vm.days).to.include(events[1].start_date)
        expect(wrapper.vm.days).to.include(events[1].end_date)
      })
    })

    describe('#daysCount', () => {
      it('the number of days for all events span', async () => {
        const wrapper = getComponent()

        await flushPromises()

        expect(wrapper.vm.daysCount).to.eql(5)
      })
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

    it('shows Day components', () => {
      expect(getComponent().html()).to.include('<day-stub>')
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
