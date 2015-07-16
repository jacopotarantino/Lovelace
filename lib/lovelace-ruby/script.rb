module Lovelace

  def self.script(component_name, args = {})
    components_directory = @root_component_path
    file = File.read "#{ components_directory }#{component_name}/scripts.js"
    markup = "<script>#{ file }</script>"

    if defined? Rails
      markup.html_safe
    else
      markup
    end
  end

end
