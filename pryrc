## Pry Config

Pry.config.pager = false
Pry.config.editor = "vim"
Pry.config.prompt = [proc{"? "}, proc{"| "}]

if defined?(ActiveRecord::Base)

  # Get random object
  class ActiveRecord::Base
    def self.random
      self.order("rand()").limit(1).first
    end
  end

end

# Useful collections

def a
  (1..20).to_a
end

def h
  {:hello => "world", :free => "of charge"}
end

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
