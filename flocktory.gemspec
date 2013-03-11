# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'flocktory/version'

Gem::Specification.new do |gem|
  gem.name          = "flocktory"
  gem.version       = Flocktory::VERSION
  gem.authors       = ["Alexander Tipugin"]
  gem.email         = ["atipugin@gmail.com"]
  gem.description   = %q{Ruby wrapper for Flocktory API}
  gem.summary       = %q{Flocktory}
  gem.homepage      = "https://github.com/GrouponRussia/flocktory-ruby"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency('httparty')
end
