'use strict'

warning = 'node_modules/grunt-warn-friday/templates/deploy_friday.txt'
ok = 'node_modules/grunt-warn-friday/templates/all_ok.txt'

module.exports =
  options:
    warningTemplate: warning
    okTemplate: ok
  prod: {}
