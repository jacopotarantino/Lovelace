'use strict'

require('coffee-script').register()

module.exports =
  # Returns the markup for a single component
  component: require './lib/client/component'
  # Returns a style block for a single component
  style: require './lib/client/style'
  # Returns a script block for a single component
  script: require './lib/client/script'
  # Returns a script block for a single component
  complete: require './lib/client/complete'
  # Returns all available styles concatenated
  styles: require './lib/client/styles'
  # Returns all available scripts concatenated
  scripts: require './lib/client/scripts'
