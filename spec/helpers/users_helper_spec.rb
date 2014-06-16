require 'spec_helper'

describe 'UsersHelper' do
  let(:position) { Fabricate(:position) }

  describe '#position' do
    it 'returns the name of the position' do
      @user = Fabricate(:user, position: position)
      expect(helper.position).to eq(position.name)
    end
  end
end
