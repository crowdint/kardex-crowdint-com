require 'spec_helper'

describe UsersHelper do
  describe '#position' do
    it 'returns the name of the position' do
      @position = Fabricate(:position)
      expect(helper.position).to eq(@position.name)
    end
  end
end
