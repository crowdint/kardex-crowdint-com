require 'spec_helper'

describe ProposeBadgesHelper do
  describe '#value_name' do
    context 'value is not nil' do
      let(:value) { Fabricate.build :value }

      it { expect(helper.value_name value).to eq value.name }
    end

    context 'value is nil' do
      it { expect(helper.value_name nil).to eq nil }
    end
  end
end
