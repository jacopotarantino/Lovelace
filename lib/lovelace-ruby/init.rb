module Lovelace
  @root_component_path = './components'

  def self.init(options)
    @root_component_path = normalize_component_path(options[:root_component_path])

    self
  end

  def self.root_component_path
    @root_component_path
  end

  private
    def self.normalize_component_path(path)
      unless /\/$/ =~ path
        path = "#{path}/"
      end

      path
    end
end
