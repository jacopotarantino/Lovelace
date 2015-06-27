'use strict'

# @method Lovelace.init
# @param options [Object] hash of initialization options
#
module.exports = (options) ->
  # normalize the root component path to have a slash at the end
  unless /\/$/.test options.root_component_path
    options.root_component_path += '/'

  @root_component_path = options.root_component_path
  return this
