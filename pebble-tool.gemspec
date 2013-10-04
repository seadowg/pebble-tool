# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "pebble-tool"
  spec.version       = "0.0.1"
  spec.authors       = ["Callum Stott"]
  spec.email         = ["callum@seadowg.com"]
  spec.description   = "Er make apps that run on your computer that you control with you Pebble?"
  spec.summary       = "I was on a twelve hour flight."
  spec.homepage      = "https://github.com/seadowg/pebble-tool"

  spec.files         = `git ls-files`.split($/)
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
end
