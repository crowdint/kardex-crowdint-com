require 'spec_helper'

module BadgesEngine
  describe Level do
    let(:level) { build(:level) }

    it { expect(level).to be_valid }

    context 'validations' do
      it { expect(level).to validate_numericality_of(:tier).only_integer }
    end

    context 'relationships' do
      it { expect(level).to belong_to(:badge) }
    end

    context 'after initialize' do
      it "generates a 1 tier level on initialize" do
        level = BadgesEngine::Level.new
        expect(level.tier).not_to be_nil
      end
    end
  end
end
