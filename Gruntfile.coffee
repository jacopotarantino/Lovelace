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
      'standard'
      'cssmetrics'
    ]

  grunt.registerTask 'run_ruby_tests', 'runs rspec', ->
    done = @async()

    grunt.util.spawn
      cmd: 'bundle'
      args: [ 'exec', 'rspec' ]
      opts: stdio: 'inherit'
    , (error, result, code) ->
      if code
        grunt.fail.fatal 'Ruby tests failed'
        return done()

      grunt.log.ok('Ruby tests passed')
      done()

  grunt.registerTask 'build_client_files', 'creates final js for client', ->
    grunt.task.run [
      'clean'
      'documentation'
      'sass:all_components'
      # 'coffee:compile_scripts_for_client'
      'build_client_templates'
      'build_client_styles'
      'build_client_scripts'
      'build_client_api'
      'concat:all_client_files'
    ]

  ##
  # The tasks below are all for building client files and should not be
  # consumed directly. Consider them as private methods.
  #

  ##
  # @method build_client_templates
  # @option root_components_directory {String} path to the components directory
  # @example grunt build_client_templates --root_component_path=components/
  #
  grunt.registerTask 'build_client_templates', 'create js for templates', ->
    components_directory = grunt.option('root_component_path')
    unless /\/$/.test(components_directory)
      components_directory += '/'
    template_file_glob = "#{ components_directory }**/template.mustache"

    full_file = [
      ';(function() {',
      'window.Lovelace = window.Lovelace || {};',
      'window.Lovelace.client = window.Lovelace.client || {};',
      'window.Lovelace.client.templates = ',
      'window.Lovelace.client.templates || {};'
    ].join('')
    file_paths = grunt.file.expand [ template_file_glob ]

    file_paths.forEach (item, index, array) ->
      file = grunt.file.read(item, 'utf8')
        .replace(/\n|\r/g, '')
        .replace(/'/g, "\\'")
      component_name = /components\/(.+?)\/template.mustache/.exec( item )[1]
      root_object = 'window.Lovelace.client.templates'
      full_file += "#{ root_object }['#{ component_name }'] = '#{ file }';"

    full_file += '})();'

    grunt.file.write 'dist/client_templates.js', full_file


  grunt.registerTask 'build_client_styles', 'create js for styles', ->
    full_file = [
      'window.Lovelace.client.styles = window.Lovelace.client.styles || {};'
    ].join('')

    file_paths = grunt.file.expand [ 'dist/components/**/styles.css' ]

    file_paths.forEach (item, index, array) ->
      file = grunt.file.read(item, 'utf8').replace(/\n|\r/g, '')
      component_name = /components\/(.+?)\/styles.css/.exec( item )[1]
      root_object = 'window.Lovelace.client.styles'
      full_file += "#{ root_object }['#{ component_name }'] = '#{ file }';"

    grunt.file.write 'dist/client_styles.js', full_file


  grunt.registerTask 'build_client_scripts', 'create js for scripts', ->
    full_file = [
      'window.Lovelace.client.scripts = window.Lovelace.client.scripts || {};'
    ].join('')

    file_paths = grunt.file.expand [ 'dist/components/**/scripts.js' ]

    file_paths.forEach (item, index, array) ->
      file = grunt.file.read(item, 'utf8')
        .replace(/\n|\r/g, '')
        .replace(/\/\/.*$/g, '')
        .replace(/"/g, '\\"')
      component_name = /components\/(.+?)\/scripts.js/.exec( item )[1]
      root_object = 'window.Lovelace.client.scripts'
      full_file += "#{ root_object }['#{ component_name }'] = \"#{ file }\";"


    grunt.file.write 'dist/client_scripts.js', full_file

  grunt.registerTask 'build_client_api', 'create api for client scripts', ->
    grunt.task.run [
      'coffee:compile_api_for_client'
      'concat:client_api'
    ]
