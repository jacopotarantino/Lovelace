'use strict'

describe 'sanity check', ->
  it 'should always pass', ->
    expect( true ).toBeTruthy()

describe 'Lovelace', ->
  it 'exposes Lovelace as a global module', ->
    expect( window.Lovelace ).toBeDefined()

  it 'exposes Lovelace as an AMD module', ->
    define ['Lovelace'], (Lovelace) ->
      expect( Lovelace ).toBeDefined()

  it 'exposes Lovelace as a node module', ->
    Lovelace = require 'lovelace'
    expect( typeof Lovelace.component ).toBe 'function'

describe 'the Lovelace component documentation', ->
  it 'auto-generates documentation for each component based on the readmes', ->
    expect( true ).toBeFalsy()
