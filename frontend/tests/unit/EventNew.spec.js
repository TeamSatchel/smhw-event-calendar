import EventNew from '@/components/EventNew.vue'

import { expect } from 'chai'
import { shallowMount } from '@vue/test-utils'

describe('EventNew.vue', () => {
  const getComponent = () => shallowMount(EventNew)

  it('shows form title', () => {
    expect(getComponent().text()).to.include('Add new Event')
  })
})
