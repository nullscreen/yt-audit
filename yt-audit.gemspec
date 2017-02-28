# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'yt/audit/version'

Gem::Specification.new do |spec|
  spec.name          = "yt-audit"
  spec.version       = Yt::Audit::VERSION
  spec.authors       = ["Kang-Kyu Lee"]
  spec.email         = ["kang-kyu.lee@fullscreen.com"]

  spec.summary       = %q{Audit a YouTube video.}
  spec.description   = %q{A Ruby library you can audit titles or annotations
    of a Youtube video}
  spec.homepage      = "https://github.com/fullscreen/yt-audit"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency 'yt', '>= 0.29.1'
  spec.add_dependency 'yt-url', '>= 1.0.0.beta1'
  spec.add_dependency "yt-annotations", '~> 1.2'

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
  spec.add_development_dependency 'coveralls', '~> 0.8.10'
  spec.add_development_dependency 'yard', '~> 0.8.7'
end
