import EventNew from '@/components/EventNew.vue'

import { expect } from 'chai'
import { shallowMount } from '@vue/test-utils'

describe('EventNew.vue', () => {
  const date = '2018-07-17'
  const getComponent = () => shallowMount(EventNew, {
    propsData: {
      min: date,
      max: date
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

  it('holds todays date', () => {
    const wrapper = getComponent()
    const today = new Date()

    expect(today.toISOString()).to.include(wrapper.vm.today)
  })
})
