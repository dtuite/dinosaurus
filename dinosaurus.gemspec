# -*- encoding: utf-8 -*-
require File.expand_path('../lib/dinosaurus/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["David Tuite"]
  gem.email         = ["dtuite@gmail.com"]
  gem.description   = %q{Ruby wrapper for the Big Huge Thesaurus APIs.}
  gem.summary       = %q{Lookup synonyms, antonyms etc. using the Big Huge Thesaurus API.}
  gem.homepage      = "http://words.bighugelabs.com"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "dinosaurus"
  gem.require_paths = ["lib"]
  gem.version       = Dinosaurus::VERSION

  gem.add_development_dependency "rspec"
end
