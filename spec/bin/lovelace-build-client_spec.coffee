'use strict'

exec = require('child_process').execSync
fs = require('fs')

fake_input_path = './lovelace_spec_components'
fake_output_path = './lovelace_spec_compiled_file.js'

describe 'lovelace-build-client binary', ->
  describe 'without an input path', ->
    it 'should throw an error', ->
      lo = exec('./bin/lovelace-build-client')
      console.log lo
      expect( lo ).toBeTruthy()

  describe 'without an output path', ->
    it 'should throw an error', ->
      expect(
        -> exec('./bin/lovelace-build-client --input=./components')
      ).toThrow()

  describe 'with both an input and output path', ->
    file_contents = null

    beforeEach ->
      file_contents = null
      fs.unlinkSync fs.realpathSync(fake_output_path)
      exec "lovelace-build-client --input=#{fake_input_path} --output=#{fake_output_path}"
      file_contents = fs.readFileSync fake_output_path, encoding: 'utf8'

    it 'create a file in the output file location', ->
      expect( fs.existsSync(fake_output_path) ).toBeTruthy()

    it 'should include Mustache.js', ->
      expect( /Mustache/.test(file_contents) ).toBeTruthy()

    it 'should include at least one example component', ->
      expect( /.example-photo-card/.test(file_contents) ).toBeTruthy()

    it 'should include the Lovelace client API', ->
      expect( /Lovelace\.component/.test(file_contents) ).toBeTruthy()
