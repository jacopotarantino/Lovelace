'use strict'

module.exports =
  compile_scripts_for_client:
    options:
      join: false
      sourceMap: true
    files: [{
      expand: true
      flatten: false
      src: 'components/**/scripts.coffee'
      dest: 'dist'
      ext: '.js'
    }]

  compile_api_for_client:
    options:
      join: false
      sourceMap: true
    files: [{
      expand: true
      flatten: false
      src: 'lib/client/**/*.coffee'
      dest: 'dist'
      ext: '.js'
    }]
