require 'mustache'

module Lovelace
  module Buttons

    class Primary < Mustache
      self.template_file = "#{ File.dirname(__FILE__) }/../template.mustache"

      def initialize(parameters = {})
        @parameters = parameters
      end

      def tag
        "#{@parameters[:tag] || 'button'}"
      end

      def disabled
        @parameters[:disabled] || false
      end

      def block
        @parameters[:block] || false
      end

      def url
        "#{@parameters[:url]}"
      end

      def text
        "#{@parameters[:text]}"
      end
    end

  end
end
