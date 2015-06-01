'use strict'

fs = require('fs')
CoffeeScript = require('coffee-script')

module.exports = (component) ->
  coffeescript_file = fs.readFileSync("components/#{component}/scripts.coffee", 'utf8')
  compiled_file = CoffeeScript.compile coffeescript_file

  "<script>#{compiled_file}</script>"

