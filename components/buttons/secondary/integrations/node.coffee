'use strict'

mustache = require 'mustache'

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
    if options isnt undefined
      Object.keys(options).forEach (key, value) ->
        args[key] = options[key]

    mustache.render template, args
