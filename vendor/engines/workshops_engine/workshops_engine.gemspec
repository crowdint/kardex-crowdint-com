$:.push File.expand_path('../lib', __FILE__)

require 'workshops_engine/version'

Gem::Specification.new do |s|
  s.name        = 'workshops_engine'
  s.version     = WorkshopsEngine::VERSION
  s.authors     = ['Julian Morales']
  s.email       = ['julian.morales@crowdint.com']
  s.homepage    = 'http://kardex.crowdint.com'
  s.summary     = 'Workshop Engine'
  s.description = 'Mountable engine to manage workshops for kardex crowdint'
  s.license     = 'MIT'

  s.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.rdoc']
  s.test_files = Dir['spec/**/*']

  s.add_dependency 'rails', '~> 4.0.4'

  s.add_development_dependency 'sqlite3'
  s.add_development_dependency 'rspec-rails', '~> 2.14.1'
end
