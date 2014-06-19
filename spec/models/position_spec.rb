# == Schema Information
#
# Table name: positions
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :string(255)
#  image_url   :string(255)
#  user_id     :integer
#

require 'spec_helper'

describe Position do
  before do
    subject { Fabricate(:position) }
  end

  it { should have_many(:users) }

  it { expect(subject).to validate_presence_of(:name) }
end