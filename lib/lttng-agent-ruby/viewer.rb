#!/usr/bin/env ruby
require 'pry'
require 'json'
require 'yaml'
require 'parslet'
include Parslet

class Trace
  attr_accessor :op, :context, :filename, :line, :method, :mesg
  def initialize(op, context, filename, line, method, mesg)
    @op, @context, @filename, @line, @method, @mesg = op, context, filename, line, method, mesg
  end
end

class RubyBacktraceParser < Parslet::Parser
  rule(:digits) { match("[0-9]").repeat }
  rule(:ops) { ( match("[bc]") >> str('_') ).maybe >> ( str("call") | str("return") | str("end") | str("line") | str("class") ) }
  rule(:context) { str(" `") >> match("[^']").repeat.as(:context) >> str("'") }
  rule(:rbmethod) { str("in `") >> match("[^']").repeat(1,nil).as(:rbmethod) >> str("'") }
  rule(:line) { ops.maybe >> context.maybe >>
                match("[^:]").repeat.as(:filename) >>
                (str(":") >> digits.as(:linenum)).maybe >> 
                str(":") >> rbmethod >> str("|") >>
                match('.').repeat.as(:mesg)  }
  rule(:root) { line }
end

class BabeltraceParser < Parslet::Parser
  rule(:digits) { match("[0-9]").repeat }
  rule(:decnum) { digits >> str(".").maybe >> digits.maybe }
  rule(:spaces) { str(' ').repeat }
  rule(:nonspace) { match('[^ ]').repeat }
  rule(:up_to_colon) { match('[^:]').repeat }
  rule(:string)  { str('"') >> ( (str('\\') >> any) | (str('"').absent? >> any) ).repeat.as(:string) >> str('"') }
  rule(:stamp) { str('[') >> digits.as(:h) >> str(':') >> digits.as(:m) >> str(':') >> decnum.as(:s)  >> str(']') }
  rule(:tdiff) { str('(') >> match('[-+]').as(:dir) >> ( ( str('?.') >> str('?').repeat ) | decnum.as(:s) ) >> str(')') }
  rule(:pairs) { nonspace.as(:key) >> spaces >> str("=") >> spaces >> ( string | digits ).as(:value) >> str(",").maybe >> spaces }
  rule(:bracket_map) { str('{') >> spaces >> pairs.repeat >> str('}') >> spaces }
  rule(:line) { stamp.as(:stamp) >> spaces >> tdiff.as(:tdiff) >> spaces >> nonspace.as(:host) >> spaces >>
                up_to_colon.as(:provider) >> str(':') >> up_to_colon.as(:level) >>
                str(': { ') >> digits.as(:n) >> str(' }, ') >>
                bracket_map.as(:pairs) }
  rule(:root) { line >> match('.').repeat }
end

class BabeltraceTransform < Parslet::Transform
  rule(h: simple(:h), m: simple(:m), s: simple(:s)) do
    (h.to_i * 60 * 60) + (m.to_i * 60) + s.to_f
  end
  rule(key: simple(:key), value: {string: simple(:value)}) do
    { key.to_s => value.to_s }
  end
  rule(key: simple(:key), value: simple(:value)) do
    { key.to_s => value.to_s }
  end
  rule(dir: simple(:dir), s: simple(:s)) do
    if dir == "+"
      sign = 1
    else
      sign = -1
    end
    s.to_f * sign
  end
  rule(n: simple(:n)) { n.to_i }
end

class LTTngTraces
  def from_io(io)
    @source = io
  end

  include Enumerable

  def parse_backtrace(line)
    begin
      bt = RubyBacktraceParser.new.parse(line)
      Trace.new(bt&.fetch(:ops, nil).to_s, bt&.fetch(:context,nil).to_s, bt&.fetch(:filename,nil).to_s,
                bt&.fetch(:linenum, nil).to_i, bt&.fetch(:rbmethod,nil).to_sym, bt&.fetch(:mesg,nil).to_s)
      #Trace.new(bt[:ops], bt[:context]
    rescue Parslet::ParseFailed => e
      puts line
      puts e.cause.ascii_tree
      binding.pry
    end
  end

  def rb_native_trace(line)
    #rx = /^\[(?<time>[^\]]+)\].*TracePoint:(?<data>.*)>" }/
    #m = rx.match(line)
    #time = m['time']
    #op_context = /(?<op>([bc]_)?(call|return|end|line|class))?( `(?<context>[^']+)')?/
    #
    parts = /#{op_context}@(?<filename>.+?):(?<line>\d+)( in `(?<method>[^']+)')?\|(?<mesg>mesg)$/.match(line)
    if parts.nil?
      binding.pry
      raise "OOPS: #{line}"
    end

    trace = Trace.new(parts['op'], parts['context'], parts['filename'], parts['line'], parts['method'])
  end

  def each
    @source.each_line.with_index do |line, i|
      begin
        babel = BabeltraceParser.new.parse(line)
      rescue Parslet::ParseFailed => e
        puts line
        puts e.cause.ascii_tree
        binding.pry
      end

      tree = BabeltraceTransform.new.apply(babel)

      # The idea of the transformer is nice...
      # but it's not so easy to use.
      if tree[:pairs['message']]
        tree[:backtrace] = parse_backtrace(tree[:pairs['message']])
      end

      tree[:pairs].inject(&:merge).each do |pair|
        k, v = pair
        if k == 'message'
          tree[:backtrace] = parse_backtrace(v)
        elsif !tree.has_key?(k)
          tree[k.to_sym] = v
        end
      end
      tree[:n] = tree[:n].to_i
      tree[:level] = tree[:level].to_sym
      tree[:provider] = tree[:provider].to_sym
      tree[:host] = tree[:host].to_s
      tree[:sourceline] = tree[:sourceline].to_i
      tree.delete(:pairs)

      yield(p)
    end
  end
end


