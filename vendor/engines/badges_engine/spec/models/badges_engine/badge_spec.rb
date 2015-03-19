require 'spec_helper'

describe BadgesEngine::Badge do
  let(:badge) { Fabricate.build :badge }

  it { expect(badge).to be_valid }

  context 'validations' do
    it { expect(badge).to validate_presence_of(:name) }
    it { expect(badge).to validate_uniqueness_of(:name) }
  end

  context 'relationships' do
    it { expect(badge).to belong_to(:award) }
    it { expect(badge).to belong_to(:value) }
    it { expect(badge).to have_many(:levels) }
  end

  describe '.by_letter' do
    before do
      %w(abajo boca diente yolo xenoblade peach zala).each do |name|
        Fabricate :badge, name: name
      end
    end

    %w(a b d y x p z).each do |letter|
      it "returns all badges with letter #{ letter }" do
        expect(BadgesEngine::Badge.by_letter(letter).count).to eq 1
      end
    end
  end
end
