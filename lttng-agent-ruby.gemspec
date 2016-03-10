Gem::Specification.new do |s|
  s.name        = "lttng-agent-ruby"
  s.version     = "0.1.4"
  s.licenses    = ["LGPL-3.0"]
  s.platform    = Gem::Platform::RUBY
  s.summary     = "Tracing ruby applications with LTTng."
  s.description = "A simple API for sending tracepoints from Ruby programs to LTTng."
  s.authors     = ["Chris Riddoch"]
  s.email       = "riddochc@gmail.com"
  s.date        = "2016-03-09"
  s.files       = ["README.adoc",
                   "Rakefile",
                   "demos/demo.rb",
                   "demos/demo2.rb",
                   "demos/demo3.rb",
                   "ext/lttng-agent-ruby/extconf.rb",
                   "ext/lttng-agent-ruby/lttng_module.c",
                   "ext/lttng-agent-ruby/lttng_module.c.erb",
                   "ext/lttng-agent-ruby/traces.h",
                   "ext/lttng-agent-ruby/traces.h.erb",
                   "lib/lttng-agent-ruby/_codegen.rb",
                   "lib/lttng-agent-ruby/logger.rb",
                   "lib/lttng-agent-ruby/version.rb",
                   "lib/lttng-agent-ruby/viewer.rb",
                   "lib/lttng-agent-ruby.rb",
                   "lttng-agent-ruby.gemspec",
                   "project.yaml"]
  s.homepage    = "https://github.com/riddochc/lttng-agent-ruby/"


  s.add_development_dependency "rake", "=10.5.0"
  s.add_development_dependency "asciidoctor", "=1.5.4"
  s.add_development_dependency "yard", "=0.8.7.6"
  s.add_development_dependency "pry", "=0.10.3"
  s.add_development_dependency "rspec", "=3.4.0"
end
