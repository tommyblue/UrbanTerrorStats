# -*- encoding: utf-8 -*-
require File.expand_path('../lib/urbanterror_stats/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Tommaso Visconti"]
  gem.email         = ["tommaso.visconti@gmail.com"]
  gem.description   = %q{UrbanTerror game logs analyzer}
  gem.summary       = %q{The gem analyzes the log file of an UrbanTerror server, including Hits logs, and prints a cool report}
  gem.homepage      = "https://github.com/tommyblue/UrbanTerrorStats"

  gem.add_development_dependency "rake"
  gem.add_development_dependency "rspec"
  gem.add_development_dependency "cucumber"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "urbanterror_stats"
  gem.require_paths = ["lib"]
  gem.version       = UrbanterrorStats::VERSION
end
