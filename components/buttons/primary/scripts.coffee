'use strict'

window.PrimaryButtonAnalytics = {}

# adds analytics to all tagged buttons on the page
window.PrimaryButtonAnalytics.track_button_clicks = ->
  document
    .getElementsByTagName('body')[0]
    .addEventListener 'click', (event) ->
      return unless event.target.className.indexOf('js-track-button') > -1

      button = event.target
      title = if button.dataset.title? then button.dataset.title else null
      window.analytics.track 'Clicked on primary button',
        title: title

# exports a function that initializes the module
window.PrimaryButtonAnalytics.init = ->
  return unless window?.analytics?

  window.PrimaryButtonAnalytics.track_button_clicks()
