class Trace
  attr_accessor :op, :context, :filename, :line, :method
  def initialize(op, context, filename, line, method)
    @op, @context, @filename, @line, @method = op, context, filename, line, method
  end
end

class LTTngTraces
  def each
    rx = /^\[(?<time>[^\]]+)\].*TracePoint:(?<data>.*)>" }/
    IO.popen(["lttng", "view"], 'r') do |io|
      io.each_line.with_index do |line, i|
        m = rx.match(line)
        time = m['time']
        op_context = /(?<op>([bc]_)?(call|return|end|line|class))( `(?<context>[^']+)')?/

        parts = /#{op_context}@(?<filename>.+?):(?<line>\d+)( in `(?<method>[^']+)')?$/.match(m['data'])
        if parts.nil?
          raise "OOPS: #{m[2]}"
        end

        trace = Trace.new(parts['op'], parts['context'], parts['filename'], parts['line'], parts['method'])
        yield(trace)
      end
    end
  end
end

