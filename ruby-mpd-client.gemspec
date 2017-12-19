
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mpd/version'

Gem::Specification.new do |spec|
  spec.name          = 'ruby-mpd-client'
  spec.version       = MPD::VERSION
  spec.authors       = ['Dmitriy Non']
  spec.email         = ['non.dmitriy@gmail.com']

  spec.summary       = 'yet another MPD client on Ruby'
  spec.homepage      = 'https://github.com/Nondv/ruby-mpd-client'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end

  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.13'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec-its'
  spec.add_development_dependency 'rubocop', '0.52.0'
end
