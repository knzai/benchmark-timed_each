require 'rubygems'
require 'bundler'
Bundler.setup

require 'benchmark/timed_each'

array = (97..107).to_a

hash = Hash[*array.map { |k|
    [k, k.chr]
}.flatten]

Benchmark.timed_each(array) do |i|
  print " doing stuff with #{i} "
  sleep(0.1)
end

Benchmark.timed_each(hash, :item_to_s => :last) do |key, value|
  sleep(0.1)
end
