'use strict'

Lovelace = require('../../index').init
  root_component_path: "#{process.env.PWD}/components"

describe 'Lovelace.component', ->
  describe 'when working in node', ->
    it 'should compile templates from the local copy', ->
      expect( Lovelace.component('buttons/primary').indexOf 'button' ).toBe(1)
