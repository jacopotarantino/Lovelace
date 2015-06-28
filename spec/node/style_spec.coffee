'use strict'

Lovelace = require('../../index').init
  root_component_path: "#{process.env.PWD}/components"

rendered = Lovelace.style('buttons/primary')

describe 'Lovelace.style', ->
  describe 'when working in node', ->
    it 'should compile sass files and return a style block', ->
      expect( rendered.indexOf '<style>' ).toBe(0)
      expect( rendered.indexOf('.button--primary{') > 0 ).toBeTruthy()
