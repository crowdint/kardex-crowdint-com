data = YAML.load_file('config/dataseeds/awards.yml')

data.each do |info|
  award = BadgesEngine::Award.find_or_initialize_by(title: info['title'])
  award.description = info['description']
  award.save
end
