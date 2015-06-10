'use strict'

mustache = window.Mustache

window.Lovelace.component = (component, options) ->
  template = window.Lovelace.client.templates[component]
  mustache.render template, options
