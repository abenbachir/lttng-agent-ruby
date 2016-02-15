#!/usr/bin/env ruby

require_relative 'lib/lttng-agent-ruby'

t = TracePoint.new {|tp| LTTng.info(tp.inspect) }
t.enable

puts "Hi, world."

t.disable

