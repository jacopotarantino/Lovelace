module Lovelace
  require 'sass'

  def self.styles
    files = Dir["#{ @root_component_path }**/styles.sass"]

    markup = '<style>'
    files.each do |file|
      markup += Sass::Engine.new( File.read(file) ).render
    end
    markup += '</style>'

    if defined? Rails
      markup.html_safe
    else
      markup
    end
  end

end
