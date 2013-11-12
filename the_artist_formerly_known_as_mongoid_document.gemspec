# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'the_artist_formerly_known_as_mongoid_document/version'

Gem::Specification.new do |spec|
  spec.name          = "the_artist_formerly_known_as_mongoid_document"
  spec.version       = TheArtistFormerlyKnownAsMongoidDocument::VERSION
  spec.authors       = ["Steven Dunlap"]
  spec.email         = ["steven@roadtrippers.com"]
  spec.description   = 'Make migrating away from Mongoid slightly less painful.' 
  spec.summary       = 'Provide legacy support for old mongo ids in the finder methods at the model level after migrating away from Mongoid.'
  spec.homepage      = "http://github.com/roadtrippers/the_artist_formerly_known_as_mongoid_document"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "acts_as_fu"
  spec.add_development_dependency "pry"
end
