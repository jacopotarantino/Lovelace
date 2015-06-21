'use strict'

fs = require('fs')
Sass = require('node-sass')

# @method Lovelace.style
# @param component [String] path to desired component
# @return [String] a style block for the named component
#
module.exports = (component) ->
  compiled_file = Sass.renderSync( file: "components/#{component}/styles.sass" )
  "<style>#{compiled_file.css}</style>"

