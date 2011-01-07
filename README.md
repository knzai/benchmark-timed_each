Install
-------
	gem install benchmark-timed_each
Use
---
	require 'benchmark/timed_each'

### Simplest case - an array of items
	array = (97..107).to_a
	Benchmark.timed_each(array) do |i|
	  print " doing stuff with #{i} "
	  sleep(0.1)
	end
	
    >Started processing collection
    >  processing 97 - doing stuff with 97 - (0.100251)
    >  processing 98 - doing stuff with 98 - (0.100237)
    >  processing 99 - doing stuff with 99 - (0.100298)
    >  processing 100 - doing stuff with 100 - (0.100258)
    >  processing 101 - doing stuff with 101 - (0.100192)
    >  processing 102 - doing stuff with 102 - (0.100307)
    >  processing 103 - doing stuff with 103 - (0.100200)
    >  processing 104 - doing stuff with 104 - (0.100105)
    >  processing 105 - doing stuff with 105 - (0.100162)
    >  processing 106 - doing stuff with 106 - (0.100247)
    >  processing 107 - doing stuff with 107 - (0.100291)
    >Finished processing collection- (1.102548)

### Hashes or other things passing multiple values to block
	hash = Hash[*array.map { |k|
	    [k, k.chr]
	}.flatten]
	Benchmark.timed_each(hash, :item_to_s => :last) do |key, value|
	  sleep(0.1)
	end
	
	>Started processing collection
	>  processing h -- (0.100102)
	>  processing c -- (0.100158)
	>  processing i -- (0.100150)
	>  processing d -- (0.100228)
	>  processing j -- (0.100162)
	>  processing e -- (0.100283)
	>  processing k -- (0.100260)
	>  processing f -- (0.100133)
	>  processing a -- (0.100212)
	>  processing g -- (0.100249)
	>  processing b -- (0.100139)
	>Finished processing collection- (1.102076)

### Options
:start\_caption, :finish\_caption, :format, :item\_to\_s
