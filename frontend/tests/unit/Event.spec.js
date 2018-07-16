import Event from '@/components/Event.vue'

import { expect } from 'chai'
import { shallowMount } from '@vue/test-utils'

describe('Event.vue', () => {
  const firstDay = '2018-07-16'

  const event = {
    title: 'Title',
    start_date: firstDay,
    end_date: '2018-07-18'
  }

  const getComponent = () => shallowMount(Event, {
    propsData: {
      value: event,
      firstDay
    }
  })

  it('has #daysCount as the number of days this event spans', () => {
    expect(getComponent().vm.daysCount).to.eql(3)
  })

  it('has #daysOffset as the number of days between firstDay and event start', () => {
    expect(getComponent().vm.daysOffset).to.eql(0)
  })
})
