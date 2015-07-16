module Lovelace
  def self.scripts
    files = Dir["#{ @root_component_path }**/scripts.js"]

    markup = '<script>'
    files.each do |file|
      markup += File.read(file)
    end
    markup += '</script>'

    if defined? Rails
      markup.html_safe
    else
      markup
    end
  end

end
