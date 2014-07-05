Fabricator :user do
  name { Faker::Name.name }
  email {  |attrs| "#{ attrs[:name].to_s.parameterize }@crowdint.com" }
  password { Faker::Internet.password }
  department { Faker::Commerce.department }
  bio { Faker::Lorem.sentence(6) }
end

Fabricator :admin, from: :user do
  is_admin true
end
