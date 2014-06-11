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

Fabricator :position do  
  name { Faker::Name.title }
  description { Faker::Lorem.paragraph }
end
