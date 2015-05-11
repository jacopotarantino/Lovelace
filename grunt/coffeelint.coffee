'use strict'

module.exports =
  options:
    'no_trailing_whitespace':
      'level': 'error'
  all: [
    '**/*.coffee'
    '!node_modules/**/*.coffee'
    '!coverage/**/*.coffee'
  ]

