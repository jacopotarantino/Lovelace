'use strict'

Lovelace = require '../../node'

describe 'Lovelace.component', ->
  describe 'when working in node', ->
    it 'should compile templates from the local copy', ->
      expect( Lovelace.component('buttons/primary').indexOf 'button' ).toBe(1)
