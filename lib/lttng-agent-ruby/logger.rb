#
#
#!/usr/bin/env ruby
# require_relative "../../ext/lttng-agent-ruby/lttng_module"


# This attempts to approximate a Logger-style API.
class LTTngLogger
  attr_accessor :use_inspect
  def initialize
    @use_inspect = false
  end

  def emergency(msg = nil, progname = nil, &b)
    fullmsg = "#{caller[0]}|#{form_message(msg, &b)}"
    LTTng.emerg(fullmsg)
  end

  def alert(msg = nil, progname = nil, &b)
    fullmsg = "#{caller[0]}|#{form_message(msg, &b)}"
    LTTng.alert(fullmsg)
  end

  def critical(msg = nil, progname = nil, &b)
    fullmsg = "#{caller[0]}|#{form_message(msg, &b)}"
    LTTng.crit(fullmsg)
  end

  def error(msg = nil, progname = nil, &b)
    fullmsg = "#{caller[0]}|#{form_message(msg, &b)}"
    LTTng.err(fullmsg)
  end

  def warning(msg = nil, progname = nil, &b)
    fullmsg = "#{caller[0]}|#{form_message(msg, &b)}"
    LTTng.warning(fullmsg)
  end

  def notice(msg = nil, progname = nil, &b)
    fullmsg = "#{caller[0]}|#{form_message(msg, &b)}"
    LTTng.notice(fullmsg)
  end

  def info(msg = nil, progname = nil, &b)
    fullmsg = "#{caller[0]}|#{form_message(msg, &b)}"
    LTTng.info(fullmsg)
  end

  private
  # ordered in, I hope, likelihood of use?
  def form_message(msg = nil, &blk)
    if !@use_inspect && msg
      msg
    elsif @use_inspect && msg
      msg.inspect
    elsif !@use_inspect && !blk.nil?
      blk.call()
    else # @use_inspect && !blk.nil?
      blk.call().inspect
    end
  end
end

