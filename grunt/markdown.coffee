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
      markdownOptions:
        gfm: true
        highlight: 'auto'
    #     codeLines:
    #       before: '<span>'
    #       after: '</span>'
    #   template: 'myTemplate.jst'
    #   preCompile: function(src, context) {}
    #   postCompile: function(src, context) {}
    #   templateContext: {}
    #   contextBinder: false
    #   contextBinderMark: '@@@'
    #   autoTemplate: true
    #   autoTemplateFormat: 'jst'
