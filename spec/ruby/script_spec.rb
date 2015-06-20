require 'capybara'
require_relative '../../lib/lovelace'

describe 'Lovelace.script' do

  context 'with no arguments' do
    it 'should raise an exception' do
      expect{ Lovelace.script }.to raise_error ArgumentError
    end
  end

  context 'with the name of a component' do
    let(:component_name) { 'buttons/primary' }
    let(:page) {
      component = Lovelace.script component_name
      Capybara::Node::Simple.new component
    }

    it 'should return a script block with the markup' do
      # @TODO flaky. should use real CSS selectors and a different
      # capybara::page call or something.
      expect( page ).to have_text 'use strict'
    end
  end

end
