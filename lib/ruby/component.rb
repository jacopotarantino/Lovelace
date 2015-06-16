module Lovelace

  def self.component(component_name, args = {})
    require "./components/#{component_name}/integrations/ruby"

    # We don't want people needing to do their own escaping in templates
    if defined? Rails
      # Take in the component name, transform it into a class reference
      # and render the component with given arguments.
      component_abstraction(component_name).new(args).render.html_safe
    else
      component_abstraction(component_name).new(args).render
    end
  end


  private

    # Finds the abstraction for that particular component.
    def self.component_abstraction(component_name)
      constantize camelize underscore "lovelace/#{component_name}"
    end

    # downcases string, replaces camelcase with snake case.
    def self.underscore(term)
      term
        .gsub(/([A-Z]+)([A-Z][a-z])/,'\1_\2')
        .gsub(/([a-z\d])([A-Z])/,'\1_\2')
        .tr("-", "_")
        .downcase
    end

    # takes a snake_case path and returns a class-case constant name
    def self.camelize(term)
      term
        .capitalize
        .gsub( /([\/_])([a-z])/) { |match|
          "#{$1}#{$2.upcase}"
        }
        .gsub(/_/, '')
        .gsub(/\//, '::')
    end

    # takes a constant name and returns a reference to that constant
    def self.constantize(term)
      names = term.split('::')

      # Trigger a built-in NameError exception including the ill-formed constant in the message.
      Object.const_get(term) if names.empty?

      # Remove the first blank element in case of '::ClassName' notation.
      names.shift if names.size > 1 && names.first.empty?

      names.inject(Object) do |constant, name|
        if constant == Object
          constant.const_get(name)
        else
          candidate = constant.const_get(name)
          next candidate if constant.const_defined?(name, false)
          next candidate unless Object.const_defined?(name)

          # Go down the ancestors to check if it is owned directly. The check
          # stops when we reach Object or the end of ancestors tree.
          constant = constant.ancestors.inject do |const, ancestor|
            break const if ancestor == Object
            break ancestor if ancestor.const_defined?(name, false)
            const
          end

          # owner is in Object, so raise
          constant.const_get(name, false)
        end
      end
    end

end
