require 'rake'

data = YAML.load_file('config/dataseeds/awards.yml')

data.each do |info|
  award = BadgesEngine::Award.find_or_initialize_by(title: info['title'])
  award.description = info['description']
  award.save
end

data = YAML.load_file('config/dataseeds/values.yml')

data.each do |info|
  value = BadgesEngine::Value.find_or_initialize_by(name: info['name'])
  value.description = info['description']
  value.save
end

Rake::Task['bamboo:sync_users'].invoke
Rake::Task['skills:create'].invoke
