require 'capybara'
require_relative '../../lib/lovelace'

describe 'Lovelace.scripts' do

  context 'with no arguments' do
    let(:page) {
      Lovelace.init({ root_component_path: "#{Dir.pwd}/components" })
      component = Lovelace.scripts
      Capybara::Node::Simple.new component
    }

    it 'should return a script block with all the scripts' do
      # @todo this needs to actually detect multiple scripts.
      expect( page ).to have_text 'function'
    end
  end

end
