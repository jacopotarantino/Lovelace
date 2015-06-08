'use strict'

module.exports =
  styles_file:
    src: [ 'dist/**/styles.css' ]
    dest: 'dist/styles.css'

  all_client_files:
    src: [
      'bower_components/mustache/mustache.js'
      'dist/client_templates.js'
      'dist/client_styles.js'
      'dist/client_scripts.js'
      'dist/client_api.js'
    ]
    dest: 'dist/client.js'
