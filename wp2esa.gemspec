# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'wp2esa/version'

Gem::Specification.new do |spec|
  spec.name          = "wp2esa"
  spec.version       = Wp2esa::VERSION
  spec.authors       = ["bash"]
  spec.email         = ["ksb.4038.nullpointer"]

  spec.summary       = %q{WordPress to esa.io migration tool.}
  spec.description   = %q{WordPress to esa.io migration tool.}
  spec.homepage      = "https://raw.githubusercontent.com/bash0C7/wp2esa"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "reverse_markdown", "~> 1.0"
  spec.add_dependency "esa", "~> 1.7"
  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "pry-coolline", "~> 0.2"
  spec.add_development_dependency "pry-doc", "~> 0.9"
  spec.add_development_dependency "pry-stack_explorer", "~> 0.4"
  spec.add_development_dependency "pry-byebug", "~> 3.4"
end
