'use strict'

fs = require 'fs'

describe 'sanity check', ->
  it 'should always pass', ->
    expect( true ).toBeTruthy()

  it 'exposes Lovelace as a node module', ->
    Lovelace = require '../../index'
    expect( typeof Lovelace ).toBe 'object'
    expect( typeof Lovelace.component ).toBe 'function'

describe 'the Lovelace component documentation', ->
  it 'auto-generates documentation for each component based on the readmes', ->
    example_file = fs.readFileSync(
      'dist/components/buttons/primary/Readme.html'
      , 'utf8'
    )
    expect( example_file.indexOf('Primary') ).toBeTruthy()
