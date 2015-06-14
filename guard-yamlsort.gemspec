# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'guard/yamlsort/version'

Gem::Specification.new do |spec|
  spec.name          = "guard-yamlsort"
  spec.version       = Guard::YamlsortVersion::VERSION
  spec.authors       = ["Thomas Vendetta"]
  spec.email         = ["thomas@vendetta.io"]
  spec.summary       = %q{Sorts YAML files alphabetically by key}
  spec.description   = %q{Sorts YAML files alphabetically by key. }
  spec.homepage      = "http://vendetta.io"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "yard", "~> 0.8"
  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.6"
  spec.add_development_dependency "guard", "~> 2.12"
  spec.add_development_dependency "guard-minitest", "~> 2.4"
  spec.add_development_dependency "guard-yard", "~> 2.1"
  spec.add_dependency 'guard-compat', '~> 1.1'

end
