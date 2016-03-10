#!/usr/bin/env ruby

require 'lttng-agent-ruby'
require 'lttng-agent-ruby/logger'

system("lttng create")
system("lttng enable-channel channel0 -u --subbuf-size=4M")
system("lttng enable-event 'ruby_log:*' -u -c channel0")
system("lttng start")
log = LTTngLogger.new
log.info("Hello, tracelog watchers.")
log.warning { "Does a block work?" }
system("lttng stop")
system("lttng view")
system("lttng destroy")

