# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "sms/spec/core/version"

Gem::Specification.new do |spec|
  spec.name          = "sms-spec-core"
  spec.version       = SMS::Spec::Core::VERSION
  spec.authors       = ["Chris Rittersdorf"]
  spec.email         = ["chris.rittersdorf@collectiveidea.com"]
  spec.summary       = "Simple SMS testing with RSpec"

  spec.description   = <<-END_DESC
    Simple SMS testing with RSpect. 'sms-spec-core'
    should not be used on its own. Instead use one of it's drivers like 'sms-spec-twilio'
  END_DESC

  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "rspec", "~> 3.0", "~> 3.0"
  spec.add_runtime_dependency "phone", "~> 1.2.3"

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "pry", "~> 0.10.0"
end
