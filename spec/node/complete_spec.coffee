'use strict'

Lovelace = require('../../index').init
  root_component_path: "#{process.env.PWD}/components"

fake_text = 'Clicking things!'
rendered = Lovelace.complete('buttons/primary', { text: fake_text })

describe 'Lovelace.complete', ->
  describe 'when working in node', ->
    it 'should return a complete component with styles', ->
      expect( rendered.indexOf '<style>' ).toBe(0)

    it 'should return a complete component with scripts', ->
      expect( rendered.indexOf('<script>(function(){') > 0 ).toBeTruthy()

    it 'should return a complete component with markup', ->
      expect( rendered.indexOf('<button') > 0 ).toBeTruthy()
      expect( rendered.indexOf( fake_text ) > 0 ).toBeTruthy()

    it 'should return the markup in the correct order', ->
      style_position = rendered.indexOf '<style>'
      script_position = rendered.indexOf('<script>(function(){')
      markup_position = rendered.indexOf('<button')
      expect(
        script_position > markup_position and
        markup_position > style_position and
        script_position > style_position
      ).toBeTruthy()
