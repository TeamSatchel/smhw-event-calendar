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

    it('does not allow to add an event without a title', () => {
      const wrapper = getComponent()

      expect(wrapper.find('.actions button').attributes()['disabled']).to.eql('disabled')

      const titleInput = wrapper.find('input[name=title]')
      titleInput.setValue('Event')
      titleInput.trigger('keyup')

      expect(wrapper.find('.actions button').attributes()['disabled']).to.be.undefined
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

      it('sends API request to the backend and emits the `add-event` event', async () => {
        const wrapper = getComponent()

        const titleInput = wrapper.find('input[name=title]')
        titleInput.setValue('Event')
        titleInput.trigger('keyup')

        wrapper.find('.actions button').trigger('click')

        await flushPromises()

        expect(wrapper.emitted()['add-event'][0]).to.include(event)
      })
    })

    context('when unsuccessful', () => {
      beforeEach(() => {
        moxios.install()

        moxios.stubRequest('/api/events', {
          status: 422
        })
      })

      afterEach(() => {
        moxios.uninstall()
      })

      it('shows error message', async () => {
        const wrapper = getComponent()

        const titleInput = wrapper.find('input[name=title]')
        titleInput.setValue('Event')
        titleInput.trigger('keyup')

        wrapper.find('.actions button').trigger('click')

        await flushPromises()

        expect(wrapper.text()).to.include('error when adding the event')
      })

    })
  })
})
