'use strict'

window.Lovelace.styles = ->
  all_styles = ''
  Object.keys(window.Lovelace.client.styles).forEach (item, index, array) ->
    all_styles += window.Lovelace.style item

  all_styles
