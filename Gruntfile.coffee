'use strict'

module.exports = (grunt) ->

  # output grunt task exec time
  require('time-grunt') grunt

  #  Load all config files
  require('load-grunt-config') grunt,
    #  Load all grunt npm tasks as needed
    jitGrunt:
      staticMappings:
        'validate-shrinkwrap': 'grunt-nsp-shrinkwrap'
        'cssmetrics': 'grunt-css-metrics'
        'codeclimate': 'grunt-codeclimate-reporter'
        'warn_friday': 'grunt-warn-friday'

  grunt.registerTask 'test', 'runs the test suite', ->
    grunt.task.run [
      'coffeelint'
      'karma'
      'codeclimate'
      'validate-shrinkwrap'
      'warn_friday'
      'cssmetrics'
    ]
