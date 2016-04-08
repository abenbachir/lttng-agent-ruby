require 'mkmf'
have_library("lttng-ust")
create_makefile('lttng_agent_ruby_ext')

