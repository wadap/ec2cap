# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ec2cap/version'

Gem::Specification.new do |spec|
  spec.name          = "ec2cap"
  spec.version       = Ec2cap::VERSION
  spec.authors       = ["shuichi.wada"]
  spec.email         = ["me@shuichi.cc"]
  spec.description   = %q{A capistrano config manager for ec2}
  spec.summary       = %q{update capistrano config for ec2}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
