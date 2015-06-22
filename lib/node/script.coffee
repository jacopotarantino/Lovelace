'use strict'

fs = require('fs')
CoffeeScript = require('coffee-script')
directory = "#{ __dirname }/../../components/"

# @method Lovelace.script
# @param component [String] path to desired component
# @return [String] a script block for the named component
#
module.exports = (component) ->
  coffeescript_file = fs.readFileSync(
    "#{ directory }#{ component }/scripts.coffee"
    , 'utf8'
  )
  compiled_file = CoffeeScript.compile coffeescript_file

  "<script>#{compiled_file}</script>"

