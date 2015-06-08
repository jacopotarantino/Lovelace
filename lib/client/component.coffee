'use strict'

mustache = window.Mustache

window.Lovelace.component = (component, options) ->
  template = window.Lovelace.client.component_templates[component]
  mustache.render component, options
