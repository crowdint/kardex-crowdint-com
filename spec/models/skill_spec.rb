# == Schema Information
#
# Table name: skills
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

require 'spec_helper'

describe Skill do
  before do 
    subject { Fabricate(:skill) }
  end

  it { should have_and_belong_to_many(:users) }

  it { expect(subject).not_to validate_presence_of(:name) }
end
