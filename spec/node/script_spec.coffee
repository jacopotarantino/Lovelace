'use strict'

Lovelace = require('../../index').init
  root_component_path: "#{process.env.PWD}/components"

rendered = Lovelace.script('buttons/primary')

describe 'Lovelace.script', ->
  describe 'when working in node', ->
    it 'should compile coffeescript file and return a script block', ->
      expect( rendered.indexOf '<script>!function' ).toBe(0)
      # @todo this should rely on something more neutral. file banner?
      expect( rendered.indexOf('PrimaryButtonAnalytics') > 0 ).toBeTruthy()
