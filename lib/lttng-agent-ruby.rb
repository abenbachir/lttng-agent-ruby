begin
  require "lttng_module"
rescue LoadError
  begin
    puts "Working around bundler issue of not copying compiled extensions into lib from gems built from git."
    puts "see: https://github.com/bundler/bundler/issues/3014"
    FileUtils.cp "../ext/lttng-agent-ruby/lttng_module.so", "lttng_module.so"
    require "lttng_module"
  rescue LoadError
    puts "Fine, I give up."
  end
end

require_relative "lttng-agent-ruby/logger"
require_relative "lttng-agent-ruby/viewer"
require_relative "lttng-agent-ruby/version"

