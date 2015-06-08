'use strict'

window.Lovelace.script = (component) ->
  script = window.Lovelace.client.scripts[component]

  return "<script>#{script}</script>"
