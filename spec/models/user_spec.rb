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
  let!(:user) { Fabricate.build(:user) }

  it { expect(user).to be_valid }

  describe 'relationships' do
    it { expect(user).to have_and_belong_to_many(:achievables) }
    it { expect(user).to belong_to(:position) }
    it { expect(user).to have_and_belong_to_many(:skills) }
    it { expect(user).to have_many(:badge_proposals) }
  end

  describe 'validations' do
    it { expect(user).not_to validate_presence_of(:name) }
    it { expect(user).not_to validate_presence_of(:email) }
    it { expect(user).not_to validate_presence_of(:password) }
    it { expect(user).not_to validate_presence_of(:department) }
  end
end
