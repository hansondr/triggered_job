# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "triggered_job/version"

Gem::Specification.new do |s|
  s.name = "triggered_job"
  s.version = TriggeredJob::VERSION
  s.platform = Gem::Platform::RUBY
  s.date = "2016-10-18"
  s.author = "Daniel Hanson"
  s.email = "hansondr@gmail.com"
  s.homepage = "https://github.com/hansondr/triggered_job"
  s.license = "MIT"
  s.summary = "Simple framework for trigger-based jobs"
  s.description = "Simple framework for trigger-based jobs"

  s.add_development_dependency "rspec", "~> 3.5"
  s.add_development_dependency "simplecov", "~> 0.12"
  s.add_development_dependency "rake", "~> 11.0"

  s.files = `git ls-files`.split("\n")
  s.test_files = `git ls-files -- spec/*`.split("\n")
  s.require_paths = ["lib"]
end
