'use strict'

fs = require('fs')
CoffeeScript = require('coffee-script')

# @function get_files
# @param dir [String] path to folder to search
# @param files_ [Array] existing list of found files
# @return [Array] all the files found in that directory
#
get_files = (dir, files_) ->
  files_ ?= []
  files = fs.readdirSync(dir)

  for filename in files
    do (filename) ->
      name = dir + '/' + filename
      # if the current file is a directory, recurse into it to find mor files
      if fs.statSync(name).isDirectory()
        get_files name, files_
      # otherwise just add the file to the list
      else
        files_.push name

  #eventually return the full list of files
  return files_

# @function generate_compiled_file
# @param path [String] path to the coffeescript file to read
# @return [String] html script block containing the referenced file
#
generate_compiled_file = (path) ->
  coffeescript_file = fs.readFileSync(path, 'utf8')
  compiled_file = CoffeeScript.compile coffeescript_file

  return "<script>#{compiled_file}</script>"

# @method Lovelace.scripts
# @return [String] the complete scripts for all components
#
module.exports = ->
  script_files = get_files('./components').filter (item) ->
    return item.indexOf('scripts.coffee') isnt -1

  script_files
    .map (script_file) ->
      generate_compiled_file script_file
    .join('')
