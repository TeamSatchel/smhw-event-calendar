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

  describe('#isToday', () => {
    it('is true if it is todays date', () => {
      const wrapper = getComponent()
      const today = new Date().toISOString().slice(0, 10)

      wrapper.setProps({ value: today })

      expect(wrapper.vm.isToday).to.eql(true)
    })

    it('is false if it is not todays date', () => {
      const wrapper = getComponent()
      const date = '2018-07-16'

      wrapper.setProps({ value: date })

      expect(wrapper.vm.isToday).to.eql(false)
    })
  })
})
