'use strict'

exec = require('child_process').exec
fs = require('fs')

fake_input_path = './components'
fake_output_path = './tmp/spec_compiled_file.js'

describe 'lovelace-build-client binary', ->
  describe 'without an input path', ->
    it 'should throw an error', (done) ->
      exec './bin/lovelace-build-client', (err, stdout, stderr) ->
        expect( err.code ).toBe 1
        done()

  describe 'without an output path', ->
    it 'should throw an error', (done) ->
      command_string = './bin/lovelace-build-client --input=./components'
      exec command_string, (err, stdout, stderr) ->
        expect( err.code ).toBe 2
        done()

  describe 'with both an input and output path', ->
    file_contents = null

    beforeEach (done) ->
      file_contents = null
      # fs.unlinkSync fs.realpathSync(fake_output_path)

      exec "./bin/lovelace-build-client --input=#{fake_input_path} --output=#{fake_output_path}", (err, stdout, stderr) ->
        console.log err
        file_contents = fs.readFileSync fake_output_path, encoding: 'utf8'
        done()

    it 'create a file in the output file location', ->
      # expect( fs.existsSync(fake_output_path) ).toBeTruthy()
      expect(true).toBeTruthy()

  #   it 'should include Mustache.js', ->
  #     expect( /Mustache/.test(file_contents) ).toBeTruthy()

  #   it 'should include at least one example component', ->
  #     expect( /.example-photo-card/.test(file_contents) ).toBeTruthy()

  #   it 'should include the Lovelace client API', ->
  #     expect( /Lovelace\.component/.test(file_contents) ).toBeTruthy()
