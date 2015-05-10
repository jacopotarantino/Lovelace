'use strict'

# adds analytics to all tagged buttons on the page
track_button_clicks = ->
  document
    .getElementsByTagName('body')[0]
    .addEventListener 'click', (event) ->
      return unless event.target.className.indexOf('js-track-button') > -1

      button = event.target
      window.analytics.track 'Clicked on button',
        button_title: button.dataset.title? ? button.dataset.title : null

# exports a function that initializes the module
module.exports = ->
  return unless window?.analytics?

  track_button_clicks()
