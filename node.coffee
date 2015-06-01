'use strict'

CoffeeScript = require('coffee-script')

CoffeeScript.register()

module.exports =
  # Returns the markup for a single component
  component: require './lib/node/component'
  # Returns a style block for a single component
  style: require './lib/node/style'
  # Returns a script block for a single component
  script: require './lib/node/script'
  # Returns a script block for a single component
  complete: require './lib/node/complete'
  # Returns all available styles concatenated
  styles: require './lib/node/styles'
  # Returns all available scripts concatenated
  scripts: require './lib/node/scripts'
