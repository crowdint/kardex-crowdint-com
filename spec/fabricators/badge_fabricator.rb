Fabricator :badge, from: 'BadgesEngine::Badge' do
  name 'Dummy'
  description Faker::Lorem.paragraph
  level Random.rand(4)
end
