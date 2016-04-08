Gem::Specification.new do |s|
  s.name        = "lttng-agent-ruby"
  s.version     = "0.1.5"
  s.licenses    = ["LGPL-3.0"]
  s.platform    = Gem::Platform::RUBY
  s.summary     = "Tracing ruby applications with LTTng."
  s.description = "A simple API for sending tracepoints from Ruby programs to LTTng."
  s.authors     = ["Chris Riddoch"]
  s.email       = "riddochc@gmail.com"
  s.date        = "2016-04-08"
  s.files       = ["README.adoc",
                   "Rakefile",
                   "demos/demo.rb",
                   "demos/demo2.rb",
                   "demos/demo3.rb",
                   "ext/lttng_agent_ruby_ext/extconf.rb",
                   "ext/lttng_agent_ruby_ext/lttng_agent_ruby_ext.c",
                   "ext/lttng_agent_ruby_ext/lttng_agent_ruby_ext.c.erb",
                   "ext/lttng_agent_ruby_ext/traces.h",
                   "ext/lttng_agent_ruby_ext/traces.h.erb",
                   "lib/lttng-agent-ruby/_codegen.rb",
                   "lib/lttng-agent-ruby/logger.rb",
                   "lib/lttng-agent-ruby/version.rb",
                   "lib/lttng-agent-ruby/viewer.rb",
                   "lib/lttng-agent-ruby.rb",
                   "lttng-agent-ruby.gemspec",
                   "project.yaml"]
  s.homepage    = "https://github.com/riddochc/lttng-agent-ruby/"
  s.extensions  = ["ext/lttng_agent_ruby_ext/extconf.rb"]


  s.add_development_dependency "rake", "=11.1.2"
  s.add_development_dependency "asciidoctor", "=1.5.4"
  s.add_development_dependency "yard", "=0.8.7.6"
  s.add_development_dependency "pry", "=0.10.3"
  s.add_development_dependency "rspec", "=3.4.0"
end
