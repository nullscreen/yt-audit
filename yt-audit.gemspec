# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'yt/audit/version'

Gem::Specification.new do |spec|
  spec.name          = 'yt-audit'
  spec.version       = Yt::Audit::VERSION
  spec.authors       = ['Claudio Baccigalupo', 'Kang-Kyu Lee']
  spec.email         = ['claudio@fullscreen.net', 'kang-kyu.lee@fullscreen.net']

  spec.summary       = %q{Audit a YouTube video.}
  spec.description   = %q{A Ruby library you can audit titles or annotations
    of a Youtube video}
  spec.homepage      = 'https://github.com/fullscreen/yt-audit'
  spec.license       = 'MIT'

  spec.required_ruby_version = '>= 2.2.2'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end

  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'yt-core', '>= 0.1.0'
  spec.add_dependency 'yt-url', '>= 1.0.0.beta2'
  spec.add_dependency 'yt-annotations', '~> 2.0'

  spec.add_development_dependency 'bundler', '~> 1.7'
  spec.add_development_dependency 'minitest', "~> 5.0"
  spec.add_development_dependency 'rake', '~> 12.0'
  spec.add_development_dependency 'coveralls', '~> 0.8.20'
  spec.add_development_dependency 'pry-nav', '~> 0.2.4'
  spec.add_development_dependency 'yard', '~> 0.9.8'
end
