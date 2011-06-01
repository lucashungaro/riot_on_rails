# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "riot_on_rails/version"

Gem::Specification.new do |s|
  s.name        = "riot_on_rails"
  s.version     = RiotOnRails::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Lucas Húngaro"]
  s.email       = ["lucashungaro@gmail.com"]
  s.homepage    = "https://github.com/lucashungaro/riot_on_rails"
  s.summary     = %q{Hooks the Riot testing framework into Ruby on Rails}
  s.description = %q{A set of utilities to make developing Rails apps with Riot easier.
                     No extra macros or helpers provided, just the bare basics.}

  s.rubyforge_project = "riot_on_rails"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- test/*`.split("\n")
  s.require_paths = ["lib"]

  s.required_rubygems_version = ">= 1.3.6"

  # These gems are required for runtime and development :)
  s.add_dependency("riot", "~> 0.12.4")
  s.add_dependency("rack-test")
  s.add_dependency("database_cleaner", "~> 0.6.7")

  s.add_development_dependency("rake", "~> 0.8.7")
  s.add_development_dependency("rr", "~> 1.0.2")
  s.add_development_dependency("activerecord", ">= 3.0.0")
  s.add_development_dependency("sqlite3", "~> 1.3.3")
  s.add_development_dependency("rails", ">= 3.0.0")
end
