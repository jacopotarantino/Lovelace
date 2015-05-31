'use strict'

module.exports = (component, args) ->
  ui_component = Lovelace.integrations(component)

  ui_component.render(args)

