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
        'jasmine_node': 'grunt-jasmine-node'

  grunt.registerTask 'documentation', 'builds the docs', ->
    grunt.task.run [
      'markdown'
    ]

  grunt.registerTask 'test', 'runs the test suite', ->
    grunt.task.run [
      'markdown'
      'coffeelint'
      'jasmine_node'
      'karma'
      'codeclimate'
      'validate-shrinkwrap'
      'warn_friday'
      'cssmetrics'
    ]

  grunt.registerTask 'build-client-file', 'creates final js for client', ->
    grunt.task.run [
      'insert mustache dependency'
      'combine scripts'
      'combine templates'
    ]
