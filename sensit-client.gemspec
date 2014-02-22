# -*- encoding: utf-8 -*-

Gem::Specification.new do |gem|
  gem.name        = "sensit-client"
  gem.version     = "0.0.1"
  gem.description = "Official Sensit API library client for ruby"
  gem.summary     = "Official Sensit API library client for ruby"

  gem.author   = "Christopher Waddington"
  gem.email    = "cwadding@gmail.com"
  gem.homepage = "https://sensit.com"
  gem.license  = "MIT"

  gem.require_paths = ['lib']

  gem.files = Dir["lib/**/*"]

  gem.add_dependency "faraday", "~> 0.8.8"
  gem.add_dependency "json", "~> 1.7.7"
end
