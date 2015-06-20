module Lovelace
  require 'coffee-script'

  def self.scripts
    files = Dir['./components/**/scripts.coffee']

    markup = '<script>'
    files.each do |file|
      markup += CoffeeScript.compile File.read(file)
    end
    markup += '</script>'

    if defined? Rails
      markup.html_safe
    else
      markup
    end
  end

end
