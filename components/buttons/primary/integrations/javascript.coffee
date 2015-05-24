'use strict'

if is_node_app
  mustache = require 'mustache'
else
  mustache = window.Mustache

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
    console.log options
    if options isnt undefined
      args = Object.keys(options).forEach (key, value) ->
        args[key] = options[key]

    mustache.render template, args
