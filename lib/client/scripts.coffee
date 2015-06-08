'use strict'

window.Lovelace.scripts = ->
  all_scripts = ''
  Object.keys(window.Lovelace.client.scripts).forEach (item, index, array) ->
    all_scripts += window.Lovelace.script item

  all_scripts
