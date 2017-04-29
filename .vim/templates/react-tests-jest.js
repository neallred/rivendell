import React from 'react'
import Component from './component.js'
import {shallow} from 'enzyme'

describe('Component', () => {
	let props = null
	beforeEach(function () {
		props = {
      actions: {
        actionCreator: jest.fn()
      }
		}
	})

	afterEach(function () {
	})

	describe('method', function() {
		it('does what I want', function() {
			//const wrapper = shallow(<Component {...props}/>)
			//expect(wrapper.find('.className').length).toBe(1)
		})
	})
})
