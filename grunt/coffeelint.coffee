'use strict'

module.exports =
  options:
    'no_trailing_whitespace':
      'level': 'error'
  all: [
    'components/**/*.coffee'
    'grunt/**/*.coffee'
    'lib/**/*.coffee'
    'spec/**/*.coffee'
    'Gruntfile.coffee'
  ]

