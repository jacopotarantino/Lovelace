'use strict'

module.exports =
  all:
    files: [
      {
        expand: true
        src: 'components/**/*.md'
        dest: 'dist/'
        ext: '.html'
      }
    ]
    options:
      template: 'lib/styleguide_template.jst'
      markdownOptions:
        gfm: true
        highlight: 'auto'
    #     codeLines:
    #       before: '<span>'
    #       after: '</span>'
    #   preCompile: function(src, context) {}
    #   postCompile: function(src, context) {}
    #   templateContext: {}
    #   contextBinder: false
    #   contextBinderMark: '@@@'
    #   autoTemplate: true
    #   autoTemplateFormat: 'jst'
