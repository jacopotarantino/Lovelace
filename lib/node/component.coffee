'use strict'

module.exports = (component, args) ->
  ui_component = require "../../components/#{component}/integrations/node"

  ui_component.render(args)
