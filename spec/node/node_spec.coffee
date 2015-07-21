'use strict'

fs = require 'fs'

describe 'sanity check', ->
  it 'should always pass', ->
    expect( true ).toBeTruthy()

  it 'exposes Lovelace as a node module', ->
    Lovelace = require '../../index'
    expect( typeof Lovelace ).toBe 'object'
    expect( typeof Lovelace.component ).toBe 'function'
