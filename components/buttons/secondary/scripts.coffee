# 'use strict'

# # adds analytics to all tagged buttons on the page
# track_button_clicks = ->
#   document
#     .getElementsByTagName('body')[0]
#     .addEventListener 'click', (event) ->
#       return unless event.target.className.indexOf('js-track-button') > -1

#       button = event.target
#       title = if button.dataset.title? then button.dataset.title else null
#       window.analytics.track 'Clicked on secondary button',
#         title: title

# # exports a function that initializes the module
# module.exports = ->
#   return unless window?.analytics?

#   track_button_clicks()
