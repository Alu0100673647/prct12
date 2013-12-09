# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'matrizdispersascp/version'

Gem::Specification.new do |spec|
  spec.name          = "matrizdispersascp"
  spec.version       = Matrizdispersascp::VERSION
  spec.authors       = ["constanza leon"]
  spec.email         = ["alu0100673647@ull.edu.es"]
  spec.description   = %q{Esqueleto de una gema}
  spec.summary       = %q{Esqueleto de una gema}
  spec.homepage      = "https://github.com/Alu0100673647/prct09"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
