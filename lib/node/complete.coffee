'use strict'

# @method Lovelace.complete
# @param component [String] path to desired component
# @param args [Object] hash of properties to interpolate into the templates
# @return [String] the complete styles, markup and scripts for a component
#
module.exports = (component, args) ->
  style_markup = @style component
  html_markup = @component component, args
  script_markup = @script component

  "#{style_markup}#{html_markup}#{script_markup}"
