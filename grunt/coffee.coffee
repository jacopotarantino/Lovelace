'use strict'

module.exports =
  compile_for_client:
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
