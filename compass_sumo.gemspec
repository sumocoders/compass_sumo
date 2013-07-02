# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

require 'compass_sumo/version'

Gem::Specification.new do |s|
  s.name         = 'compass_sumo'
  s.summary      = "SumoCoders CSS Framework"
  s.description  = "The SumoCoders CSS Framework"
  s.authors      = ["Jan De Poorter", "Niels De Paepe", "Mathias Helin"]
  s.email        = "compass@sumocoders.be"

  s.files        = `git ls-files`.split("\n")
  s.executables  = `git ls-files -- bin/*`.split("\n").map{|f| File.basename(f) }
  s.require_paths = ["lib"]

  s.version      = CompassSumo::VERSION

  s.add_dependency "compass"
  s.add_dependency "ttfunk"
end

