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
      'build_client_files'
      'concurrent:test'
      'codeclimate'
      'cssmetrics'
    ]

  grunt.registerTask 'build_client_files', 'creates final js for client', ->
    grunt.task.run [
      'clean'
      'sass:all_components'
      'concat:styles_file'
      # 'insert mustache dependency'
      # 'combine scripts'
      # 'combine templates'
    ]
