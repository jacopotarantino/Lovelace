'use strict'

fs = require('fs')
CoffeeScript = require('coffee-script')
UglifyJS = require('uglify-js')

# @method Lovelace.script
# @param component [String] path to desired component
# @return [String] a script block for the named component
#
module.exports = (component) ->
  directory = @root_component_path
  coffeescript_file = fs.readFileSync(
    "#{ directory }#{ component }/scripts.coffee"
    , 'utf8'
  )
  compiled_file = CoffeeScript.compile coffeescript_file
  compiled_file = UglifyJS.minify(compiled_file, { fromString: true }).code

  "<script>#{compiled_file}</script>"

