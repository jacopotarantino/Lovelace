describe 'Lovelace', ->
  it 'exposes Lovelace as a global module', ->
    expect( window.Lovelace ).toBeDefined()

  it 'exposes Lovelace as an AMD module', ->
    define ['Lovelace'], (Lovelace) ->
      expect( Lovelace ).toBeDefined()

  it 'exposes Lovelace as a node module', ->
    Lovelace = require 'lovelace'
    expect( typeof Lovelace.component ).toBe 'function'
