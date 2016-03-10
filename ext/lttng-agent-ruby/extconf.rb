require 'mkmf'
have_library("lttng-ust")
create_makefile('lttng-agent-ruby')

