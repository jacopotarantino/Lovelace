'use strict'

window.PrimaryButtonAnalytics = {}

window.PrimaryButtonAnalytics.track_button_clicks = function () {
  document
    .getElementsByTagName('body')[0]
    .addEventListener('click', function (event) {
      var button, title

      if (!(event.target.className.indexOf('js-track-button') > -1)) {
        return
      }

      button = event.target
      title = button.dataset.title != null ? button.dataset.title : null

      window.analytics.track('Clicked on primary button', {
        title: title
      })
    })
}

window.PrimaryButtonAnalytics.init = function () {
  if ((typeof window !== 'undefined' && window !== null ? window.analytics : void 0) == null) {
    return
  }
  window.PrimaryButtonAnalytics.track_button_clicks()
}
