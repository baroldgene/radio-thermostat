# -*- encoding: utf-8 -*-
require File.expand_path('../lib/radio_thermostat/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Barry Brinkley"]
  gem.email         = ["baroldgene@gmail.com"]
  gem.description   = %q{Control your Radio Thermostat compatible thermostat}
  gem.summary       = %q{View and set temperature and away status for your RadioThermostat compatible thermostat}
  gem.homepage      = "http://github.com/baroldgene/radio-thermostat"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "radio_thermostat"
  gem.require_paths = ["lib"]
  gem.version       = RadioThermostat::VERSION
  gem.add_dependency "httparty", "~> 0.8.3"

  gem.add_development_dependency "rspec", "~> 3.1"
end

