# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  name                   :string(255)
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  provider               :string(255)
#  uid                    :string(255)
#  created_at             :datetime
#  updated_at             :datetime
#  is_admin               :boolean
#  department             :string(255)
#  picture_url            :string(255)
#

require 'spec_helper'

describe User do
  before do
    subject { Fabricate(:user) }
  end

  it 'is valid name' do
    expect(subject).to have(0).errors_on(:name)
  end

  it 'is valid email' do
    expect(subject).to have(0).errors_on(:email)
  end

  it 'is valid password' do
    expect(subject).to have(0).errors_on(:password)
  end

  it 'is valid department' do
    expect(subject).to have(0).errors_on(:department)
  end

  it { should have_and_belong_to_many(:achievables) }

  it { should have_and_belong_to_many(:positions) }

  it { should have_and_belong_to_many(:skills) }
end
