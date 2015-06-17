require 'coffee-script'

module Lovelace

  def self.script(component_name, args = {})
    file = File.read "./components/#{component_name}/scripts.coffee"
    rendered = CoffeeScript.compile file
    markup = "<script>#{ rendered }</script>"

    if defined? Rails
      markup.html_safe
    else
      markup
    end
  end

end
