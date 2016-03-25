# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'pombo/version'

Gem::Specification.new do |spec|
  spec.name          = "pombo"
  spec.version       = Pombo::VERSION
  spec.authors       = ["Leandro Nunes"]
  spec.email         = ["leandro@adena.com"]

  spec.summary       = %q{Gem to manage the shipping packages using the webservice of the Correios}
  spec.description   = spec.summary
  spec.homepage      = "https://github.com/adenaecommerce/pombo"
  spec.license       = 'MIT'
  spec.platform      = Gem::Platform::RUBY

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.4"
  spec.add_development_dependency "rspec", "~> 3.4"
end
