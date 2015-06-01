'use strict'

fs = require('fs')

module.exports = (component) ->






'use strict'

fs = require('fs')
Sass = require('node-sass')

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
  compiled_file = Sass.renderSync( file: path )
  return compiled_file.css


module.exports = ->
  sass_files = get_files('./components').filter (item) ->
    return item.indexOf('styles.sass') isnt -1

  css = sass_files
    .map (sass_file) ->
      generate_compiled_file sass_file
    .join('')

  return "<style>#{css}</style>"
