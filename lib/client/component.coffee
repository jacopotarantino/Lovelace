'use strict'

module.exports = (component, args, callback) ->
  ui_component = require "../components/#{component}/integrations/node"

  ui_component.render(args)
