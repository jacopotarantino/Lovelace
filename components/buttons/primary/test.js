/* global describe, it, expect, beforeEach, spyOn, jasmine */
'use strict'

describe('buttons/primary', function () {
  beforeEach(function () {
    spyOn(window.PrimaryButtonAnalytics, 'track_button_clicks')
    window.analytics = jasmine.createSpyObj('analytics', ['track'])
  })

  it('should render a button client-side', function () {
    window.PrimaryButtonAnalytics.init()

    expect(typeof window.PrimaryButtonAnalytics.init).toBe('function')
    expect(window.PrimaryButtonAnalytics.track_button_clicks).toHaveBeenCalled()
  })
})
