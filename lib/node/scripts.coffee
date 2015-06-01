'use strict'

fs = require('fs')
CoffeeScript = require('coffee-script')

# finds all files in a directory
get_files = (dir, files_) ->
  files_ ?= []
  files = fs.readdirSync(dir)

  for filename in files
    do (filename) ->
      name = dir + '/' + filename
      if fs.statSync(name).isDirectory()
        get_files name, files_
      else
        files_.push name

  return files_

generate_compiled_file = (path) ->
  coffeescript_file = fs.readFileSync(path, 'utf8')
  compiled_file = CoffeeScript.compile coffeescript_file

  return "<script>#{compiled_file}</script>"


module.exports = ->
  script_files = get_files('./components').filter (item) ->
    return item.indexOf('scripts.coffee') isnt -1

  script_files
    .map (script_file) ->
      generate_compiled_file script_file
    .join('')
