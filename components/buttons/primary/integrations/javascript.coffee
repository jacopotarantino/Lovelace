'use strict'

mustache = require 'mustache'

args =
  tag: 'button'
  disabled: false
  block: false
  custom_classes: ''
  url: false
  text: ''

template = fs.readFileSync '../template.mustache', 'utf8'

module.exports =
  render: (options) ->
    args = Object.keys(args).forEach (key, value) ->
      args[key] = value

    mustache.render template, args
