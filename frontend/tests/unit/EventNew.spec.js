import EventNew from '@/components/EventNew.vue'

import { expect } from 'chai'
import { shallowMount } from '@vue/test-utils'

import flushPromises from 'flush-promises'
import axios from 'axios'
import moxios from 'moxios'

describe('EventNew.vue', () => {
  const today = new Date().toISOString().slice(0, 10)

  const getComponent = () => shallowMount(EventNew, {
    propsData: {
      min: today,
      max: today
    }
  })

  it('shows form title', () => {
    expect(getComponent().text()).to.include('Add new Event')
  })

  it('shows the form', () => {
    const html = getComponent().html()

    expect(html).to.include('input type="text" name="title"')
    expect(html).to.include('input type="text" name="location"')
    expect(html).to.include('input type="text" name="description"')
    expect(html).to.include('input type="date" name="start_date"')
    expect(html).to.include('input type="date" name="end_date"')
  })

  it('initially sets start_date/end_date to today', () => {
    const wrapper = getComponent()

    expect(wrapper.vm.start_date).to.eql(today)
    expect(wrapper.vm.end_date).to.eql(today)
  })

  describe('adding an event', () => {
    const getComponent = () => shallowMount(EventNew, {
      mocks: {
        $http: axios
      },
      propsData: {
        min: today,
        max: today
      }
    })

    context('when successful', () => {
      const event = {
        title: 'Event 1',
        start_date: '2018-07-14',
        end_date: '2018-07-17'
      }

      beforeEach(() => {
        moxios.install()

        moxios.stubRequest('/api/events', {
          status: 200,
          response: event
        })
      })

      afterEach(() => {
        moxios.uninstall()
      })

      it('sends API request to the backend and sets event', async () => {
        const wrapper = getComponent()

        wrapper.find('.actions button').trigger('click')

        await flushPromises()

        expect(wrapper.vm.event).to.eql(event)
      })
    })
  })
})
