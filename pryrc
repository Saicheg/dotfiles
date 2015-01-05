## Pry Config

Pry.config.pager = false
Pry.config.editor = "vim"
Pry.config.prompt = [proc{"? "}, proc{"| "}]
# Pry.config.input = STDIN
# Pry.config.output = STDOUT

begin
  require 'awesome_print'
  Pry.config.print = proc { |output, value| Pry::Helpers::BaseHelpers.stagger_output("=> #{value.ai}\n", output) }
rescue LoadError => err
  puts "no awesome_print :("
end

if defined?(ActiveRecord::Base)

  # Get random object
  class ActiveRecord::Base
    def self.random
      self.order("rand()").limit(1).first
    end
  end

end

if defined?(Rails) && Rails.respond_to?(:logger)
  require 'logger'
  Rails.logger = Logger.new($stdout)
  if defined?(Mongoid)
    Mongoid.logger = Rails.logger
  end
end

# Useful collections

def a
  (1..20).to_a
end

def clean
  puts "\e[H\e[2J"
end

# def h
#   {:hello => "world", :free => "of charge"}
# end

## Benchmarking
# Inspired by <http://stackoverflow.com/questions/123494/whats-your-favourite-irb-trick/123834#123834>.

def time(repetitions = 100, &block)
  require 'benchmark'
  Benchmark.bm{|b| b.report{repetitions.times(&block)}}
end

## Odds and Ends

def beep
  putc ?\a
  nil
end
