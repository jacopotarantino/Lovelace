'use strict'

is_node_app = ( typeof require is 'function' )

if is_node_app
  Lovelace = require('../index')
