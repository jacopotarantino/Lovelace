require 'capybara'
require_relative '../../lib/lovelace'

describe 'Lovelace.styles' do

  context 'by default' do
    let(:styles) {
      Lovelace.init({ root_component_path: "#{Dir.pwd}/components" })
      Lovelace.styles
    }
    let( :page ) {
      Capybara::Node::Simple.new styles
    }

    it 'should output all available style files' do
      expect( page ).to have_text 'button--primary'
      expect( page ).to have_text 'button--secondary'
    end
  end

end
