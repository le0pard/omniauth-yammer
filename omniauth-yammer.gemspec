# -*- encoding: utf-8 -*-
require File.expand_path('../lib/omniauth-yammer/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Alexey Vasiliev"]
  gem.email         = ["leopard.not.a@gmail.com"]
  gem.description   = %q{OmniAuth strategy for Yammer}
  gem.summary       = %q{OmniAuth strategy for Yammer}
  gem.homepage      = ""
  
  gem.rubyforge_project = "omniauth-yammer"

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "omniauth-yammer"
  gem.require_paths = ["lib"]
  gem.version       = OmniAuth::Yammer::VERSION
  
  
  gem.add_runtime_dependency 'omniauth-oauth2',    '~> 1.0'
  
  gem.add_development_dependency 'rspec',     '~> 2.7'
  gem.add_development_dependency 'rack-test'
  gem.add_development_dependency 'simplecov'
  gem.add_development_dependency 'webmock'
end
