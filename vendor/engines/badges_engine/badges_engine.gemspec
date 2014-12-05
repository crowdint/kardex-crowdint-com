$:.push File.expand_path('../lib', __FILE__)

require 'badges_engine/version'

Gem::Specification.new do |s|
  s.name        = 'badges_engine'
  s.version     = BadgesEngine::VERSION
  s.authors     = ['Juan Carlos Aguilar Rincon', 'Victor Velazquez']
  s.email       = ['juan.aguilar@crowdint.com', 'victor.velazquez@crowdint.com']
  s.homepage    = 'http://kardex.crowdint.com'
  s.summary     = 'Badge Engine'
  s.description = 'Mountable engine related to all about badges for kardex crowdint'
  s.license     = 'MIT'

  s.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.rdoc']

  s.test_files = Dir['spec/**/*']

  s.add_dependency 'rails', '~> 4.0.4'
  s.add_dependency 'haml-rails'
  s.add_dependency 'jquery-rails'
  s.add_dependency 'carrierwave'
  s.add_dependency 'fog'
  s.add_dependency 'mini_magick'
  s.add_dependency 'simple_form'

  s.add_development_dependency 'sqlite3'
  s.add_development_dependency 'pry'
  s.add_development_dependency 'pry-remote'
  s.add_development_dependency 'rspec-rails', '~> 2.14.1'
  s.add_development_dependency 'capybara'
  s.add_development_dependency 'factory_girl_rails'
  s.add_development_dependency 'shoulda-matchers'
  s.add_development_dependency 'database_cleaner'
end
