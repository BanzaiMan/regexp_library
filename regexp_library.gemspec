# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'regexp_library/version'

Gem::Specification.new do |gem|
  gem.name          = "regexp_library"
  gem.version       = RegexpLibrary::VERSION
  gem.authors       = ["Hiro Asari"]
  gem.email         = ["asari.ruby@gmail.com"]
  gem.description   = %q{TODO: Write a gem description}
  gem.summary       = %q{TODO: Write a gem summary}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_development_dependency 'rake'
  gem.add_development_dependency 'cucumber'
  gem.add_development_dependency 'rspec', '>= 2.0'
  gem.add_development_dependency 'autotest'
end
