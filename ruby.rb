module Lovelace

  def component(component_name, args = {})
    require "./components/#{component_name}/integrations/ruby"

    component_name.componentize.new(args).render.html_safe
  end

end
