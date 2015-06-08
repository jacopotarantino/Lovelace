'use strict'

window.Lovelace.complete = (component, options) ->
  style = window.Lovelace.style(component)
  template = window.Lovelace.component(component, options)
  script = window.Lovelace.script(component)

  return "#{ style }#{ template }#{ script }"
