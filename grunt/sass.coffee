'use strict'

module.exports =
  all_components:
    files: [{
      expand: true
      src: 'components/**/styles.sass'
      dest: 'dist/'
      ext: '.css'
    }]
