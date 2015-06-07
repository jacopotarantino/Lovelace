module Lovelace
    module Buttons

      class Primary
        self.template_file = self.ui_component_path('buttons/primary')

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
