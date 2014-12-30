$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "feedbook_engine/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "feedbook_engine"
  s.version     = FeedbookEngine::VERSION
  s.authors     = ["Adrian Castillo"]
  s.email       = ["rodacato@gmail.com"]
  s.homepage    = "http://kardex.crowdint.com"
  s.summary     = "Feedbook Engine"
  s.description = "Mountable engine to manage technical skills"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["spec/**/*"]

  s.add_dependency "rails", "~> 4.0.4"

  s.add_development_dependency "sqlite3"
end
