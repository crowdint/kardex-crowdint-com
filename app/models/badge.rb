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

class Badge < Achievable
end
