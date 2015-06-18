require 'capybara'
require_relative '../../lovelace'

describe 'Lovelace.styles' do

  context 'by default' do
    let(:styles) { Lovelace.styles }
    let( :page ) {
      Capybara::Node::Simple.new styles
    }

    it 'should output all available style files' do
      expect( page ).to have_text 'button--primary'
      expect( page ).to have_text 'button--secondary'
    end
  end

end
