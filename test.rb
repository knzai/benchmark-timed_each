require 'benchmark_collection'

array = (97..107).to_a

hash = Hash[*array.map { |k|
    [k, k.chr]
}.flatten]

Benchmark.collection_timer(array) do |i|
  print " doing stuff with #{i} "
  sleep(0.1)
end

Benchmark.collection_timer(hash, :item_to_s => :last) do |key, value|
 sleep(0.1)
end
