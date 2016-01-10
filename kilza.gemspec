# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'kilza/version'

Gem::Specification.new do |spec|
  spec.name          = "kilza"
  spec.version       = Kilza::VERSION
  spec.authors       = ["Toshiro Sugii"]
  spec.email         = ["rtoshiro@printwtf.com"]

  spec.summary       = %q{Parses JSON objects and generates objects into other languages}
  spec.description   = %q{Parses JSON objects and generates objects into other languages}
  spec.homepage      = "https://github.com/Jaspion/Kilza"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "rubygems.org"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "bin"
  spec.executables   = ["kilza"]
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest"
  spec.add_development_dependency "coveralls"

  spec.add_dependency "json"
  spec.add_dependency "erubis"
  spec.add_dependency "tty"
  spec.add_dependency "pastel"
end
