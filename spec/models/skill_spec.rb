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

  it 'valid fabrication' do 
    expect(subject).to have(0).errors_on(:name)
  end
end
