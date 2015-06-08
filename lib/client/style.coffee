'use strict'

window.Lovelace.style = (component) ->
  style = window.Lovelace.client.styles[component]

  return "<style>#{style}</style>"
