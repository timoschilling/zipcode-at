# coding: utf-8

Gem::Specification.new do |spec|
  spec.name          = "zipcode-at"
  spec.version       = "1.0.0"
  spec.authors       = ["Timo Schilling"]
  spec.email         = ["timo@schilling.io"]

  spec.summary       = %q{Austrian zip codes and cities.}
  spec.description   = %q{Query city information by zip code.}
  spec.homepage      = "https://github.com/timoschilling/zipcode-at"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.require_paths = ["lib"]

  spec.add_dependency "zipcode-db", "~> 1.0"
  spec.add_dependency "zipcode-fr", "~> 1.0"

  spec.add_development_dependency "bundler"
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'minitest'
  spec.add_development_dependency 'pry'
end
