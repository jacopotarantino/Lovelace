'use strict'

mustache = require 'mustache'
fs = require 'fs'

args =
  tag: 'button'
  disabled: false
  block: false
  custom_classes: ''
  url: false
  text: ''

template = fs.readFileSync "#{__dirname}/../template.mustache", 'utf8'

module.exports =
  render: (options) ->
    final_args = {}
    Object.keys(args).forEach (key, value) ->
      final_args[key] = args[key]

    if options isnt undefined
      Object.keys(options).forEach (key, value) ->
        final_args[key] = options[key]

    mustache.render template, final_args
