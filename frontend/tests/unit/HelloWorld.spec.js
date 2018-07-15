import { expect } from 'chai'
import { shallowMount } from '@vue/test-utils'
import Calendar from '@/components/Calendar.vue'

describe('Calendar.vue', () => {
  it('renders title', () => {
    const wrapper = shallowMount(Calendar)
    expect(wrapper.text()).to.include('Events Calendar')
  })
})
