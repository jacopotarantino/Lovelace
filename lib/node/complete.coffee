'use strict'

module.exports = (component, args) ->
  style_markup = require('./style')(component)
  html_markup = require('./component')(component, args)
  script_markup = require('./script')(component)

  "#{style_markup}#{html_markup}#{script_markup}"
