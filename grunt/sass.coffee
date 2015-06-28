'use strict'

module.exports =
  options:
    outputStyle: 'compressed'
  all_components:
    files: [{
      expand: true
      src: 'components/**/styles.sass'
      dest: 'dist/'
      ext: '.css'
    }]
