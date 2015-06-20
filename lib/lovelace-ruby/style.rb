require 'sass'

module Lovelace

  def self.style(component_name, args = {})
    components_directory = "#{ File.dirname(__FILE__) }/../../components/"
    file = File.read "#{ components_directory }#{component_name}/styles.sass"
    rendered = Sass::Engine.new(file).render
    markup = "<style>#{ rendered }</style>"

    if defined? Rails
      markup.html_safe
    else
      markup
    end
  end

end
