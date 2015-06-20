require 'coffee-script'

module Lovelace

  def self.script(component_name, args = {})
    components_directory = "#{ File.dirname(__FILE__) }/../../components/"
    file = File.read "#{ components_directory }#{component_name}/scripts.coffee"
    rendered = CoffeeScript.compile file
    markup = "<script>#{ rendered }</script>"

    if defined? Rails
      markup.html_safe
    else
      markup
    end
  end

end
