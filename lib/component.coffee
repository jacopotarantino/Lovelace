'use strict'

module.exports = (component, args, callback) ->
  ui_component = require(component + '/integrations/javascript')

  ui_component.render(args)




  # ui_component = require(component + '/integrations/javascript').new(args)
