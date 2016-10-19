lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "triggered_job/version"

Gem::Specification.new do |s|
  s.name = "triggered_job"
  s.version = TriggeredJob::VERSION
  s.date = "2016-10-18"
  s.summary = "Simple framework for trigger-based jobs"
  s.description = "Simple framework for trigger-based jobs"
  s.author = "Daniel Hanson"
  s.email = "hansondr@gmail.com"
  s.files = ["README.md", "LICENSE"]
  s.homepage = "https://github.com/hansondr/triggered_job"
  s.license = "MIT"

  s.add_development_dependency "rspec", "~> 3.5"
  s.add_development_dependency "simplecov", "~> 0.12"
  s.add_development_dependency "rake", "~> 11.0"
end
