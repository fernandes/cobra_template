$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "component_template/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "component_template"
  s.version     = ComponentTemplate::VERSION
  s.authors     = ["TODO: Your name"]
  s.email       = ["TODO: Your email"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of ComponentTemplate."
  s.description = "TODO: Description of ComponentTemplate."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 4.1.6"

  s.add_development_dependency "sqlite3"
end
