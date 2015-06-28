require_relative '../../lib/lovelace'

describe 'Lovelace.init' do

  context 'with no arguments' do
    it 'should raise an exception' do
      expect{ Lovelace.init }.to raise_error ArgumentError
    end
  end

  context 'with the path to a component directory' do
    let(:path_name) { Dir.pwd + '/silly-components/' }
    let(:args) { { root_component_path: path_name } }
    let(:return_value) {
      Lovelace.init args
      Lovelace.root_component_path
    }

    it 'should set the path as an instance variable accessible by the root_component_path method' do
      expect( return_value ).to equal path_name
    end
  end

  context 'with the path to a component directory' do
    let(:path_name) { Dir.pwd + '/silly-components' }
    let(:args) { { root_component_path: path_name } }
    let(:return_value) {
      Lovelace.init args
      Lovelace.root_component_path
    }

    it 'should normalize a path without a trailing slash' do
      expect( return_value ).to eq path_name + '/'
    end
  end

end
