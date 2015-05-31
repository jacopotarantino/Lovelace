'use strict'

mustache = window.Mustache

args =
  tag: 'button'
  disabled: false
  block: false
  custom_classes: ''
  url: false
  text: ''

module.exports =
  new window.Lovelace.client.component_template component, args, options
