import React from 'react'
import {shallow} from 'enzyme'
import tape from 'tape'

import register from 'ignore-styles'
register(['css', '.scss'])


const test = tape
const props = {
}


import {Component} from './component'

test('<Component/>', (t) => {

  t.test('always shows markup', t => {
    const wrapper = shallow(<Component {...props} />)
    t.plan(2)
    t.equal(
      wrapper.find('header').length,
      1,
      'no matter what'
    )
  })

  t.test('does appropriate thing in following circumstances', t => {
    const setup = [
    ]

    const localProps = {
    }
    const wrapper = shallow(<Component {...props} {...localProps}/>)

    t.plan(setup.length)
    setup.map(testData => {

      t.equal(
        expected,
        actual,
        `test of ${testData} condition` 
      )
    })
  })
})
