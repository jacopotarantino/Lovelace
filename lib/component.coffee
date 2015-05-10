'use strict'

mustache = require 'mustache'

module.exports = (component, args, callback) ->
  if fs?
    # we're in server-side javascript
    template = fs.readFileSync "../components/#{component}/template.mustache", 'utf8'
    return mustache.render template, args

  else
    # no filesystem access. go for component server

