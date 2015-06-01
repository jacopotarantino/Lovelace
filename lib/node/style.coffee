'use strict'

fs = require('fs')
Sass = require('node-sass')

module.exports = (component) ->
  compiled_file = Sass.renderSync( file: "components/#{component}/styles.sass" )
  "<style>#{compiled_file.css}</style>"

