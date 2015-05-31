'use strict'

module.exports =
  compile_for_client:
    options:
      join: false
      sourceMap: true
    files:
      'build/client.js': [
        'lib/client/*.coffee'
        'components/**/scripts.coffee'
      ]
