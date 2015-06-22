'use strict'

fs = require('fs')
Sass = require('node-sass')
directory = "#{ __dirname }/../../components/"

# @method Lovelace.style
# @param component [String] path to desired component
# @return [String] a style block for the named component
#
module.exports = (component) ->
  file_path = "#{ directory }#{ component }/styles.sass"
  compiled_file = Sass.renderSync( file: file_path )
  "<style>#{compiled_file.css}</style>"

