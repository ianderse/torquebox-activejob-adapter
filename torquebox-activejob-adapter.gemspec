# coding: utf-8

Gem::Specification.new do |spec|
  spec.name          = "torquebox-activejob-adapter"
  spec.version       = '0.0.2'
  spec.authors       = ["Hannes Nevalainen"]
  spec.email         = ["hannes.nevalainen@me.com"]
  spec.summary       = %q{A prototype ActiveJob processor for Torquebox3}
  spec.description   = %q{A prototype ActiveJob processor for Torquebox3}
  spec.homepage      = 'https://github.com/kwando/torquebox-activejob-adapter'
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]
  
  spec.add_runtime_dependency 'torquebox-messaging'

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
end
