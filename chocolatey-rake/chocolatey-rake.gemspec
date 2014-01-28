# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'chocolatey/rake/version'

Gem::Specification.new do |spec|
  spec.name          = 'chocolatey-rake'
  spec.version       = Chocolatey::Rake::VERSION
  spec.authors       = ['Anthony Mastrean']
  spec.email         = ['anthony.mastrean@gmail.com']
  spec.description   = %q{Rake tasks for Chocolatey packages}
  spec.summary       = %q{Rake tasks for Chocolatey packages}
  spec.homepage      = 'http://github.com/anthonymastrean/chocolatey-rake#readme'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_dependency 'rake'
  spec.add_dependency 'albacore'
end
