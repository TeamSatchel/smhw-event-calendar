import Day from '@/components/Day.vue'

import { expect } from 'chai'
import { shallowMount } from '@vue/test-utils'

describe('Day.vue', () => {
  const value = '2018-07-15'
  const dayName = 'Sunday'
  const date = '15th Jul'

  const getComponent = () => shallowMount(Day, {
    propsData: {
      value
    }
  })

  it('has #name as the name of the day', () => {
    expect(getComponent().vm.name).to.eql(dayName)
  })

  it('has #date as the formatted date', () => {
    expect(getComponent().vm.date).to.eql(date)
  })

  it('renders the name of the day and formatted date', () => {
    const wrapper = getComponent()

    expect(wrapper.text()).to.include(dayName)
    expect(wrapper.text()).to.include(date)
  })
})
