require 'logger'

class Log
  class Formatter
    def call severity, time, progname, msg
      msg = msg.to_s.strip.gsub!(/\e\[[0-9;]*m/, '')
    end
  end

  attr_accessor :level, :formatter, :facility

  def initialize(program_name = "ruby", facility = nil)
    @level = ::Logger::DEBUG
    @formatter = Formatter.new
    @program_name = program_name
    # facility is ignored. There's really not much use for it.
  end

  def self.make_methods meth
    level = ::Logger.const_get(meth.upcase)
    eval <<-EOM, nil, __FILE__, __LINE__ + 1
      def #{meth}(message = nil, &block)
        add(#{level}, message, &block)
      end

      def #{meth}?
        @level <= #{level}
      end
    EOM
  end

  Logger::Severity::constants.each do |severity|
    make_methods severity.downcase
  end

  def add(severity, message = nil, progname = nil, &block)
    severity ||= ::Logger::UNKNOWN
    @level <= severity and
      raw_trace( (LEVEL_MAP[severity] | "info") + ":" + formatter.call(severity, Time.now, progname, (message || block.call)) )
    true
  end

  def raw_trace(s)
    LTTng.tracef(s)
  end
end
