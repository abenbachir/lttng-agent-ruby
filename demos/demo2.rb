#!/usr/bin/env ruby

require 'lttng-agent-ruby'

t = TracePoint.new {|tp| LTTng.info(tp.inspect) }
t.enable

puts "Hi, world."

t.disable

