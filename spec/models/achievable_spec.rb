# == Schema Information
#
# Table name: achievables
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :text
#  type        :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#  image       :string(255)
#

require 'spec_helper'

describe Achievable do
  before do 
    subject { Fabricate(:achivable) }
  end

  it { should have_and_belong_to_many(:users) }

  it { expect(subject).to validate_presence_of(:name) }
end
