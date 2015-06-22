'use strict'

directory = "#{ __dirname }/../../components/"

# @method Lovelace.component
# @param component [String] path to desired component
# @param args [Object] hash of properties to interpolate into the templates
# @return [String] the markup for the named component
#
module.exports = (component, args) ->
  ui_component = require "#{ directory }#{component}/integrations/node"

  ui_component.render(args)
