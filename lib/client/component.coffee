'use strict'

window.Lovelace.client.component_template = class Component
  constructor: (@component, @args, @options) ->

  render: ->
    template = window.Lovelace.client.template @component

    if @options isnt undefined
      Object.keys(@options).forEach (key, value) ->
        @args[key] = @options[key]

    window.Mustache.render template, args


window.Lovelace.component = (component, options) ->
  ui_component = Lovelace.client.integration component, @args, @options

  ui_component.render()
