require 'capybara'
require_relative '../../lib/lovelace'

describe 'Lovelace.style' do

  context 'with no arguments' do
    it 'should raise an exception' do
      expect{ Lovelace.style }.to raise_error ArgumentError
    end
  end

  context 'with the name of a component' do
    let(:component_name) { 'buttons/primary' }
    let(:page) {
      Lovelace.init({ root_component_path: "#{Dir.pwd}/components" })
      component = Lovelace.style component_name
      Capybara::Node::Simple.new component
    }

    it 'should return a style block with the markup' do
      expect( page ).to have_text 'button'
    end
  end

end
