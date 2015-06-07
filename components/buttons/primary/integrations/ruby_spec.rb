require 'capybara/rspec/matchers'
require_relative 'ruby'

puts Lovelace.class

describe 'Lovelace::Buttons::Primary' do

  context 'with no arguments' do
    let(:page) {
      template = Lovelace::Buttons::Primary.new
      rendered = template.render

      Capybara::Node::Simple.new(rendered)
    }

    it 'should still render a button' do
      expect( page ).to have_css 'button'
    end
  end

  # describe '.tag' do
  #   it 'changes the element of the button' do
  #     properties = {
  #       tag: 'a'
  #     }
  #     button = TheKnotLayout::UiComponents::Buttons::Primary.new(properties)
  #     rendered = button.render

  #     expect( rendered ).to match('<a')
  #     expect( rendered ).to match('</a>')
  #   end
  # end

  # describe '.disabled' do
  #   it 'adds the disabled attribute and class' do
  #     properties = {
  #       disabled: true
  #     }
  #     button = TheKnotLayout::UiComponents::Buttons::Primary.new(properties)
  #     rendered = button.render

  #     expect( rendered ).to match(/class="[^"]*?disabled.*"/)
  #   end
  # end

  # describe '.block' do
  #   it 'adds the btn-block class' do
  #     properties = {
  #       block: true
  #     }
  #     button = TheKnotLayout::UiComponents::Buttons::Primary.new(properties)
  #     rendered = button.render

  #     expect( rendered ).to match(/class="[^"]*?btn-block.*"/)
  #   end
  # end

  # describe '.url' do
  #   it 'sets a url on the link' do
  #     properties = {
  #       url: '/foobar'
  #     }
  #     button = TheKnotLayout::UiComponents::Buttons::Primary.new(properties)
  #     rendered = button.render

  #     expect( rendered ).to match('href="/foobar"')
  #   end
  # end

  # describe '.text' do
  #   it 'adds text to the button' do
  #     properties = {
  #       text: 'yo yo ma'
  #     }
  #     button = TheKnotLayout::UiComponents::Buttons::Primary.new(properties)
  #     rendered = button.render

  #     expect( rendered ).to match(/>\s*yo yo ma\s*<\//)
  #   end
  # end


end
