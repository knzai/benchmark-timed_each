# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib/', __FILE__)

Gem::Specification.new do |s|
  s.name        = "benchmark-timed_each"
  s.version     = '1.0.1'
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Tim Connor"]
  s.email       = ["timocratic@gmail.com"]
  s.homepage    = "http://github.com/timocratic/benchmark-timed_each"
  s.summary     = "A wrapper for Benchmark.benchmark that enmurates over a collection"
  s.description = "Adds a timed_each method that accepts a collection to Benchmark. The collection is enumerated over and how long each takes is output, as well as a total."
  s.required_rubygems_version = ">= 1.3.6"

  s.files        = Dir.glob("lib/**/*") + %w(test.rb UNLICENSE README.md)
  s.require_path = 'lib'
end