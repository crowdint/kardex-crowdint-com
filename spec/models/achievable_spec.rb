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

  it 'is invalid without first name' do 
    subject.should have(1).errors_on(:name)
  end
end
