$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "component_template/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "component_template"
  s.version     = ComponentTemplate::VERSION
  s.authors     = ["Celso Fernandes"]
  s.email       = ["fernandes@zertico.com"]
  s.homepage    = "http://github.com/fernandes/cobra_template"
  s.summary     = "Summary of ComponentTemplate."
  s.description = "Description of ComponentTemplate."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 4.1.6"

  s.add_development_dependency "database_cleaner"
  s.add_development_dependency "factory_girl_rails"
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "shoulda-matchers"
  s.add_development_dependency "sqlite3"
  s.add_development_dependency "thor"
end
