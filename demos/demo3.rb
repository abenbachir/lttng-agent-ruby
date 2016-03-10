#!/usr/bin/env ruby

require 'lttng-agent-ruby/viewer'

lt = LTTngTraces.new
lt.from_io(IO.popen(["babeltrace", "-n", "payload", ARGV[0]], 'r'))

puts lt.map(&:itself).to_yaml

