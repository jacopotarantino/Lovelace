module Lovelace

  def self.complete(component_name, args = {})
    styles = Lovelace.style component_name
    markup = Lovelace.component component_name, args
    scripts = Lovelace.script component_name

    markup = "#{ styles }#{ markup }#{ scripts }"

    if defined? Rails
      markup.html_safe
    else
      markup
    end
  end

end
