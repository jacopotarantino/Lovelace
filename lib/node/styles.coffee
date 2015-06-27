'use strict'

fs = require('fs')
Sass = require('node-sass')

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
      if fs.statSync(name).isDirectory()
        get_files name, files_
      else
        files_.push name

  return files_

# @function generate_compiled_file
# @param path [String] path to the sass file to read
# @return [String] html script block containing the referenced file
#
generate_compiled_file = (path) ->
  compiled_file = Sass.renderSync( file: path )
  return compiled_file.css

# @method Lovelace.styles
# @return [String] a style block with markup for all available components
#
module.exports = ->
  directory = @root_component_path
  sass_files = get_files( directory ).filter (item) ->
    return item.indexOf( 'styles.sass' ) isnt -1

  css = sass_files
    .map (sass_file) ->
      generate_compiled_file sass_file
    .join('')

  return "<style>#{css}</style>"
