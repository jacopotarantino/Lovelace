'use strict'

fs = require('fs')
UglifyJS = require('uglify-js')

# @method Lovelace.script
# @param component [String] path to desired component
# @return [String] a script block for the named component
#
module.exports = (component) ->
  directory = @root_component_path
  file = fs.readFileSync(
    "#{ directory }#{ component }/scripts.js"
    , 'utf8'
  )
  compiled_file = UglifyJS.minify(file, { fromString: true }).code

  "<script>#{compiled_file}</script>"

