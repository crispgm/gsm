# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'gsm/version'

Gem::Specification.new do |spec|
  spec.name          = "gsm-sources-manager"
  spec.version       = Gsm::VERSION
  spec.authors       = ["David Zhang"]
  spec.email         = ["crispgm@gmail.com"]
  spec.summary       = "GSM Sources Manager"
  spec.description   = "GSM is a simple sources manager for RubyGems."
  spec.homepage      = "https://github.com/crispgm/gsm"
  spec.license       = "MIT"

  spec.required_ruby_version = '>= 2.2.5'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "minitest"
  spec.add_development_dependency "shoulda-context"
  spec.add_development_dependency "codeclimate-test-reporter"

  spec.add_dependency "mercenary", "~> 0.3.6"
end
