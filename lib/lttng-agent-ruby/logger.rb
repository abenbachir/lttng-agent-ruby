#!/usr/bin/env ruby

require_relative "../../ext/lttng-agent-ruby/lttng_module"

class LTTngLogger
  attr_accessor :use_inspect
  def initialize
    @use_inspect = false
  end

  def debug(msg = nil, progname = nil, &b)
    LTTng.notice(form_message(msg, &b))
  end
  def info(msg = nil, progname = nil, &b)
    LTTng.info(form_message(msg, &b))
  end
  def warn(msg = nil, progname = nil, &b)
    LTTng.warning(form_message(msg, &b))
  end
  def error(msg = nil, progname = nil, &b)
    LTTng.err(form_message(msg, &b))
  end
  def fatal(msg = nil, progname = nil, &b)
    LTTng.crit(form_message(msg, &b))
  end
  def unknown(msg = nil, progname = nil, &b)
    LTTng.alert(form_message(msg, &b))
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

log = LTTngLogger.new
log.info("Hello, tracelog watchers.")

