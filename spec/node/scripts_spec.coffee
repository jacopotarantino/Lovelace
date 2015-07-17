'use strict'

Lovelace = require('../../index').init
  root_component_path: "#{process.env.PWD}/components"

rendered = Lovelace.scripts()

describe 'Lovelace.scripts', ->
  describe 'when working in node', ->
    it 'should compile coffeescript files and return a script block', ->
      console.log rendered

      expect( rendered.indexOf '<script>(function' ).toBe(0)

    it 'should return all the available scripts, not just one', ->
      expect( rendered.indexOf('Primary') > 0 ).toBeTruthy()
      expect( rendered.indexOf('Secondary') > 0 ).toBeTruthy()
