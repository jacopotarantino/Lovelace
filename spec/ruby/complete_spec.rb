require 'capybara'
require_relative '../../lib/lovelace'

describe 'Lovelace.complete' do

  context 'with all arguments' do
    let(:args) { { text: 'Click me!' } }
    let(:complete) {
      Lovelace.init({ root_component_path: "#{Dir.pwd}/components" })
      Lovelace.complete('buttons/primary', args)
    }
    let( :page ) {
      Capybara::Node::Simple.new complete
    }

    it 'should output style, markup and script blocks' do
      expect( page ).to have_text 'button--primary'
      expect( page ).to have_text 'function'
      expect( page ).to have_text 'Click me!'
    end
  end

end
