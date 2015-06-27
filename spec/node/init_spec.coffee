'use strict'

describe 'Lovelace.init', ->
  describe 'with a root component path option', ->
    it 'should set the root component path on the Lovelace namespace', ->
      Lovelace = require('../../index').init
        root_component_path: 'chocolate-milk-foo/'
      expect( Lovelace.root_component_path  ).toBe 'chocolate-milk-foo/'

    it 'should add a final slash if its missing' , ->
      Lovelace = require('../../index').init
        root_component_path: 'chocolate-milk'
      expect( Lovelace.root_component_path  ).toBe 'chocolate-milk/'
