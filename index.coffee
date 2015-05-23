'use strict'

require('coffee-script').register()

module.exports =
  # Returns the markup for a single component
  component: require './lib/component'
  # Returns a style block for a single component
  style: require './lib/style'
  # Returns a script block for a single component
  script: require './lib/script'
  # Returns a script block for a single component
  complete: require './lib/complete'
  # Returns all available styles concatenated
  styles: require './lib/styles'
  # Returns all available scripts concatenated
  scripts: require './lib/scripts'
