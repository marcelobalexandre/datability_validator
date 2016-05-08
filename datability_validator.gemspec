Gem::Specification.new do |s|
  s.name        = 'datability_validator'
  s.version     = '0.0.0'
  s.summary     = 'Date validator for ActiveModel'
  s.description = "A date validator for ActiveModel"
  s.authors     = ['Marcelo B. Alexandre']
  s.email       = 'marcelobalexandre@gmail.com'
  s.files       = ['lib/datability_validator.rb']
  s.homepage    = 'https://github.com/marcelobalexandre/datability_validator'
  s.license     = 'MIT'

  s.add_runtime_dependency 'activemodel'
  s.add_runtime_dependency 'activesupport'

  s.add_development_dependency 'minitest', '~> 5.8', '>= 5.8.4'
end
