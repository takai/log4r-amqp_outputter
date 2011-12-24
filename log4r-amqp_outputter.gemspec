# -*- mode: ruby; coding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)

Gem::Specification.new do |s|
  s.name        = "log4r-amqp_outputter"
  s.version     = "0.0.1"
  s.authors     = ["Naoto Takai"]
  s.email       = ["takai@recompile.net"]
  s.homepage    = ""
  s.summary     = %q{Remote logging for Log4r via AMQP.}
  s.description = %q{Remote logging for Log4r via AMQP.}

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  s.add_development_dependency "rspec", "~> 2.7.0"
  s.add_development_dependency "simplecov", "~> 0.5.4"

  s.add_runtime_dependency "log4r", "~> 1.1.9"
  s.add_runtime_dependency "amqp", "~> 0.8.4"
  s.add_runtime_dependency "msgpack", "~> 0.4.6"
end
