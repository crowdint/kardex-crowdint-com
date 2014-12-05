require 'spec_helper'

module BadgesEngine
  describe Award do
    let(:award) { build(:award) }

    it { expect(award).to be_valid }

    context 'validations' do
      it { expect(award).to validate_presence_of(:title) }
    end

    context 'relationships' do
      it { expect(award).to have_many(:badges) }
    end
  end
end
