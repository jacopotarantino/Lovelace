$LOAD_PATH.push File.expand_path('../lib/', __FILE__)

Gem::Specification.new do |s|
  s.name        = 'lovelace'
  s.version     = '0.0.1'
  s.date        = '2015-06-20'
  s.summary     = 'An advanced language- and framework-agnostic API for UI components.'
  s.description = 'Lovelace.component'
  s.authors     = [ 'Jack Tarantino' ]
  s.email       = 'jack@ofspades.com'
  s.files       = [ './lovelace.rb' ]
  s.homepage    = 'http://rubygems.org/gems/lovelace'
  s.license     = 'Creative Commons Attribution-ShareAlike 4.0'

  s.add_runtime_dependency 'mustache'
  s.add_runtime_dependency 'sass'
  s.add_runtime_dependency 'coffee-script'

  s.add_development_dependency 'rspec'
  s.add_development_dependency 'capybara'
end
