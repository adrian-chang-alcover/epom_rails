$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "epom_rails/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "epom_rails"
  s.version     = EpomRails::VERSION
  s.authors     = ["Adrian Chang"]
  s.email       = ["adrian.chang.alcover@gmail.com"]
  s.homepage    = "https://github.com/kewelta/epom_rails"
  s.summary     = "EpomRails gem."
  s.description = "The EpomRails gem is wrapper for Epom gem in Rails"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.2"

  s.add_development_dependency "sqlite3"
end
