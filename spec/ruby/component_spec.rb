require 'capybara'
require_relative '../../ruby'

describe 'Lovelace.component' do

  context 'with no arguments' do
    it 'should raise an exception' do
      expect{ Lovelace.component }.to raise_error
    end
  end

  context 'with the name of a component' do
    let(:component_name) { 'buttons/primary' }
    let(:text) { 'click me!'}
    let(:args) { { text: text } }
    let(:page) {
      component = Lovelace.component component_name, args
      Capybara::Node::Simple.new component
    }

    it 'should return the html markup for that component' do
      expect( page ).to have_css 'button'
      expect( page ).to have_text text
    end
  end

end
