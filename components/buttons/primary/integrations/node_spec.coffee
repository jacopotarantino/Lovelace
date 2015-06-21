'use strict'

Lovelace = {}

describe 'Buttons::Primary', ->
  beforeEach ->
    Lovelace = require '../../../../index'

  describe 'with no options passed in', ->
    it 'should render the template with all the defaults', ->
      component = Lovelace.component 'buttons/primary'

      expect( component.indexOf 'button' ).toBe 1
      expect( component.indexOf 'disabled' ).toBe -1
      expect( component.indexOf 'block' ).toBe -1
      expect( component.indexOf 'custom-class' ).toBe -1
      expect( component.indexOf 'href' ).toBe -1
      expect( component.indexOf 'click me' ).toBe -1


  describe 'with an options hash passed in', ->
    it 'should render the template with all of the new options', ->
      component = Lovelace.component 'buttons/primary',
        tag: 'a'
        disabled: true
        block: true
        custom_classes: 'custom-class'
        href: '/foobar'
        text: 'click me'

      expect( component.indexOf '<a' ).toBe 0
      expect( component.indexOf('disabled') ).toBeTruthy()
      expect( component.indexOf('block') ).toBeTruthy()
      expect( component.indexOf('custom-class') ).toBeTruthy()
      expect( component.indexOf('href="/foobar"') ).toBeTruthy()
      expect( component.indexOf('click me') ).toBeTruthy()
