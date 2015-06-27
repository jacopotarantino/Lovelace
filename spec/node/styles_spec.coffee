'use strict'

Lovelace = require('../../index').init
  root_component_path: "#{process.env.PWD}/components"

rendered = Lovelace.styles()

describe 'Lovelace.styles', ->
  describe 'when working in node', ->
    it 'should compile sass files and return a style block', ->
      expect( rendered.indexOf '<style>' ).toBe(0)
      expect( rendered.indexOf('.button--primary {') > 0 ).toBeTruthy()

    it 'should return all the available style, not just one', ->
      expect( rendered.indexOf('.button--primary {') > 0 ).toBeTruthy()
      expect( rendered.indexOf('.button--secondary {') > 0 ).toBeTruthy()
