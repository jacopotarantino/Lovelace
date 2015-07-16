/* global describe, it, expect, beforeEach */

'use strict'
var Lovelace

Lovelace = {}

describe('Buttons::Secondary', function () {
  beforeEach(function () {
    Lovelace = require('../../../../index')
  })
  describe('with no options passed in', function () {
    return it('should render the template with all the defaults', function () {
      var component
      component = Lovelace.component('buttons/secondary')
      expect(component.indexOf('button')).toBe(1)
      expect(component.indexOf('disabled')).toBe(-1)
      expect(component.indexOf('block')).toBe(-1)
      expect(component.indexOf('custom-class')).toBe(-1)
      expect(component.indexOf('href')).toBe(-1)
      return expect(component.indexOf('click me')).toBe(-1)
    })
  })
  return describe('with an options hash passed in', function () {
    return it('should render the template with all of the new options', function () {
      var component
      component = Lovelace.component('buttons/secondary', {
        tag: 'a',
        disabled: true,
        block: true,
        custom_classes: 'custom-class',
        href: '/foobar',
        text: 'click me'
      })
      expect(component.indexOf('<a')).toBe(0)
      expect(component.indexOf('disabled')).toBeTruthy()
      expect(component.indexOf('block') > 0).toBeTruthy()
      expect(component.indexOf('custom-class')).toBeTruthy()
      expect(component.indexOf('href="/foobar"')).toBeTruthy()
      return expect(component.indexOf('click me')).toBeTruthy()
    })
  })
})
