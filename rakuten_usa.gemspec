# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rakuten_usa/version'

Gem::Specification.new do |spec|
  spec.name          = "rakuten_usa"
  spec.version       = Rakuten::VERSION
  spec.authors       = ["Vincent Smith"]
  spec.email         = ["vincent@solebrity.me"]
  spec.summary       = %q{Ruby wrapper for the Rakuten Marketing APIs}
  spec.description   = %q{For more information see http://rakutenmarketing.com}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'httparty', '~> 0.13.3'
  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.2.0"
  spec.add_development_dependency "rspec-mocks", "~> 3.2.0"
end
