#!/usr/bin/env ruby

require 'erb'

# From syslog names to lttng names...
severities = {"emergency" => "emerg",
              "alert" => "alert",
              "critical" => "crit",
              "error" => "err",
              "warning" => "warning",
              "notice" => "notice",
              "info" => "info"}

erb = ERB.new(DATA.read, nil, "%<>")

severities.each_pair.with_index {|pair, i|
  log, ltt = *pair
  puts erb.result(binding)
}

__END__
  def <%= log %>(msg = nil, progname = nil, &b)
    fullmsg = "#{caller[0]}|#{form_message(msg, &b)}"
    LTTng.<%= ltt %>(fullmsg)
  end

