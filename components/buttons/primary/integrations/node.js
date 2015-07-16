'use strict'
var args, fs, mustache, template

mustache = require('mustache')

fs = require('fs')

args = {
  tag: 'button',
  disabled: false,
  block: false,
  custom_classes: '',
  url: false,
  text: ''
}

template = fs.readFileSync(__dirname + '/../template.mustache', 'utf8')

module.exports = {
  render: function (options) {
    var final_args
    final_args = {}
    Object.keys(args).forEach(function (key, value) {
      final_args[key] = args[key]
    })
    if (options !== void 0) {
      Object.keys(options).forEach(function (key, value) {
        final_args[key] = options[key]
      })
    }
    return mustache.render(template, final_args)
  }
}
