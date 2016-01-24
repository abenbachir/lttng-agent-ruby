# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'lttng-agent-ruby/version'

Gem::Specification.new do |spec|
  spec.name          = "lttng-agent-ruby"
  spec.version       = LTTngAgentRuby::VERSION
  spec.authors       = ["Chris Riddoch"]
  spec.email         = ["riddochc@gmail.com"]
  spec.summary       = %q{Trace with LTTng from Ruby}
  spec.description   = %q{A simple API for sending tracepoints from Ruby programs to LTTng.}
  spec.homepage      = "http://syntacticsugar.org/software/lttng-agent-ruby"
  spec.license       = "GPLv3"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.require_paths = ["lib"]
  spec.extensions = %w[ext/lttng-agent-ruby/extconf.rb]
end
